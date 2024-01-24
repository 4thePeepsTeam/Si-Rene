import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  const Time({ super.key });

  @override
  State <Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
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