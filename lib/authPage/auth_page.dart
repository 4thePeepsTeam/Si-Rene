import 'package:flutter/material.dart';
import 'package:sirene/callPage/home_call.dart';
import 'package:sirene/customWidget/login_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sirene/officerPage/home_page.dart';

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
          child: Column(
            children: [
        
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  "assets/svg/auth_background.svg",
                  width: size.width * 0.6,
                  alignment: Alignment.bottomCenter,
                ),
              ),
        
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const LoginButton(
                        borderColor: Colors.transparent,
                        buttonColor: Color.fromRGBO(255, 87, 20, 1),
                        buttonText: "Continue with Google as User",
                        textColor: Colors.white,
                        widget: HomeCall(),
                      ),
              
                      const SizedBox(height: 10),

                      const LoginButton(
                        borderColor: Color.fromRGBO(255, 87, 20, 1),
                        buttonColor: Colors.white,
                        buttonText: "Continue with Google as User",
                        textColor: Color.fromRGBO(255, 87, 20, 1),
                        widget: HomePageOfficer(),
                      ),

                      const SizedBox(height: 20),

                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "By signing up, you agree to the ",
                                style: TextStyle(
                                  color: Color.fromRGBO(13, 1, 6, 1),
                                  fontSize: 9,
                                ),
                              ),

                              TextSpan(
                                text: "Terms of Service ",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 87, 20, 1),
                                  fontSize: 9,
                                ),
                              ),

                              TextSpan(
                                text: "and\n",
                                style: TextStyle(
                                  color: Color.fromRGBO(13, 1, 6, 1),
                                  fontSize: 9,
                                ),
                              ),

                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 87, 20, 1),
                                  fontSize: 9,
                                ),
                              ),

                              TextSpan(
                                text: ", including Cookie Use",
                                style: TextStyle(
                                  color: Color.fromRGBO(13, 1, 6, 1),
                                  fontSize: 9,
                                ),
                              ),
                            ]
                          ),
                        )
                      )
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