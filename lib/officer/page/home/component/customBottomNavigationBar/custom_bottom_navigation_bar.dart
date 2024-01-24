import 'package:flutter/material.dart';
import 'package:sirene/globalWidget/bottom_icon.dart';
import 'package:sirene/officer/page/home/component/customBottomNavigationBar/data/custom_bottom_navigation_bar_data.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({ super.key });

  @override
  State <CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
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
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    isHome.value = true;
                    isNotification.value = false;
                    isProfile.value = false;
                  },
                  child: BottomIcon(
                    listenable: isHome,
                    icon: Icons.home_filled,
                    label: "Home",
                  )
                ),
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  isHome.value = false;
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
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    isHome.value = false;
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
          ),
        ],
      ),
    );
  }
}