import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget({ super.key });

  @override
  State <LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return SvgPicture.asset(
      "assets/svg/logo.svg",
      width: size.width * 0.4,
    );
  }
}