import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:sirene/globalWidget/bottom_icon.dart';
import '../../data/officer_data.dart';
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
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          width: size.width,
                          height: size.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromRGBO(255, 254, 251, 1),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Icon(
                                      Icons.my_location,
                                      size: 20,
                                    ),
                                  ),
                                                        
                                  SizedBox(width: 10),
                                                        
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "Start",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10
                                      ),
                                    ),
                                  ),
                                                        
                                  SizedBox(width: 10),
                                                        
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "Your Location",
                                      style: TextStyle(
                                        fontSize: 10
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              
                          
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Divider(
                                  height: 1,
                                ),
                              ),
                          
                              Row(
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Icon(
                                      Icons.fmd_bad,
                                      size: 20,
                                    ),
                                  ),
                                                        
                                  SizedBox(width: 10),
                                                        
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "End",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10
                                      ),
                                    ),
                                  ),
                                                        
                                  SizedBox(width: 10),
                                                        
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "Jl. Dewi Sartika Barat, Sekaran, Gn. Pati",
                                      style: TextStyle(
                                        fontSize: 10
                                      ),
                                    ),
                                  ),
                                ],
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
                  child: ValueListenableBuilder(
                    valueListenable: slideNumber,
                    builder: (context, value, child) {
                      if (value == 0) {
                        return SlideAction(
                          outerColor: const Color.fromRGBO(255, 87, 20, 1),
                          sliderButtonIcon: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Color.fromRGBO(255, 87, 20, 1),
                            size: 16,
                          ),
                          onSubmit: () {
                            return Future.delayed(const Duration(seconds: 2), () {
                              slideNumber.value++;
                            });
                          },
                          sliderRotate: false,
                          elevation: 0,
                          sliderButtonIconPadding: 10,
                          borderRadius: 12.5,
                          text: "Start Journey",
                          textStyle: const TextStyle(
                            fontSize: 12,
                            color: Colors.white
                          ),
                        );
                      }

                      if (value == 1) {
                        return SlideAction(
                          outerColor: const Color.fromRGBO(255, 87, 20, 1),
                          sliderButtonIcon: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Color.fromRGBO(255, 87, 20, 1),
                            size: 16,
                          ),
                          onSubmit: () {
                            return Future.delayed(const Duration(seconds: 2), () {
                              slideNumber.value++;
                            });
                          },
                          sliderRotate: false,
                          elevation: 0,
                          sliderButtonIconPadding: 10,
                          borderRadius: 12.5,
                          text: "Mark As Arrived",
                          textStyle: const TextStyle(
                            fontSize: 12,
                            color: Colors.white
                          ),
                        );
                      }

                      return SlideAction(
                        outerColor: const Color.fromRGBO(255, 87, 20, 1),
                        sliderButtonIcon: const Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Color.fromRGBO(255, 87, 20, 1),
                          size: 16,
                        ),
                        onSubmit: () {
                          return Future.delayed(const Duration(seconds: 2), () {
                            slideNumber.value = 0;
                            hasOrder.value = false;
                            Navigator.of(context).pop();
                          });
                        },
                        sliderRotate: false,
                        elevation: 0,
                        sliderButtonIconPadding: 10,
                        borderRadius: 12.5,
                        text: "Mark As Done",
                        textStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.white
                        ),
                      );

                    },
                  ),
                ),
              ),
            ],
          ),
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
        )
      ),
    );
  }
}