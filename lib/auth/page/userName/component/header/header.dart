import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({ super.key });

  @override
  State <Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Fill your Name",
            style: TextStyle(
              fontSize: 24,
              color: Color.fromRGBO(13, 1, 6, 1),
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "Enter your full name as identification by the\nofficer",
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(13, 1, 6, 0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}