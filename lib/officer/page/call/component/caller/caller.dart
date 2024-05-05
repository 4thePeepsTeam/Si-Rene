import 'package:flutter/material.dart';
import 'package:sirene/globalData/firestore_data.dart';

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
      child: Column(
        children: [
          Text(
            OfficerFireStoreData.callerName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
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