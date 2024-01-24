import 'package:flutter/material.dart';
import 'package:sirene/officer/page/home/component/body/body.dart';
import 'package:sirene/officer/page/home/component/customBottomNavigationBar/custom_bottom_navigation_bar.dart';
import 'package:sirene/officer/page/home/component/callAlert/call_alert.dart';
import 'package:sirene/officer/page/home/component/header/header.dart';
import 'package:sirene/officer/page/home/component/customTab/custom_tab.dart';

class HomePageOfficer extends StatefulWidget {
  const HomePageOfficer({ super.key });

  @override
  State<HomePageOfficer> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageOfficer> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
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

          const CallAlert(),
        ],
      ),

      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}