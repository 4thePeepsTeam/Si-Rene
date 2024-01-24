import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:sirene/officer/page/map/data/map_data.dart';

class PathWidget extends StatefulWidget {
  const PathWidget({ super.key });

  @override
  State <PathWidget> createState() => _PathWidgetState();
}

class _PathWidgetState extends State<PathWidget> {
  @override
  Widget build(BuildContext context) {
    return routeCoordinates.isNotEmpty ? PolylineLayer(
      polylines: [
        Polyline(
          color: const Color.fromRGBO(255, 143, 81, 1),
          strokeWidth: 10,
          points: List.generate(routeCoordinates.length, (index) {
            return routeCoordinates.elementAt(index);
          })
        ),
      ],
    ) : const SizedBox.shrink();
  }
}