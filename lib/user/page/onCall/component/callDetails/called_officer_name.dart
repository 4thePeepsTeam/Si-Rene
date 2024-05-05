import 'package:flutter/material.dart';
import 'package:sirene/globalData/position_data.dart';

class CalledOfficerName extends StatefulWidget {
  const CalledOfficerName({ super.key });

  @override
  State <CalledOfficerName> createState() => _CalledOfficerNameState();
}

class _CalledOfficerNameState extends State<CalledOfficerName> {
  @override
  Widget build(BuildContext context) {
    return Text(
      officerName,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}