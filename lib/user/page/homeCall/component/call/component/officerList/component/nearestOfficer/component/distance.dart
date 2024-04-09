import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Distance extends StatefulWidget {
  const Distance({
    super.key,
    required this.snapshot,
    required this.index,
  });

  final AsyncSnapshot<Response<dynamic>> snapshot;
  final int index;

  @override
  State <Distance> createState() => _DistanceState();
}

class _DistanceState extends State<Distance> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg/distance.svg",
            width: 20,
            height: 20,
          ),
          Text(
            "${widget.snapshot.data!.data["data"].elementAt(widget.index)["routes"]["distanceMeters"]} m",                                                         style: const TextStyle(
              fontSize: 10,
              color: Color.fromRGBO(255, 87, 20, 1),
            ),
          )
        ],
      )
    );
  }
}