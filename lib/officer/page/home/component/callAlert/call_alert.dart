import 'package:flutter/material.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/officer/page/home/component/callAlert/component/background/background.dart';
import 'package:sirene/officer/page/home/component/callAlert/component/content/content.dart';

class CallAlert extends StatefulWidget {
  const CallAlert({ super.key });

  @override
  State <CallAlert> createState() => _CallAlertState();
}

class _CallAlertState extends State<CallAlert> {

  bool isGetCall() {
    return FirestoreData.yourData.entries.elementAt(0).value["isOnCall"];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreData.dataFireStore,
      builder: (context, snapshot) {

        if (snapshot.hasData) {
          FirestoreData.getFireData(snapshot);

          if (isGetCall()) {
            return const Stack(
              children: [
                Background(),

                Content(),
              ],
            );
          }
          
          return const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}