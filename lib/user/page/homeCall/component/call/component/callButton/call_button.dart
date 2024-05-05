import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sirene/globalData/agora_data.dart';
import 'package:sirene/globalData/user_data.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/globalData/position_data.dart';
import 'package:sirene/user/data/user_data.dart';
import 'package:sirene/user/page/onCall/on_call.dart';
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
              if (userPosition["latitude"]!.isNotEmpty && userPosition["longitude"]!.isNotEmpty) {

                isCalling.value = true;
                await AgoraData.setupVoiceSDKEngine();
                AgoraData.channelName = UserData.userCredential.user.uid;
      
                await FirestoreData.user.doc(UserData.userCredential.user!.uid).set({
                  "calling": officerId,
                  "isOnCall": true,
                }, SetOptions(merge: true));
                
                await FirestoreData.officer.doc(officerId).set({
                  "calling": UserData.userCredential.user.uid,
                  "getCall": true,
                  "isOnDuty": true,
                  "status": "Preparing",
                }, SetOptions(merge: true));

                debugPrint("channel name: $AgoraData.channelName");
                // AgoraData.callingIndex = 0;
                // debugPrint("calling index: 0");
                AgoraData.join();

                if (!context.mounted) {
                  return;
                }
                else {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return const OnCall();
                      },
                  ));
                }
                return;
                // await FirestoreData.officer.doc(UserData.officerToCall).get().then((value) {
                //   officerLatitude = value.data()!["location"].latitude.toString();
                //   officerLongitude = value.data()!["location"].longitude.toString();
                //   debugPrint("officerid: $officerId");
                //   FirestoreData.user.doc(UserData.userCredential.user.uid).update({
                //     "calling": UserData.officerToCall,
                //   });
                //   FirestoreData.officer.doc(UserData.officerToCall).update({
                //     "calling": UserData.userCredential.user.uid,
                //     "status": "Preparing",
                //     "isOnDuty": true,
                //   });
                // });
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