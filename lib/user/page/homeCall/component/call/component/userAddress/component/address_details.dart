import 'package:flutter/material.dart';
import 'package:sirene/globalData/position_data.dart';

class AddressDetails extends StatefulWidget {
  const AddressDetails({ super.key });

  @override
  State <AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: ListenableBuilder(
          listenable: userPositionValue,
          builder: (context, child) {
            return Text(
              "${userPositionValue.latitude}, ${userPositionValue.longitude}",
              style: const TextStyle(
                fontSize: 14,
              color: Color.fromRGBO(1, 67, 97, 1),
              ),
            );
          },
        ),
      ),
    );
  }
}