import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sirene/globalData/auth_data.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/globalData/position_data.dart';
import 'package:sirene/officer/page/home/component/body/body.dart';
import 'package:sirene/officer/page/home/component/customBottomNavigationBar/custom_bottom_navigation_bar.dart';
// import 'package:sirene/officer/page/home/component/callAlert/call_alert.dart';
import 'package:sirene/officer/page/home/component/header/header.dart';
import 'package:sirene/officer/page/home/component/customTab/custom_tab.dart';

class HomePageOfficer extends StatefulWidget {
  const HomePageOfficer({ super.key });

  @override
  State<HomePageOfficer> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageOfficer> {

  static GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();

  Stream <void> streamUserPosition = Stream.periodic(const Duration(seconds: 10), (seconds) async {

    userPosition = await getCurrentPosition();
    debugPrint(userPosition.toString());

    if (userPosition["latitude"]!.isNotEmpty && userPosition["longitude"]!.isNotEmpty) {
      await FirestoreData.officer.doc(UserData.userCredential.user.uid).update({
        "location": GeoPoint(double.parse(userPosition["latitude"]!), double.parse(userPosition["longitude"]!))
      });
    }
    else {
      ScaffoldMessenger.of(homeKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text("Please activate your location services"),
        )
      );
    }
  });

  late StreamSubscription subLocation = streamUserPosition.listen((event) {});

  @override
  void initState() {
    super.initState();
    subLocation = streamUserPosition.listen((event) {});
  }

  @override 
  void dispose() {
    subLocation.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      key: homeKey,
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Header(),
                ),
                
                Expanded(
                  flex: 1,
                  child: CustomTab(),
                ),
            
                Expanded(
                  flex: 9,
                  child: Body()
                ),
              ],
            ),
          ),

          // const CallAlert(),
        ],
      ),

      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}