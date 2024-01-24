import 'package:flutter/material.dart';

class Caller extends StatefulWidget {
  const Caller({ super.key });

  @override
  State <Caller> createState() => _CallerState();
}

class _CallerState extends State<Caller> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      child: const Column(
        children: [
          Text(
            "Ahmad Bagas Aditya",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 15),

          Text(
            "Call",
            style: TextStyle(
              fontSize: 9,
              color: Color.fromRGBO(13, 1, 6, 1), 
            ),
          )
        ],
      ),
    );
  }
}