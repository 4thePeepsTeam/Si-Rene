import 'package:flutter/material.dart';

class CallerWidget extends StatefulWidget {
  const CallerWidget({ super.key });

  @override
  State <CallerWidget> createState() => _CallerWidgetState();
}

class _CallerWidgetState extends State<CallerWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Incoming Call",
          style: TextStyle(
            color: Color.fromRGBO(13, 1, 6, 1),
            fontSize: 12,
          ),
        ),

        Text(
          "Ahmad Bagas Aditya",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}