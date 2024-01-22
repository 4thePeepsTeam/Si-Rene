import 'package:flutter/material.dart';
import 'package:sirene/auth/page/component/bottom_text.dart';
import 'package:sirene/auth/page/component/header_logo.dart';
import 'package:sirene/callPage/home_call.dart';
import 'package:sirene/auth/page/component/login_button.dart';
import 'package:sirene/officer/page/home/home_page.dart';

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
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      // ignore: sized_box_for_whitespace
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: const Column(
            children: [
        
              Expanded(
                flex: 1,
                child: HeaderLogo()
              ),
        
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LoginButton(
                        borderColor: Colors.transparent,
                        buttonColor: Color.fromRGBO(255, 87, 20, 1),
                        buttonText: "Continue with Google as User",
                        textColor: Colors.white,
                        widget: HomeCall(),
                      ),
              
                      SizedBox(height: 10),

                      LoginButton(
                        borderColor: Color.fromRGBO(255, 87, 20, 1),
                        buttonColor: Colors.white,
                        buttonText: "Continue with Google as Officer",
                        textColor: Color.fromRGBO(255, 87, 20, 1),
                        widget: HomePageOfficer(),
                      ),

                      SizedBox(height: 20),

                      BottomText(),
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