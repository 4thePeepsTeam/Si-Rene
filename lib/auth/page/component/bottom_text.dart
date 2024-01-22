import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
const BottomText({ super.key });

  @override
  Widget build(BuildContext context){
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          children: [
            TextSpan(
              text: "By signing up, you agree to the ",
              style: TextStyle(
                color: Color.fromRGBO(13, 1, 6, 1),
                fontSize: 9,
              ),
            ),

            TextSpan(
              text: "Terms of Service ",
              style: TextStyle(
                color: Color.fromRGBO(255, 87, 20, 1),
                fontSize: 9,
              ),
            ),

            TextSpan(
              text: "and\n",
              style: TextStyle(
                color: Color.fromRGBO(13, 1, 6, 1),
                fontSize: 9,
              ),
            ),

            TextSpan(
              text: "Privacy Policy",
              style: TextStyle(
                color: Color.fromRGBO(255, 87, 20, 1),
                fontSize: 9,
              ),
            ),

            TextSpan(
              text: ", including Cookie Use",
              style: TextStyle(
                color: Color.fromRGBO(13, 1, 6, 1),
                fontSize: 9,
              ),
            ),
          ]
        ),
      )
      );
  }
}