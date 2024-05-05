import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OfficerName extends StatefulWidget {
  const OfficerName({
    super.key,
    required this.snapshot,
    required this.index,
  });

  final AsyncSnapshot<Response<dynamic>> snapshot;
  final int index;

  @override
  State <OfficerName> createState() => _OfficerNameState();
}

class _OfficerNameState extends State<OfficerName> {
  @override
  Widget build(BuildContext context) {
    return Text("${widget.snapshot.data!.data["data"].elementAt(widget.index)["name"]}");
  }
}