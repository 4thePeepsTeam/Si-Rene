import 'package:flutter/material.dart';
import 'package:sirene/globalData/agora_data.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/officer/page/call/component/callAction/call_action.dart';
import 'package:sirene/officer/page/call/component/caller/caller.dart';
import 'package:sirene/officer/page/call/component/time/time.dart';

class CallPage extends StatefulWidget {
  const CallPage({ super.key });

  @override
  State <CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return StreamBuilder(
      stream: FirestoreData.dataFireStore,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          FirestoreData.getFireData(snapshot);
          if (FirestoreData.yourData.entries.elementAt(0).value["isOnCall"]) {
            return Scaffold(
              body: SizedBox(
                width: size.width,
                height: size.height,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Caller(),
            
                    Time(),
            
                    CallAction(),
                  ],
                ),
              ),
            );
          }
          else {
            AgoraData.channelName = "";
            debugPrint("channel name: ${AgoraData.channelName}");
            AgoraData.leave();
            Navigator.of(context).pop();
          }
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}