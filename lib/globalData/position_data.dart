import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sirene/globalData/private.dart';
import 'package:sirene/globalData/theme_data.dart';



Future<bool> handleLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;
  
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return false;
  }
  return true;
}

Future<Map <String, String>> getCurrentPosition() async {
  final hasPermission = await handleLocationPermission();

  if (!hasPermission) {
    return {
      "latitude": "",
      "longitude": "",
    };
  }
  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
      .then((Position positionNow) {
    return {
    "latitude": positionNow.latitude.toString(),
    "longitude": positionNow.longitude.toString(),
  };
  }).catchError((e) {
    debugPrint(e);
    return {
      "latitude": "",
      "longitude": "",
    };
  });
}

Map <String, String> userPosition = {};

Future <Response<dynamic>> getNearbyAmbulance(BuildContext context) async{
  userPosition = await getCurrentPosition();
  debugPrint(userPosition.toString());

  if (userPosition["latitude"]!.isEmpty && userPosition["longitude"]!.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Please activate your location services"),
      )
    );
  }
  while (userPosition["latitude"]!.isEmpty && userPosition["longitude"]!.isEmpty) {
    userPosition = await getCurrentPosition();
    debugPrint(userPosition.toString());
    await Future.delayed(const Duration(seconds: 3));
  }

  Dio dio = Dio();
  return await dio.postUri(Uri.https("si-rene-be-oyoxciwqpq-as.a.run.app", "/api/ambulance/nearby"),
    data: {
      "currentPosition": {
          "latitude": double.parse(userPosition["latitude"]!),
          "longitude": double.parse(userPosition["longitude"]!)
      }
    }
  );
}
Map<MarkerId, Marker> markers = {};
List<PointLatLng> polylineCoordinates = [];
late PolylineResult? coordinates;
PolylinePoints polylinePoints = PolylinePoints();
List <LatLng> routeCoordinates = [];
Set<Polyline> polylines = {};
String officerLatitude = "";
String officerLongitude = "";
String officerId = "";

Future <Response> getTimeDistance(double originLatitude, double originLongitude, double destLatitude, double destLongitude) async {
  Dio dio = Dio();
  return await dio.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=$originLatitude,$originLongitude&destinations=$destLatitude,$destLongitude&key=$googleMapsApiKey");
}

void addPolyLine(double latitude, double longitude) {
  routeCoordinates.clear();
  for (var element in polylineCoordinates) {
    routeCoordinates.add(LatLng(element.latitude, element.longitude));
  }

  addMarker(LatLng(latitude, longitude), "origin", BitmapDescriptor.defaultMarkerWithHue(30));

  polylines.clear();
  debugPrint("coordinates: $routeCoordinates");
  polylines.add(Polyline(polylineId: PolylineId("id"), color: orangeColor, points: routeCoordinates));
  debugPrint("added");
  debugPrint(polylines.first.points.toString());
}

Future <void> getPolyline(double originLatitude, double originLongitude, double destLatitude, double destLongitude) async {

  coordinates = await polylinePoints.getRouteBetweenCoordinates(
    googleMapsApiKey,
    PointLatLng(originLatitude, originLongitude),
    PointLatLng(destLatitude, destLongitude),
    optimizeWaypoints: true,
  );

  if (coordinates!.points.isNotEmpty) {
    polylineCoordinates.clear();
    for (var point in coordinates!.points) {
      polylineCoordinates.add(PointLatLng(point.latitude, point.longitude));
    }
  }

  addPolyLine(destLatitude, destLongitude);
}

addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }