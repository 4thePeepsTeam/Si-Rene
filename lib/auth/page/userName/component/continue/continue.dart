import 'package:flutter/material.dart';
import 'package:sirene/auth/page/userName/data/user_name_data.dart';
import 'package:sirene/globalData/auth_data.dart';
import 'package:sirene/globalData/firestore_data.dart';

class Continue extends StatefulWidget {
  const Continue({
    super.key,
    required this.nextPage,
  });

  final Widget nextPage;

  @override
  State <Continue> createState() => _ContinueState();
}

class _ContinueState extends State<Continue> {
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;

    return ValueListenableBuilder(
      valueListenable: isFilled,
      builder: (context, value, child) {
        if (value) {
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
              if (UserData.userRole == "user") {
                await FirestoreData.user.doc(UserData.userCredential.user.uid).set({
                  "name": name,
                  "isOnCall": false,
                  "remoteUid": "",
                  "calling": "",
                });
              }
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return widget.nextPage;
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