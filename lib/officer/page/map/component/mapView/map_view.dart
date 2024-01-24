import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sirene/officer/page/map/component/mapView/component/addressDetails/address_details.dart';
import 'package:sirene/officer/page/map/component/mapView/component/path/path_widget.dart';
import 'package:sirene/officer/page/map/component/mapView/component/pinPoint/pin_point.dart';

class MapView extends StatefulWidget {
  const MapView({ super.key });

  @override
  State <MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(-6.972579049641416, 109.10862928321885),
        initialZoom: 13,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: "com.example.flutter_maps_test",
        ),

        const Stack(
          children:[
            PathWidget(),

            PinPoint(),

            AddressDetails(),
          ],
        ),
      ],
    );
  }
}