import 'package:flutter/material.dart';

class CallText extends StatelessWidget {
const CallText({ super.key });

  @override
  Widget build(BuildContext context){
    return const Text(
      "Call Ambulance",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 10,
        color: Colors.white,
      ),
    );
  }
}