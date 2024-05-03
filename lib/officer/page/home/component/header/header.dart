import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sirene/globalData/user_data.dart';

class Header extends StatefulWidget {
  const Header({ super.key });

  @override
  State <Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg/officer_header.svg",
            height: size.height * 0.05,
          ),

          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              bool result = await UserData.signOutFromGoogle();
              if (result) {
                UserData.userCredential = "";
              }
              WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.of(context).pop());
            },
          ),
        ],
      ),
    );
  }
}