import 'package:flutter/material.dart';

class AmbulanceBackground extends StatelessWidget {
const AmbulanceBackground({ super.key });

  @override
  Widget build(BuildContext context){
    return Center(
      child: Image.asset(
        "assets/svg/ambulance_background.png",
      ),
    );
  }
}