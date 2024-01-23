import 'package:flutter/material.dart';

class NameWidget extends StatelessWidget {
const NameWidget({ super.key });

  @override
  Widget build(BuildContext context){
    return const Text(
      "Ahmad Bagas Aditya",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16, 
      ),
    );
  }
}