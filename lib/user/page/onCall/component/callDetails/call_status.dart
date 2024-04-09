import 'package:flutter/material.dart';

class CallStatus extends StatefulWidget {
  const CallStatus({ super.key });

  @override
  State <CallStatus> createState() => _CallStatusState();
}

class _CallStatusState extends State<CallStatus> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "Call",
      style: TextStyle(
        fontSize: 9,
        color: Color.fromRGBO(13, 1, 6, 1), 
      ),
    );
  }
}