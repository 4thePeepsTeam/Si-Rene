import 'package:flutter/material.dart';

class CallHeader extends StatefulWidget {
  const CallHeader({ super.key });

  @override
  State <CallHeader> createState() => _CallHeaderState();
}

class _CallHeaderState extends State<CallHeader> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Call Ambulance",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
    
        Text(
          "Press the button to find the nearest ambulance for help",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            color: Color.fromRGBO(13, 1, 6, 1),
          )
        ),
      ],
    );
  }
}