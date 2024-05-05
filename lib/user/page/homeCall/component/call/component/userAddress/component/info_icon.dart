import 'package:flutter/material.dart';

class InfoIcon extends StatelessWidget {
const InfoIcon({ super.key });

  @override
  Widget build(BuildContext context){
    return const Align(
      alignment: Alignment.topCenter,
      child: Icon(
        Icons.info_outlined,
        color: Color.fromRGBO(2, 136, 209, 1),
      ),
    );
  }
}