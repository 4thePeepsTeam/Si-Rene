import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sirene/private.dart';

var userCredential;

late RtcEngine agoraEngine; 
String channelName = "";
int uid = 0;
bool isJoin = false;


Stream <QuerySnapshot<Object?>> dataFireStore = FirebaseFirestore.instance.collection('user').snapshots();

Map <String, dynamic> otherData = {};
Map <String, dynamic> yourData = {};
Map <String, dynamic> allData = {};

int callingIndex = -1;

getFireData(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) async {

  var anything = snapshot.data!.docs.map((e) => {e.id: e.data() as Map <String, dynamic>}).toList();

  anything.forEach((element) {
    allData.addAll(element);
  });

  otherData.addAll(allData);
  yourData.addAll(allData);

  yourData.removeWhere((key, value) => key != userCredential.user!.uid); // isinya diri sendiri
  otherData.removeWhere((key, value) => key == userCredential.user!.uid); // selain  diri sendiiri

  print("anything: $anything");
  print("allData: $allData");
  print("yourData: $yourData");
  print("otherData: $otherData");
}

Future <void> removeCallData () async {

  try {
    if (callingIndex != -1) {
      await FirebaseFirestore.instance.collection("user").doc(otherData.entries.elementAt(callingIndex).key).set({
        "caller": "",
        "isOnCall": false,
        "remoteUid": "",
        "calling": "",
      }, SetOptions(merge: true));
    }
  } 
  catch (e) {
    print("data is not initialized yet");
  }

  try {
    await FirebaseFirestore.instance.collection("user").doc(yourData.entries.elementAt(0).key).set({
      "caller": "",
      "isOnCall": false,
      "remoteUid": "",
      "calling": "",
    }, SetOptions(merge: true));
  }
  catch (e) {
    print("data is not initialized yet");
  }
}

void  join() async {
    // Set channel options including the client role and channel profile
    ChannelMediaOptions options = const ChannelMediaOptions(
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
        channelProfile: ChannelProfileType.channelProfileCommunication,
    );

    await agoraEngine.joinChannel(
        token: "",
        channelId: channelName,
        options: options,
        uid: uid,
    );
  }

  void leave() async {
    try {
      await agoraEngine.leaveChannel();
      isJoin = false;
    }
    catch (x) {
      print("engine is not initialized yet");
    }
  }

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

    showMessage(String message) {
        scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
          content: Text(message),
        ));
    }

Future<void> setupVoiceSDKEngine() async {
  // retrieve or request microphone permission
  await [Permission.microphone].request();

  //create an instance of the Agora engine
  agoraEngine = createAgoraRtcEngine();
  await agoraEngine.initialize(const RtcEngineContext(
      appId: appId
  ));

  // Register the event handler
  agoraEngine.registerEventHandler(
  RtcEngineEventHandler(
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) async {
        showMessage("Local user uid:${connection.localUid} joined the channel");
        await FirebaseFirestore.instance.collection("user").doc(userCredential.user.uid).set({
          "isOnCall": true,
        }, SetOptions(merge: true));
      },
      onUserJoined: (RtcConnection connection, int rUid, int elapsed) async {
        showMessage("Remote user uid:$rUid joined the channel");
        await FirebaseFirestore.instance.collection("user").doc(userCredential.user.uid).set({
          "remoteUid": rUid,
        }, SetOptions(merge: true));
      },
      onUserOffline: (RtcConnection connection, int? rUid, UserOfflineReasonType reason) async {
        showMessage("Remote user uid:$rUid left the channel");
        await FirebaseFirestore.instance.collection("user").doc(userCredential.user.uid).set({
          "remoteUid": "",
        }, SetOptions(merge: true));
        await removeCallData();
        leave();
      },

      onConnectionLost: (connection) async {
        await removeCallData();
        leave();
      },

      onError: (err, msg) async {
        await removeCallData();
        leave();
      },
    ),
  );
}