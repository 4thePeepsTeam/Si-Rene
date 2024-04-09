import 'package:flutter/material.dart';

class CallIcon extends StatefulWidget {
  const CallIcon({ super.key });

  @override
  State <CallIcon> createState() => _CallIconState();
}

class _CallIconState extends State<CallIcon> {
  @override
  Widget build(BuildContext context){

    Size size = MediaQuery.of(context).size;

    return Icon(
      Icons.call_rounded,
      color: Colors.white,
      size: size.width * 0.125,
    );
  }
}