import 'package:flutter/material.dart';
import 'package:sirene/globalData/auth_data.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/globalData/position_data.dart';
import 'package:sirene/user/page/userMap/user_map.dart';
import 'package:sirene/user/page/homeCall/component/call/component/callButton/component/bg1/bg1.dart';
import 'package:sirene/user/page/homeCall/component/call/component/callButton/component/bg2/bg2.dart';
import 'package:sirene/user/page/homeCall/component/call/component/callButton/component/callButton/call_button_officer.dart';

class CallButton extends StatefulWidget {
  const CallButton({ super.key });

  @override
  State <CallButton> createState() => _CallButtonState();
}

class _CallButtonState extends State<CallButton> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Bg2(),
                        
          const Bg1(),
                        
          GestureDetector(
            onTap: () async {
    
              // await FirestoreData.user.doc(UserData.userCredential.user!.uid).set({
              //   "calling": OfficerFireStoreData.allData!.entries.elementAt(0).key,
              //   // "isOnCall": true,
              // }, SetOptions(merge: true));
    
              // await FirestoreData.officer.doc(OfficerFireStoreData.allData!.entries.elementAt(0).key).set({
              //   "calling": UserData.userCredential.user.uid,
              //   "isOnDuty": true,
              // }, SetOptions(merge: true)).then((value) {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(
              //       content: Text("Data sent"),
              //     )
              //   );
              // });

              if (userPosition["latitude"]!.isNotEmpty && userPosition["longitude"]!.isNotEmpty) {
                await FirestoreData.officer.get().then((value) {
                  officerId = value.docs.first.id;
                  officerLatitude = value.docs.first.data()["location"].latitude.toString();
                  officerLongitude = value.docs.first.data()["location"].longitude.toString();
                  debugPrint("officerid: $officerId");
                  FirestoreData.user.doc(UserData.userCredential.user.uid).update({
                    "calling": value.docs.first.id,
                  });
                  FirestoreData.officer.doc(value.docs.first.id).update({
                    "calling": UserData.userCredential.user.uid,
                    "status": "Preparing",
                    "isOnDuty": true,
                  });
                });
                
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pop();
                });

                await getPolyline(double.parse(userPosition["latitude"]!), double.parse(userPosition["longitude"]!), double.parse(officerLatitude), double.parse(officerLongitude));
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return UserMap(id: officerId);
                    },
                  ));
                });
              }
              else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please activate your location services"),
                  )
                );
              }
            },
            child: const CallButtonOfficer(),
          ),
        ],
      ),
    );
  }
}