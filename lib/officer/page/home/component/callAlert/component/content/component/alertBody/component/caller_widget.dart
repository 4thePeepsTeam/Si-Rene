import 'package:flutter/material.dart';
import 'package:sirene/globalData/firestore_data.dart';

class CallerWidget extends StatefulWidget {
  const CallerWidget({ super.key });

  @override
  State <CallerWidget> createState() => _CallerWidgetState();
}

class _CallerWidgetState extends State<CallerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "Incoming Call",
          style: TextStyle(
            color: Color.fromRGBO(13, 1, 6, 1),
            fontSize: 12,
          ),
        ),

        Text(
          OfficerFireStoreData.callerName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}