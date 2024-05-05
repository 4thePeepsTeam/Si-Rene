import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageUser extends StatefulWidget {
  const HomePageUser({ super.key });

  @override
  State<HomePageUser> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageUser> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/logo.svg",
                    width: size.width * 0.4,
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Quick Actions",
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AspectRatio(
                      aspectRatio: 1.0,
                      child: Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 1.0,
                            child: Container(
                              width: size.width,
                              height: size.height,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 87, 20, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          
                          AspectRatio(
                            aspectRatio: 1.0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 0 , 0, 0.25),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                
                          AspectRatio(
                            aspectRatio: 1.0,
                            child: Container(
                              width: size.width,
                              height: size.height,
                              margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 87, 20, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                
                          AspectRatio(
                            aspectRatio: 8,
                            child: Container(
                              width: size.width,
                              height: size.height,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    // Colors.blue,
                                    Color.fromRGBO(255, 255, 255, 0.6),
                                    Color.fromRGBO(255, 255, 255, 0.0),
                                  ]
                                )
                              ),
                            ),
                          ),
                
                          AspectRatio(
                            aspectRatio: 0.07,
                            child: Container(
                              width: size.width,
                              height: size.height,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    // Colors.purple,
                                    Color.fromRGBO(255, 255, 255, 0.4),
                                    Color.fromRGBO(255, 255, 255, 0.0),
                                  ]
                                )
                              ),
                            ),
                          ),
                
                          Align(
                            alignment: Alignment.centerRight,
                            child: AspectRatio(
                              aspectRatio: 0.07,
                              child: Container(
                                width: size.width,
                                height: size.height,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: [
                                      // Colors.green,
                                      Color.fromRGBO(255, 255, 255, 0.4),
                                      Color.fromRGBO(255, 255, 255, 0.0),
                                    ]
                                  )
                                ),
                              ),
                            ),
                          ),
                
                          AspectRatio(
                            aspectRatio: 1.0,
                            child: Container(
                              width: size.width,
                              height: size.height,
                              margin: const EdgeInsets.all(20),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/svg/ambulance.svg",
                                      width: 50,
                                      height: 50,
                                      // fit: BoxFit.scaleDown,
                                      colorFilter: const ColorFilter.mode(Color.fromRGBO(251, 251, 255, 1), BlendMode.srcIn),
                                    ),
                                
                                    const SizedBox(height: 5),
                                
                                    const Text(
                                      "Ambulance",
                                      style: TextStyle(
                                        color: Color.fromRGBO(251, 251, 255, 1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                
                    const SizedBox(width: 10),
                
                    AspectRatio(
                      aspectRatio: 1.0,
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
                
                    AspectRatio(
                      aspectRatio: 1.0,
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
                )
              ),
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Expanded(
                flex: 7,
                child: Container(),
              ),
            ],
          ),
        )
      ),
    );
  }
}