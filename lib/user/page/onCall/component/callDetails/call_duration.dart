import 'package:flutter/material.dart';

class CallDuration extends StatefulWidget {
  const CallDuration({ super.key });

  @override
  State <CallDuration> createState() => _CallDurationState();
}

class _CallDurationState extends State<CallDuration> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "00:00",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
    );
  }
}