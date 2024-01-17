import 'package:flutter/material.dart';
import 'package:sirene/data/agora_data.dart';
import 'package:sirene/data/firestore_data.dart';
import 'package:sirene/data/auth_data.dart';

class LoginButton extends StatelessWidget {
const LoginButton({ 
  super.key,
  required this.buttonColor,
  required this.borderColor,
  required this.buttonText,
  required this.textColor, 
  required this.widget,
});

final Color buttonColor;
final Color borderColor;
final String buttonText;
final Color textColor;
final Widget widget;

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
        UserData.userCredential = await UserData.signInWithGoogle();
        if (UserData.isLoginSuccess()) {
          await UserData.uploadDataIfFirstTime(); 
          await FirestoreData.removeCallData();
          AgoraData.leave();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return widget;
              },
            ),
          );
        }   
      },
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor
          ),
        ),
      ),
    );
  }
}