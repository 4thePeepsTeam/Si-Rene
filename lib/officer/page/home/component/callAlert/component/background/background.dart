import 'dart:ui';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
const Background({ super.key });

  @override
  Widget build(BuildContext context){

    Size size = MediaQuery.of(context).size;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        width: size.width,
        height: size.height,
        color: const Color.fromRGBO(0, 0, 0, 0.2),
      ),
    );
  }
}