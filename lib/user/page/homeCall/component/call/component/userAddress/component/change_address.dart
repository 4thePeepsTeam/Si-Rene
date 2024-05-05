import 'package:flutter/material.dart';

class ChangeAddress extends StatefulWidget {
  const ChangeAddress({ super.key });

  @override
  State <ChangeAddress> createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Text(
        "CHANGE", 
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(2, 136, 209, 1),
        ),
      ),
    );
  }
}