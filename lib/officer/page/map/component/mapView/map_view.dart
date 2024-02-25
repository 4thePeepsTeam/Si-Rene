import 'package:flutter/material.dart';
import 'package:sirene/globalData/auth_data.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/globalData/position_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sirene/officer/page/map/component/mapView/component/addressDetails/address_details.dart';
class MapView extends StatefulWidget {
  const MapView({ super.key });

  @override
  State <MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  late GoogleMapController _controller;

  Future <dynamic> getData() async {
    String caller = await FirestoreData.officer.doc(UserData.userCredential.user.uid).get().then((value) => value.data()!["calling"]);
    double callerLatitude = await FirestoreData.user.doc(caller).get().then((value) => value.data()!["location"].latitude);
    double callerLongitude = await FirestoreData.user.doc(caller).get().then((value) => value.data()!["location"].longitude);

    debugPrint("got caller coordinates");

    return await getPolyline(callerLatitude, callerLongitude, double.parse(userPosition["latitude"]!), double.parse(userPosition["longitude"]!));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreData.officer.doc(UserData.userCredential.user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          debugPrint("data: ${snapshot.data!.data().toString()}");
          return FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              return Stack(
                children: [
                  GoogleMap(
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
                  ),

                  const AddressDetails(),
                ],
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
    );
  }
}