import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sirene/globalData/auth_data.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/globalData/position_data.dart';
import 'package:sirene/globalData/theme_data.dart';

class UserMap extends StatefulWidget {
  const UserMap({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State <UserMap> createState() => _UserMapState();
}

class _UserMapState extends State<UserMap> {

  late GoogleMapController _controller;
  Future <Map<String, dynamic>> getOfficerData(String id) {
    return FirestoreData.officer.doc(id).get().then((value) => value.data()!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: SafeArea(
          child: Stack(
            children: [
              StreamBuilder(
                stream: FirestoreData.officer.doc(widget.id).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    debugPrint("data: ${snapshot.data!.data().toString()}");
                    return FutureBuilder(
                      future: getPolyline(double.parse(userPosition["latitude"]!), double.parse(userPosition["longitude"]!), snapshot.data!.data()!["location"].latitude, snapshot.data!.data()!["location"].longitude),
                      builder: (context, snapshot) {
                        return GoogleMap(
                          mapType: MapType.normal,
                          zoomControlsEnabled: false,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(double.parse(userPosition["latitude"]!), double.parse(userPosition["longitude"]!)),
                            zoom: 19.151926040649414
                          ),
                          onMapCreated: (GoogleMapController controller) async {
                            _controller = controller;
                          },
                          onLongPress: (argument) {
                          },
                          polylines: polylines,
                          markers: Set<Marker>.of(markers.values),
                        );
                      },
                    );
                  }
        
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error\n${snapshot.error}"),
                    );
                  }
        
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
          
              FutureBuilder(
                future: getOfficerData(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Something went wrong\n${snapshot.error}"),
                    );
                  }
        
                  if (snapshot.hasData) {
                    debugPrint("\n\n\nOfficer Data: ${snapshot.data}\n\n\n");
                    return Column(
                      children: [
                        const Expanded(
                          flex: 7,
                          child: SizedBox.shrink(),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/svg/ambulance.svg",
                                    ),
                        
                                    const SizedBox(width: 10),
                        
                                    Text(
                                      "${snapshot.data!["name"]}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                        
                                const SizedBox(height: 5),
                        
                                IntrinsicHeight(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Officer", 
                                              style: TextStyle(
                                                color: Color.fromRGBO(0, 0, 0, 0.5),
                                                fontSize: 12,
                                              ),
                                            ),
                                                                        
                                            const SizedBox(height: 10),
                                                                        
                                            Text(
                                              "${snapshot.data!["name"]}",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  
                                      const Expanded(
                                        flex: 1,
                                        child: VerticalDivider(color: Color.fromRGBO(0, 0, 0, 0.1), width: 1, thickness: 1),
                                      ),
                                  
                                      const Expanded(
                                        flex: 5,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Plate Number", 
                                              style: TextStyle(
                                                color: Color.fromRGBO(0, 0, 0, 0.5),
                                                fontSize: 12,
                                              ),
                                            ),
                                                                        
                                            SizedBox(height: 10),
                                                                        
                                            Text(
                                              "A 1234 BC",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        
                                const SizedBox(height: 5),
                        
                                StreamBuilder(
                                  stream: FirestoreData.officer.doc(widget.id).snapshots(),
                                  builder:(context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data!.data()!["status"] == "Arrived") {
                                        return Container(
                                          width: double.infinity,
                                          height: 54,
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(32, 184, 63, 1),
                                            borderRadius: BorderRadius.circular(54),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.check,
                                                color: whiteColor,
                                              ),
                                
                                              const SizedBox(width: 10),
                                
                                              Text(
                                                "Officers Have Arrived",
                                                style: TextStyle(
                                                  color: whiteColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }

                                      return Container(
                                        width: double.infinity,
                                        height: 54,
                                        decoration: BoxDecoration(
                                          color: greenColor,
                                          borderRadius: BorderRadius.circular(54),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/whatsapp_logo.svg",
                                            ),
                              
                                            const SizedBox(width: 10),
                              
                                            Text(
                                              "Contact the Officer",
                                              style: TextStyle(
                                                color: whiteColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }

                                    if (snapshot.hasError) {
                                      return const Center(
                                        child: Text("Error\${snapshot.error}"),
                                      );
                                    }

                                    return Container(
                                      width: double.infinity,
                                      height: 54,
                                      decoration: BoxDecoration(
                                        color: greenColor,
                                        borderRadius: BorderRadius.circular(54),
                                      ),
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    );
                                  },
                                ),
                                
                                const SizedBox(height: 5),
                        
                                Text(
                                  "Want to cancel?", 
                                  style: TextStyle(
                                    color: orangeColor,
                                    decorationColor: orangeColor,
                                    decoration: TextDecoration.underline,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
        
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
        
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: whiteColor,
                            ),
                            child: Center(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                
                    Expanded(
                      flex: 8,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: whiteColor,
                        ),
                        child: StreamBuilder(
                          stream: FirestoreData.officer.doc(widget.id).snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
        
                              if (snapshot.data!.data()!["status"] == "Completed") {
                                WidgetsBinding.instance.addPostFrameCallback((_) async {
                                  await FirestoreData.officer.get().then((value) {
                                    officerId = "";
                                    officerLatitude = "";
                                    officerLongitude = "";
                                    FirestoreData.user.doc(UserData.userCredential.user.uid).update({
                                      "calling": "",
                                    });
                                    FirestoreData.officer.doc(value.docs.first.id).update({
                                      "calling": "",
                                      "status": "",
                                      "isOnDuty": false,
                                    });
                                  });
                                  WidgetsBinding.instance.addPostFrameCallback((_) {
                                    Navigator.of(context).pop();
                                  });
                                });
                              }
                              
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.assistant_navigation,
                                    color: greenColor,
                                  ),
                              
                                  const SizedBox(width: 15),
                              
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Arrival Status",
                                          style: const TextStyle(
                                            color: Color  .fromRGBO(0, 0, 0, 0.5),
                                            fontSize: 12,
                                          ),
                                        ),
                                    
                                        const SizedBox(height: 5),
                                    
                                        Text(
                                          snapshot.data!.data()!["status"],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              
                                  StreamBuilder(
                                    stream: FirestoreData.officer.doc(widget.id).snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasError) {
                                        return Center(
                                          child: Text("Error\n${snapshot.error}"),
                                        );
                                      }

                                      if (snapshot.hasData) {
                                        if (snapshot.data!.data()!["status"] == "Arrived") {
                                          return const SizedBox.shrink();
                                        }

                                        return Expanded(
                                          child: FutureBuilder(
                                            future: getTimeDistance(double.parse(userPosition["latitude"]!), double.parse(userPosition["longitude"]!), snapshot.data!.data()!["location"].latitude, snapshot.data!.data()!["location"].longitude),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${(snapshot.data!.data["rows"].elementAt(0)["elements"].elementAt(0)["duration"]["value"] / 60).round()} ",
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                                            
                                                    const Text(
                                                      "mnt",
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(0 ,0 , 0, 0.5),
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }
                                                
                                              if (snapshot.hasError) {
                                                return Center(
                                                  child: Text("Error\n${snapshot.error}"),
                                                );
                                              }
                                                
                                              return const Align(
                                                alignment: Alignment.centerRight,
                                                child: CircularProgressIndicator(),
                                              );
                                            },
                                          ),
                                        );
                                      }

                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  ),
                                ],
                              );
                            }
        
                            if (snapshot.hasError) {
                              return Center(
                                child: Text("Error\n${snapshot.error}"),
                              );
                            }
        
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}