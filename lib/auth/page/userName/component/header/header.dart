import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({
     super.key,
     required this.description,
  });

  final String description;

  @override
  State <Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Fill your Name",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromRGBO(13, 1, 6, 1),
            fontWeight: FontWeight.w500,
          ),
        ),
    
        const SizedBox(height: 10),
    
        Text(
          widget.description,
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(13, 1, 6, 0.5),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}