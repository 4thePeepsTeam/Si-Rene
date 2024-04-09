import 'package:flutter/material.dart';

class CalledOfficerName extends StatefulWidget {
  const CalledOfficerName({ super.key });

  @override
  State <CalledOfficerName> createState() => _CalledOfficerNameState();
}

class _CalledOfficerNameState extends State<CalledOfficerName> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "Ahmad Bagas Aditya",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}