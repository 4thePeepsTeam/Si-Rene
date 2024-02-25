import 'package:flutter/material.dart';
import 'package:sirene/auth/page/auth/component/bottomText/bottom_text.dart';
import 'package:sirene/auth/page/auth/component/headerLogo/header_logo.dart';
import 'package:sirene/auth/page/auth/component/loginButton/login_button.dart';
import 'package:sirene/callPage/call.dart';
import 'package:sirene/officer/page/home/home_page.dart';
import 'package:sirene/globalData/theme_data.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({ super.key });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

 @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: whiteColor,
      // ignore: sized_box_for_whitespace
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
        
              const Expanded(
                flex: 1,
                child: HeaderLogo()
              ),
        
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LoginButton(
                        borderColor: Colors.transparent,
                        buttonColor: orangeColor,
                        buttonText: "Continue with Google as User",
                        textColor: whiteColor,
                        role: "user",
                        widget: const Call(),
                      ),
              
                      const SizedBox(height: 10),
        
                      LoginButton(
                        borderColor: orangeColor,
                        buttonColor: whiteColor,
                        buttonText: "Continue with Google as Officer",
                        textColor: orangeColor,
                        role: "officer",
                        widget: const HomePageOfficer(),
                      ),
        
                      const SizedBox(height: 20),
        
                      const BottomText(),
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}