import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/globalData/position_data.dart';

class AddressDetails extends StatefulWidget {
  const AddressDetails({ super.key });

  @override
  State <AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {

  Future <Response <dynamic>> getData() async {
    return await getLocation(double.parse(userPositionValue.latitude), double.parse(userPositionValue.longitude));
  }

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
            if (userPositionValue.latitude != "" && userPositionValue.longitude != "") {
              return FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    debugPrint(snapshot.data!.data["results"].elementAt(0)["formatted_address"]);
                  }
                  return Text(
                    "${snapshot.data!.data["results"].elementAt(0)["formatted_address"]}",
                    style: const TextStyle(
                      fontSize: 14,
                    color: Color.fromRGBO(1, 67, 97, 1),
                    ),
                  );
                },
              );
            }

            return const Text(
              "Getting Location...",
              style: TextStyle(
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