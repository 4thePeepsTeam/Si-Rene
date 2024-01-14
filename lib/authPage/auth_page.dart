import 'package:flutter/material.dart';
import 'package:sirene/customWidget/login_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({ Key? key }) : super(key: key);

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
        
              const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LoginButton(
                        borderColor: Colors.transparent,
                        buttonColor: Color.fromRGBO(255, 87, 20, 1),
                        buttonText: "Masuk sebagai User",
                        textColor: Colors.white,
                      ),
              
                      SizedBox(height: 10),

                      LoginButton(
                        borderColor: Color.fromRGBO(255, 87, 20, 1),
                        buttonColor: Colors.white,
                        buttonText: "Masuk sebagai Officer",
                        textColor: Color.fromRGBO(255, 87, 20, 1),
                      ),
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