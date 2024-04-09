import 'package:flutter/material.dart';

class AddressDetails extends StatefulWidget {
  const AddressDetails({ super.key });

  @override
  State <AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Text(
          "Jl. Taman Mini Indonesia Indah, Ceger, Kec. Cipayung, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13820",
          style: TextStyle(
            fontSize: 14,
          color: Color.fromRGBO(1, 67, 97, 1),
          ),
        ),
      ),
    );
  }
}