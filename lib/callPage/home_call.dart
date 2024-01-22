import 'package:flutter/material.dart';
import 'package:sirene/callPage/activity.dart';
import 'package:sirene/callPage/call.dart';
import 'package:sirene/callPage/user_data.dart';
import 'package:sirene/globalWidget/bottom_icon.dart';

class HomeCall extends StatefulWidget {
  const HomeCall({ super.key });

  @override
  State <HomeCall> createState() => _HomeCallState();
}

class _HomeCallState extends State<HomeCall> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageNumber,
        builder: (context, value, child) {
          if (value == 0) {
            return const Call();
          }

          return const Activity();
        },
      ),
      bottomNavigationBar: Container(
        width: size.width,
        height: size.height * 0.1,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 30,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    isHome.value = true;
                    isHistory.value = false;
                    isNotification.value = false;
                    isProfile.value = false;
                    pageNumber.value = 0;
                  },
                  child: BottomIcon(
                    listenable: isHome,
                    icon: Icons.home_filled,
                    label: "Home",
                  )
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    isHome.value = false;
                    isHistory.value = true;
                    isNotification.value = false;
                    isProfile.value = false;
                    pageNumber.value = 1;
                  },
                  child: BottomIcon(
                    listenable: isHistory,
                    icon: Icons.history,
                    label: "Activity",
                  )
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    isHome.value = false;
                    isHistory.value = false;
                    isNotification.value = true;
                    isProfile.value = false;
                  },
                  child: BottomIcon(
                    listenable: isNotification,
                    icon: Icons.notifications,
                    label: "Notification",
                  )
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    isHome.value = false;
                    isHistory.value = false;
                    isNotification.value = false;
                    isProfile.value = true;
                  },
                  child: BottomIcon(
                    listenable: isProfile,
                    icon: Icons.person,
                    label: "Profile",
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}