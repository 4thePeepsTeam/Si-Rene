import 'package:flutter/material.dart';

class OfficerAddress extends StatefulWidget {
  const OfficerAddress({ super.key });

  @override
  State <OfficerAddress> createState() => _OfficerAddressState();
}

class _OfficerAddressState extends State<OfficerAddress> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "Kota Semarang, Jawa Tengah",
      style: TextStyle(
        fontSize: 10,
        color: Color.fromRGBO(13, 1, 6, 1),
      ),
    );
  }
}