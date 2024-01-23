import 'package:flutter/material.dart';
import 'package:sirene/officer/data/officer_data.dart';
import 'package:sirene/officer/page/home/component/body/component/ambulanceBackground/ambulance_background.dart';
import 'package:sirene/officer/page/home/component/body/component/slideToAccept/slide_to_accept.dart';
import 'package:sirene/officer/page/home/component/body/component/noRequest/no_request.dart';
import 'package:sirene/officer/page/home/component/body/component/notificationAlert/notification_alert.dart';
import 'package:sirene/officer/page/home/component/body/component/request/request.dart';

class Body extends StatefulWidget {
  const Body({ super.key });

  @override
  State <Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(243, 244, 239, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ValueListenableBuilder(
        valueListenable: hasOrder,
        builder: (context, value, child) {
          if (value) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: NotificationAlert()
                ),

                Expanded(
                  flex: 8,
                  child: AmbulanceBackground()
                ),

                Expanded(
                  flex: 8,
                  child: Request()
                ),

                Expanded(
                  flex: 3,
                  child: SlideToAccept(),
                ),
              ],
            );
          }

          return const NoRequest();
        },
      ),
    );
  }
}