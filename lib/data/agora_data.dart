import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sirene/data/private.dart';
import 'firestore_data.dart';
import 'user_data.dart';

mixin AgoraData {
  static late RtcEngine agoraEngine; 
  static String channelName = "";
  static int uid = 0;
  static bool isJoin = false;

  static int callingIndex = -1;

  static void join() async {
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

  static void leave() async {
    try {
      await agoraEngine.leaveChannel();
      isJoin = false;
    }
    catch (x) {
      debugPrint("engine is not initialized yet");
    }
  }

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static showMessage(String message) {
      scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
        content: Text(message),
      ));
  }

  static Future<void> setupVoiceSDKEngine() async {
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
          await FirebaseFirestore.instance.collection("user").doc(UserData.userCredential.user.uid).set({
            "isOnCall": true,
          }, SetOptions(merge: true));
        },
        onUserJoined: (RtcConnection connection, int rUid, int elapsed) async {
          showMessage("Remote user uid:$rUid joined the channel");
          await FirebaseFirestore.instance.collection("user").doc(UserData.userCredential.user.uid).set({
            "remoteUid": rUid,
          }, SetOptions(merge: true));
        },
        onUserOffline: (RtcConnection connection, int? rUid, UserOfflineReasonType reason) async {
          showMessage("Remote user uid:$rUid left the channel");
          await FirebaseFirestore.instance.collection("user").doc(UserData.userCredential.user.uid).set({
            "remoteUid": "",
          }, SetOptions(merge: true));
          await FirestoreData.removeCallData();
          leave();
        },

        onConnectionLost: (connection) async {
          await FirestoreData.removeCallData();
          leave();
        },

        onError: (err, msg) async {
          await FirestoreData.removeCallData();
          leave();
        },
      ),
    );
  }
}