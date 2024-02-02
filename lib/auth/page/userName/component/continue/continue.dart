import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sirene/auth/page/userName/data/user_name_data.dart';
import 'package:sirene/callPage/call.dart';
import 'package:sirene/globalData/auth_data.dart';

class Continue extends StatefulWidget {
  const Continue({ super.key });

  @override
  State <Continue> createState() => _ContinueState();
}

class _ContinueState extends State<Continue> {
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;

    return ValueListenableBuilder(
      valueListenable: isFilled,
      builder: (context, isFilled, child) {
        if (isFilled) {
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
              await FirebaseFirestore.instance.collection("user").doc(UserData.userCredential.user.uid).set({
                "name": name,
              }, SetOptions(merge: true));

              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const Call();
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