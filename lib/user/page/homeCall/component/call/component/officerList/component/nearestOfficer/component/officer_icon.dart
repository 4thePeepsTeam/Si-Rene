import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OfficerIcon extends StatefulWidget {
  const OfficerIcon({ super.key });

  @override
  State <OfficerIcon> createState() => _OfficerIconState();
}

class _OfficerIconState extends State<OfficerIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/svg/ambulance.svg",
    );
  }
}