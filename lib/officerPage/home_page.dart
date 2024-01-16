import 'package:flutter/material.dart';
import 'package:sirene/data/user_data.dart';
import 'package:sirene/officerPage/map_page.dart';

class HomePageOfficer extends StatefulWidget {
  const HomePageOfficer({ Key? key }) : super(key: key);

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