import 'package:flutter/material.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/globalData/position_data.dart';
import 'package:sirene/user/page/onCall/component/callButton/call_utilities.dart';
import 'package:sirene/user/page/onCall/component/callDetails/call_duration.dart';
import 'package:sirene/user/page/onCall/component/callDetails/call_status.dart';
import 'package:sirene/user/page/onCall/component/callDetails/called_officer_name.dart';
import 'package:sirene/user/page/userMap/user_map.dart';

class OnCall extends StatefulWidget {
  const OnCall({ super.key });

  @override
  State <OnCall> createState() => _OnCallState();
}

class _OnCallState extends State<OnCall> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: StreamBuilder(
        stream: FirestoreData.userDataFireStore,
        builder: (context, snapshot) {
          // debugPrint("is has data ${snapshot.hasData.toString()}");
          if (snapshot.hasData) {
            // debugPrint("gotcha ${snapshot.data!.data()!["isOnCall"]}");
            if (snapshot.data!.data()!["isOnCall"]) {
              return SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: size.width,
                      child: const Column(
                        children: [
                          CalledOfficerName(),
            
                          SizedBox(height: 15),
            
                          CallStatus(),
                        ],
                      ),
                    ),
            
                    const CallDuration(),
            
                    const CallUtilities(),
                  ],
                ),
              );
            }

            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   Navigator.of(context).pop();
            // });
      
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await getPolyline(double.parse(userPosition["latitude"]!), double.parse(userPosition["longitude"]!), double.parse(officerLatitude), double.parse(officerLongitude));
              if (!context.mounted) {
                return;
              }
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return UserMap(id: officerId);
                  },
              ));
            });
            return const SizedBox.shrink();
          }
      
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}