import 'package:flutter/material.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/officer/page/home/component/call_alert/background/blur_widget.dart';
import 'package:sirene/officer/page/home/component/call_alert/content/content_widget.dart';

class CallAlert extends StatefulWidget {
  const CallAlert({ super.key });

  @override
  State <CallAlert> createState() => _CallAlertState();
}

class _CallAlertState extends State<CallAlert> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreData.dataFireStore,
      builder: (context, snapshot) {

        if (snapshot.hasData) {
          FirestoreData.getFireData(snapshot);

          if (FirestoreData.yourData.entries.elementAt(0).value["isOnCall"]) {
            return const Stack(
              children: [
                BlurWidget(),

                ContentWidget(),
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