import 'package:flutter/material.dart';
import 'package:sirene/officer/page/home/component/request/component/requestDetails/component/address_widget.dart';
import 'package:sirene/officer/page/home/component/request/component/requestDetails/component/contact_widget.dart';
import 'package:sirene/officer/page/home/component/request/component/requestDetails/component/distance_duration_widget.dart';
import 'package:sirene/officer/page/home/component/request/component/requestDetails/component/name_widget.dart';

class Request extends StatefulWidget {
  const Request({ super.key });

  @override
  State <Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return Container(
      width: size.width,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 254, 251, 0.6),
        borderRadius: BorderRadius.circular(10)
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NameWidget(),

          ContactWidget(),

          AddressWidget(),

          DistanceDurationWidget()
        ],
      ),
    );
  }
}