import 'package:flutter/material.dart';
import 'package:sirene/globalData/auth_data.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/officer/page/map/map_page.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideToAccept extends StatefulWidget {
  const SlideToAccept({ super.key });

  @override
  State <SlideToAccept> createState() => _SlideToAcceptState();
}

class _SlideToAcceptState extends State<SlideToAccept> {
  @override
  Widget build(BuildContext context) {
    return SlideAction(
      outerColor: const Color.fromRGBO(255, 87, 20, 1),
      sliderButtonIcon: const Icon(
        Icons.arrow_forward_ios_sharp,
        color: Color.fromRGBO(255, 87, 20, 1),
        size: 16,
      ),
      onSubmit: () async {
        await Future.delayed(const Duration(seconds: 1));
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const MapPage();
              },
            ),
          );
        });
      },
      sliderRotate: false,
      elevation: 0,
      sliderButtonIconPadding: 10,
      borderRadius: 12.5,
      text: "Accept Request ",
      textStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white
      ),
    );
  }
}