import 'package:flutter/material.dart';
import 'package:sirene/data/auth_data.dart';
import 'package:sirene/officerPage/map_page.dart';

class HomePageOfficer extends StatefulWidget {
  const HomePageOfficer({ super.key });

  @override
  State<HomePageOfficer> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageOfficer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // routeMap = await getRoute(LatLng(-6.972579049641416, 109.10862928321885), LatLng(-7.09579049641416, 109.10862928321885));
                // routeCoordinates = routeMap.map((point) {
                //   return LatLng(point.latitude, point.longitude);
                // }).toList();
                // print(routeCoordinates);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const MapPage();
                    },
                  ),
                );
              },
              child: const Text("To next page"),
            ),

            ElevatedButton(
              onPressed: () async {
                bool result = await UserData.signOutFromGoogle();
                if (result) {
                  UserData.userCredential = "";
                }
                Navigator.of(context).pop();
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}