import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sirene/callPage/user_map.dart';
import 'package:sirene/callPage/user_data.dart';
import 'package:sirene/globalData/agora_data.dart';
import 'package:sirene/globalData/auth_data.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/globalData/position_data.dart';

class Call extends StatefulWidget {
  const Call({ super.key });

  @override
  State <Call> createState() => _CallState();
}

class _CallState extends State<Call> with TickerProviderStateMixin {

  late AnimationController _controllerBg1;
  late AnimationController _controllerBg2;

  late Animation <double> _bg1;
  late Animation <double> _bg2;

  // static String isNeedHelp = "";

  // Stream <void> streamUserPosition = Stream.periodic(const Duration(seconds: 10), (seconds) async {

  //   // userPosition = await getCurrentPosition();
  //   // debugPrint(userPosition.toString());
  //   FirestoreData.user.doc(UserData.userCredential.user!.uid).snapshots().listen((event) {
  //     debugPrint("getting data");
  //     isNeedHelp = event.data()!["calling"].toString();
  //     debugPrint("\n\n\nisNeedHelp? $isNeedHelp\n\n\n");
  //   });

  //   if (isNeedHelp != "") {
  //     debugPrint("updating...");
  //     await FirestoreData.user.doc(UserData.userCredential.user!.uid).set({
  //       "location": GeoPoint(double.parse(userPosition["latitude"]!), double.parse(userPosition["longitude"]!)),
  //     }, SetOptions(merge: true));
  //   }
  // }).asyncMap((event) async => await event);

  @override
  void initState() {
    super.initState();

    _controllerBg1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _bg1 = Tween(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerBg1,
        curve: Curves.easeOutSine,
      ),
    );

    _controllerBg2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _bg2 = Tween(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerBg2,
        curve: Curves.easeOutSine,
      ),
    );

    _controllerBg1.repeat(reverse: true);
    _controllerBg2.repeat(reverse: true);
  }


  @override
  void dispose() {
    try {
      AgoraData.agoraEngine.release();
    } catch (x) {
      debugPrint("agora engine is not initialized yet");
    }
    _controllerBg1.dispose();
    _controllerBg2.dispose();

    // FirestoreData.user.doc(UserData.userCredential.user!.uid).snapshots().listen((event) {}).cancel().then((value) => debugPrint("cancelled"));

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(vertical: 12.5),
                    width: size.width,
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(229, 246, 253, 1),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Icon(
                              Icons.info_outlined,
                              color: Color.fromRGBO(2, 136, 209, 1),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Your Location",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(1, 67, 97, 1),
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      "Jl. Taman Mini Indonesia Indah, Ceger, Kec. Cipayung, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13820",
                                      style: TextStyle(
                                        fontSize: 14,
                                      color: Color.fromRGBO(1, 67, 97, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "CHANGE", 
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(2, 136, 209, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            
                const Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Call Ambulance",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                  
                      Text(
                        "Press the button to find the nearest ambulance for help",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromRGBO(13, 1, 6, 1),
                        )
                      ),
                    ],
                  ),
                ),
            
                Expanded(
                  flex: 6,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedBuilder(
                          animation: _controllerBg2,
                          builder: (context, child) {
                            return Container(
                              width: size.width * 0.6 * _bg2.value,
                              height: size.width * 0.6 * _bg2.value,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(255, 87, 20, 0.1)
                              ),
                            );
                          },
                        ),
                                      
                        AnimatedBuilder(
                          animation: _controllerBg1,
                          builder: (context, child) {
                            return Container(
                              width: size.width * 0.55 * _bg1.value,
                              height: size.width * 0.55 * _bg1.value,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(255, 87, 20, 0.4)
                              ),
                            );
                          },
                        ),
                                      
                        GestureDetector(
                          onTap: () async {
                  
                            // await FirestoreData.user.doc(UserData.userCredential.user!.uid).set({
                            //   "calling": OfficerFireStoreData.allData!.entries.elementAt(0).key,
                            //   // "isOnCall": true,
                            // }, SetOptions(merge: true));
                  
                            // await FirestoreData.officer.doc(OfficerFireStoreData.allData!.entries.elementAt(0).key).set({
                            //   "calling": UserData.userCredential.user.uid,
                            //   "isOnDuty": true,
                            // }, SetOptions(merge: true)).then((value) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(
                            //       content: Text("Data sent"),
                            //     )
                            //   );
                            // });

                            if (userPosition["latitude"]!.isNotEmpty && userPosition["longitude"]!.isNotEmpty) {
                              await FirestoreData.officer.get().then((value) {
                                officerId = value.docs.first.id;
                                officerLatitude = value.docs.first.data()["location"].latitude.toString();
                                officerLongitude = value.docs.first.data()["location"].longitude.toString();
                                debugPrint("officerid: $officerId");
                                FirestoreData.user.doc(UserData.userCredential.user.uid).update({
                                  "calling": value.docs.first.id,
                                });
                                FirestoreData.officer.doc(value.docs.first.id).update({
                                  "calling": UserData.userCredential.user.uid,
                                  "status": "Preparing",
                                  "isOnDuty": true,
                                });
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Data sent"),
                                )
                              );
                              await getPolyline(double.parse(userPosition["latitude"]!), double.parse(userPosition["longitude"]!), double.parse(officerLatitude), double.parse(officerLongitude));
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return UserMap(id: officerId);
                                  },
                                ));
                              });
                            }
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please activate your location services"),
                                )
                              );
                            }
                          },
                          child: Container(
                            width: size.width * 0.5,
                            height: size.width * 0.5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 87, 20, 1),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.call_rounded,
                                    color: Colors.white,
                                    size: size.width * 0.125,
                                  ),
                          
                                  const SizedBox(height: 10),
                          
                                  const Text(
                                    "Call Ambulance",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: SizedBox.shrink(),
                ),
              ],
            ),

            SizedBox(
              width: size.width,
              height: size.height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ValueListenableBuilder(
                  valueListenable: isOpened,
                  builder: (context, data, child) {
                    return AnimatedSlide(
                      offset: data ? const Offset(0, 0) : const Offset(0, 0.66),
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOutCirc,
                      child: Container(
                        width: size.width,
                        height: (size.height * 0.3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 5,
                              color: Color.fromARGB(31, 124, 124, 124),
                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: size.width,
                              height: size.height * 0.1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Expanded(
                                      flex: 3,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("See related services"),
                                      )
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          icon: Icon(
                                            data ? Icons.expand_more : Icons.expand_less,
                                          ),
                                          onPressed: () {
                                            isOpened.value = !isOpened.value;
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            
                            Container(
                              width: size.width,
                              height: size.height * 0.2,
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: FutureBuilder(
                                future: getNearbyAmbulance(context),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text("Something went wrong\n${snapshot.error}"),
                                    );
                                  }
                                  if (snapshot.hasData) {
                                    debugPrint(snapshot.data!.data["data"].elementAt(0).toString());
                                    return SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(
                                        children: List.generate(snapshot.data!.data["data"].length, (index) {
                                          return Container(
                                            width: size.width,
                                            height: size.height * 0.1,
                                            margin: const EdgeInsets.only(
                                              bottom: 10,
                                            ),
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color.fromRGBO(0, 0, 0, 0.05),
                                                  offset: Offset(0, 10),
                                                  blurRadius: 30,
                                                ),
                                              ]
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          "assets/svg/ambulance.svg",
                                                        ),
                            
                                                        const SizedBox(width: 10),
                            
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text("${snapshot.data!.data["data"].elementAt(index)["name"]}"),
                                                            const Text(
                                                              "Kota Semarang, Jawa Tengah",
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                                color: Color.fromRGBO(13, 1, 6, 1),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  )
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          "assets/svg/distance.svg",
                                                          width: 20,
                                                          height: 20,
                                                        ),
                                                        Text(
                                                          "${snapshot.data!.data["data"].elementAt(index)["routes"]["distanceMeters"]} m",                                                         style: const TextStyle(
                                                            fontSize: 10,
                                                            color: Color.fromRGBO(255, 87, 20, 1),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  }
                                              
                                  return const Center(
                                    child: CircularProgressIndicator()
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}