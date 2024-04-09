import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sirene/auth/page/officerRole/data/officer_data.dart';
import 'package:sirene/auth/page/userName/data/user_name_data.dart';
import 'package:sirene/globalData/auth_data.dart';
import 'package:sirene/officer/page/home/home_page.dart';

class Continue extends StatefulWidget {
  const Continue({super.key});

  @override
  State <Continue> createState() => _ContinueState();
}

class _ContinueState extends State<Continue> {

  String role = "";

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;

    return ListenableBuilder(
      listenable: officerRole,
      builder: (context, child) {
        if (officerRole.isAmbulanceOperator.value || officerRole.isFirefighter.value || officerRole.isPolice.value) {
          return ElevatedButton(
            style: ButtonStyle(
              padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
              shadowColor: const MaterialStatePropertyAll(Colors.transparent),
              backgroundColor: const MaterialStatePropertyAll(Color.fromRGBO(255, 87, 20, 1)),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size.height),
                ),
              ),
            ),
            onPressed: () async {

              if (officerRole.isAmbulanceOperator.value) {
                role = "ambulance operator";
              }

              if (officerRole.isFirefighter.value) {
                role = "firefighter";
              }

              if (officerRole.isPolice.value) {
                role = "police";
              }

              await FirebaseFirestore.instance.collection("officer").doc(UserData.userCredential.user.uid).get().then((value) async {
                if (!value.exists) {
                  debugPrint("value not existed yet");
                  UserData.firstTime = true;
                  await FirebaseFirestore.instance.collection("officer").doc(UserData.userCredential.user.uid).set({
                    "caller": "",
                    "calling": "",
                    "isOnCall": false,
                    "isOnDuty": false,
                    // "location": GeoPoint(position.value.latitude, position.value.longitude),
                    "name": name,
                    "phoneNumber": "",
                    "remoteUid": "",
                    "role": role,
                  });
                }
                else {
                  UserData.firstTime = false;
                }
              });

              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomePageOfficer();
                    },
                  ),
                );
              });
            },
            child: const Center(
              child: Text(
                "Continue",
                style: TextStyle(
                  color: Color.fromRGBO(255, 254, 251, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          );
        }

        return Container(
          width: size.width,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 87, 20, 0.5),
            borderRadius: BorderRadius.circular(size.height),
          ),
          child: const Center(
            child: Text(
              "Continue",
              style: TextStyle(
                color: Color.fromRGBO(255, 254, 251, 0.5),
                fontSize: 14,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        );
      },
    );
  }
}