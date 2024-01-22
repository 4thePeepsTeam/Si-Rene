import 'package:flutter/material.dart';
import 'package:sirene/officer/page/home/component/ambulanceBackground/ambulance_background.dart';
import 'package:sirene/officer/page/home/component/bottomNavigationBar/custom_bottom_navigation_bar.dart';
import 'package:sirene/officer/page/home/component/callAlert/call_alert.dart';
import 'package:sirene/officer/page/home/component/header/header.dart';
import 'package:sirene/officer/page/home/component/notificationAlert/notification_alert.dart';
import 'package:sirene/officer/page/home/component/request/component/action/slide_to_accept.dart';
import 'package:sirene/officer/page/home/component/request/component/noRequest/no_request.dart';
import 'package:sirene/officer/page/home/component/request/request.dart';
import 'package:sirene/officer/page/home/component/tab/custom_tab.dart';
import 'package:sirene/officer/data/officer_data.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 2,
                  child: Header(),
                ),
                
                const Expanded(
                  flex: 1,
                  child: CustomTab(),
                ),
            
                Expanded(
                  flex: 9,
                  child: Container(
                    width: size.width,
                    height: size.height,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(243, 244, 239, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: hasOrder,
                      builder: (context, value, child) {
                        if (value) {
                          return const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: NotificationAlert()
                              ),

                              Expanded(
                                flex: 8,
                                child: AmbulanceBackground()
                              ),

                              Expanded(
                                flex: 8,
                                child: Request()
                              ),

                              Expanded(
                                flex: 3,
                                child: SlideToAccept(),
                              ),
                            ],
                          );
                        }

                        return const NoRequest();
                      },
                    ),
                  ),
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