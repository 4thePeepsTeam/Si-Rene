import 'package:flutter/material.dart';
import 'package:sirene/globalData/auth_data.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/officer/data/officer_data.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:sirene/officer/page/map/data/map_data.dart';

class SlideToRespond extends StatefulWidget {
  const SlideToRespond({ super.key });

  @override
  State <SlideToRespond> createState() => _SlideToRespondState();
}

class _SlideToRespondState extends State<SlideToRespond> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 254, 251, 1),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, -2),
            blurRadius: 30
          ),
        ],
      ),
      child: ValueListenableBuilder(
        valueListenable: slideNumber,
        builder: (context, value, child) {
          if (value == 0) {
            return SlideAction(
              outerColor: const Color.fromRGBO(255, 87, 20, 1),
              sliderButtonIcon: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Color.fromRGBO(255, 87, 20, 1),
                size: 16,
              ),
              onSubmit: () async {
                await FirestoreData.officer.doc(UserData.userCredential.user.uid).update({
                  "status": "On The Way",
                });
                return Future.delayed(const Duration(seconds: 2), () {
                  slideNumber.value++;
                });
              },
              sliderRotate: false,
              elevation: 0,
              sliderButtonIconPadding: 10,
              borderRadius: 12.5,
              text: "Start Journey",
              textStyle: const TextStyle(
                fontSize: 12,
                color: Colors.white
              ),
            );
          }

          if (value == 1) {
            return SlideAction(
              outerColor: const Color.fromRGBO(255, 87, 20, 1),
              sliderButtonIcon: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Color.fromRGBO(255, 87, 20, 1),
                size: 16,
              ),
              onSubmit: () async {
                await FirestoreData.officer.doc(UserData.userCredential.user.uid).update({
                  "status": "Arrived",
                });

                return Future.delayed(const Duration(seconds: 2), () {
                  slideNumber.value++;
                });
              },
              sliderRotate: false,
              elevation: 0,
              sliderButtonIconPadding: 10,
              borderRadius: 12.5,
              text: "Mark As Arrived",
              textStyle: const TextStyle(
                fontSize: 12,
                color: Colors.white
              ),
            );
          }

          return SlideAction(
            outerColor: const Color.fromRGBO(255, 87, 20, 1),
            sliderButtonIcon: const Icon(
              Icons.arrow_forward_ios_sharp,
              color: Color.fromRGBO(255, 87, 20, 1),
              size: 16,
            ),
            onSubmit: () async {
              await FirestoreData.officer.doc(UserData.userCredential.user.uid).update({
                "status": "Completed",
              });

               await FirestoreData.officer.doc(UserData.userCredential.user.uid).get().then((value) {
                  FirestoreData.user.doc(value.data()!["calling"]).update({
                    "calling": "",
                  });
                  FirestoreData.officer.doc(UserData.userCredential.user.uid).update({
                    "calling": "",
                    "status": "",
                    "isOnDuty": false,
                  });
                });

              return Future.delayed(const Duration(seconds: 2), () {
                slideNumber.value = 0;
                hasOrder.value = false;
                Navigator.of(context).pop();
              });
            },
            sliderRotate: false,
            elevation: 0,
            sliderButtonIconPadding: 10,
            borderRadius: 12.5,
            text: "Mark As Done",
            textStyle: const TextStyle(
              fontSize: 12,
              color: Colors.white
            ),
          );

        },
      ),
    );
  }
}