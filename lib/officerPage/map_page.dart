import 'package:flutter/material.dart';
import 'package:sirene/officerPage/bottom_icon.dart';
import 'officer_data.dart';

class MapPage extends StatefulWidget {
  const MapPage({ Key? key }) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height * 0.9,
          color: const Color.fromRGBO(255, 254, 251, 1),
          child: Column(
            children: [
              Expanded(
                flex: 13,
                child: Container(
                
                ),
              ),
                
              Expanded(
                flex: 2,
                child: Container(
                  
                ),
              ),
            ],
          ),
        ),
      
        bottomNavigationBar: SizedBox(
          width: size.width,
          height: size.height * 0.1,
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
                        label: "Beranda",
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
                      label: "Notifikasi",
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
                        label: "Profil",
                      )
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}