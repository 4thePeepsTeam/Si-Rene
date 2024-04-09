import 'package:flutter/material.dart';
import 'package:sirene/auth/page/officerRole/officer_role_page.dart';
import 'package:sirene/auth/page/userName/user_name_page.dart';
import 'package:sirene/user/page/homeCall/component/call/call.dart';
import 'package:sirene/globalData/agora_data.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/globalData/auth_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sirene/globalData/theme_data.dart';  

class LoginButton extends StatelessWidget {
const LoginButton({ 
  super.key,
  required this.buttonColor,
  required this.borderColor,
  required this.buttonText,
  required this.textColor, 
  required this.widget,
  required this.role,
});

final Color buttonColor;
final Color borderColor;
final String buttonText;
final Color textColor;
final Widget widget;
final String role;

  @override
  Widget build(BuildContext context){

    Size size = MediaQuery.of(context).size;
    
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(Size(size.width, size.height * 0.08)),
        surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
        backgroundColor: MaterialStatePropertyAll(buttonColor),
        side: MaterialStatePropertyAll(
          BorderSide(
            color: borderColor,
          ),
        ),
      ),
        onPressed: () async {
        UserData.userRole = role;
        UserData.userCredential = await UserData.signInWithGoogle();
        if (UserData.isLoginSuccess()) {
          await UserData.uploadDataIfFirstTime(); 
          await FirestoreData.removeCallData();
          AgoraData.leave();
          UserData.userRole = role;
          // position.value = getCurrentPosition();
          if (UserData.firstTime && role == "user") {
            await Future.delayed(Duration.zero, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const UserNamePage(
                      description: "Enter your full name as identification by the\nofficer",
                      nextPage: Call(),
                    );
                  },
                ),
              );
            });
          }
          else if (UserData.firstTime && role == "officer") {
            await Future.delayed(Duration.zero, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const UserNamePage(
                      description: "Enter your full name as identification",
                      nextPage: OfficerRolePage(),
                    );
                  },
                ),
              );
            });
          }
          else {
            await Future.delayed(Duration.zero, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return widget;
                  },
                ),
              );
            });
          }
        }   
      },
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              buttonColor == whiteColor ? "assets/svg/google_orange.svg" : "assets/svg/google_white.svg",
            ),

            const SizedBox(width: 10),

            Text(
              buttonText,
              style: TextStyle(
                color: textColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}