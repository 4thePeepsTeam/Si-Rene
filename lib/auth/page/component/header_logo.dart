import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderLogo extends StatefulWidget {
  const HeaderLogo({ super.key });

  @override
  State <HeaderLogo> createState() => _HeaderLogoState();
}

class _HeaderLogoState extends State<HeaderLogo> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SvgPicture.asset(
      "assets/svg/auth_background.svg",
      width: size.width * 0.6,
      alignment: Alignment.bottomCenter,
    );
  }
}