import 'package:flutter/material.dart';
import 'package:sirene/officer/page/home/component/customBottomNavigationBar/custom_bottom_navigation_bar.dart';
import 'package:sirene/officer/page/map/component/mapView/map_view.dart';
import 'package:sirene/officer/page/map/component/slideToRespond/slide_to_respond.dart';

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
          child: const Column(
            children: [
              Expanded(
                flex: 12,
                child: MapView()
              ),
                
              Expanded(
                flex: 2,
                child: SlideToRespond()
              ),
            ],
          ),
        ),
      
        bottomNavigationBar: const CustomBottomNavigationBar()
      ),
    );
  }
}