import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PinPoint extends StatefulWidget {
  const PinPoint({ super.key });

  @override
  State <PinPoint> createState() => _PinPointState();
}

class _PinPointState extends State<PinPoint> {
  @override
  Widget build(BuildContext context) {
    return const MarkerLayer(
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
    );
  }
}