import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageUser extends StatefulWidget {
  const HomePageUser({ Key? key }) : super(key: key);

  @override
  State<HomePageUser> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageUser> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: SvgPicture.asset(
                  "assets/svg/logo.svg",
                  width: size.width * 0.4,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: size.width * 0.2,
                        height: size.width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                              offset: Offset(0, 8),
                              blurRadius: 15,
                            ),
                            BoxShadow(
                              color: const Color.fromRGBO(255, 87, 20, 1),
                              blurRadius: 5,
                              spreadRadius: -5,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Material(
                            type: MaterialType.button,
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      )
                    ),
                
                    const SizedBox(width: 10),
                
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(
                            Size(
                              size.width * 0.2,
                              size.width * 0.2,
                            )
                          ),
                          surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          )
                        ),
                        onPressed: null,
                        child: const Column(),
                      ),
                    ),
                
                    const SizedBox(width: 10),
                
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(
                            Size(
                              size.width * 0.2,
                              size.width * 0.2,
                            )
                          ),
                          surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          )
                        ),
                        onPressed: null,
                        child: const Column(),
                      ),
                    ),
                  ],
                ),
              )
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 6,
              child: Container(),
            ),
          ],
        )
      ),
    );
  }
}