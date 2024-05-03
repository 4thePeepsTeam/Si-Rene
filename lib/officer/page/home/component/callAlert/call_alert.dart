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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: OfficerFireStoreData.dataFireStore,
      builder: (context, snapshot) {

        if (snapshot.hasData) {
          OfficerFireStoreData.getFireData(snapshot);
          debugPrint("${OfficerFireStoreData.yourData!["calling"]}");
          if (OfficerFireStoreData.isGetCall()) {
            return StreamBuilder(
              stream: OfficerFireStoreData.callerData,
              builder: (context, snapshot) {
                debugPrint("getting call");
                if (snapshot.hasData) {
                  OfficerFireStoreData.callerName = snapshot.data!.data()!["name"];
                  return const Stack(
                    children: [
                      Background(),
                  
                      Content(),
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
            );
          }
          
          return const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}