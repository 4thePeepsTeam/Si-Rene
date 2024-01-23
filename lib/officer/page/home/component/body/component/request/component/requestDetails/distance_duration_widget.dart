import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DistanceDurationWidget extends StatelessWidget {
const DistanceDurationWidget({ super.key });

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        const Icon(
          Icons.map,
          size: 18,
          color: Color.fromRGBO(255, 87, 20, 1),
        ),
        
        const SizedBox(width: 10),

        const Text(
          "1 Km",
          style: TextStyle(
            fontSize: 12,
          ),
        ),

        const SizedBox(width: 10),

        SvgPicture.asset(
          "assets/svg/avg_pace.svg",
          width: 18,
        ),
        
        const SizedBox(width: 10),

        const Text(
          "5 mnt",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}