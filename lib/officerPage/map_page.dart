import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:sirene/officerPage/bottom_icon.dart';
import 'officer_data.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:slide_to_act/slide_to_act.dart';

class MapPage extends StatefulWidget {
  const MapPage({ super.key });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height * 0.9,
          child: Column(
            children: [
              Expanded(
                flex: 12,
                child: FlutterMap(
                  options: const MapOptions(
                    initialCenter: LatLng(-6.972579049641416, 109.10862928321885),
                    initialZoom: 13,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: "com.example.flutter_maps_test",
                    ),

                    Stack(
                      children:[
                        routeCoordinates.isNotEmpty ? PolylineLayer(
                          polylines: [
                            Polyline(
                              color: const Color.fromRGBO(255, 143, 81, 1),
                              strokeWidth: 10,
                              points: List.generate(routeCoordinates.length, (index) {
                                return routeCoordinates.elementAt(index);
                              })
                            ),
                          ],
                        ) : const SizedBox.shrink(),

                        const MarkerLayer(
                          markers: [
                            Marker(
                              point: LatLng(-6.972579049641416, 109.10862928321885),
                              width: 20,
                              height: 20,
                              child: Icon(Icons.pin_drop_rounded),
                            ),

                            Marker(
                              point: LatLng(-7.03515, 109.105255),
                              width: 20,
                              height: 20,
                              child: Icon(Icons.pin_drop_rounded),
                            ),
                          ],
                        ),

                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: size.width,
                          height: size.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromRGBO(255, 254, 251, 1),
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
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "Lokasi Tujuan",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                            "Kost Wisna Arjuna, Sekaran, Gn. Pati",
                                            style: TextStyle(
                                              fontSize: 14,
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
                                    "5 KM", 
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
                
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 254, 251, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(0, -2),
                        blurRadius: 30
                      ),
                    ],
                  ),
                  child: SlideAction(
                    outerColor: const Color.fromRGBO(255, 87, 20, 1),
                    sliderButtonIcon: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Color.fromRGBO(255, 87, 20, 1),
                      size: 16,
                    ),
                    onSubmit: () {
                      return Future.delayed(const Duration(seconds: 2));
                    },
                    sliderRotate: false,
                    elevation: 0,
                    sliderButtonIconPadding: 10,
                    borderRadius: 12.5,
                    text: "Sampai di Lokasi",
                    textStyle: const TextStyle(
                      fontSize: 12,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      
        bottomNavigationBar: Container(
          width: size.width,
          height: size.height * 0.1,
          color: const Color.fromRGBO(255, 255, 255, 1),
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