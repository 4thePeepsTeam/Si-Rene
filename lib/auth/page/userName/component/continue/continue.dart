import 'package:flutter/material.dart';

class Continue extends StatefulWidget {
  const Continue({ super.key });

  @override
  State <Continue> createState() => _ContinueState();
}

class _ContinueState extends State<Continue> {
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 87, 20, 0.5),
        borderRadius: BorderRadius.circular(size.height),
      ),
      child: const Center(
        child: Text(
          "Continue",
          style: TextStyle(
            color: Color.fromRGBO(255, 254, 251, 0.5),
            fontSize: 14,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}