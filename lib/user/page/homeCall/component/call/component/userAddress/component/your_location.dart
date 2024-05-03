import 'package:flutter/material.dart';

class YourLocation extends StatelessWidget {
const YourLocation({ super.key });

  @override
  Widget build(BuildContext context){
    return const Align(
      alignment: Alignment.topLeft,
      child: Text(
        "Your Location",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(1, 67, 97, 1),
        ),
      ),
    );
  }
}