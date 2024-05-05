import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sirene/user/page/homeCall/component/call/component/officerList/component/nearestOfficer/component/distance.dart';
import 'package:sirene/user/page/homeCall/component/call/component/officerList/component/nearestOfficer/component/officer_address.dart';
import 'package:sirene/user/page/homeCall/component/call/component/officerList/component/nearestOfficer/component/officer_icon.dart';
import 'package:sirene/user/page/homeCall/component/call/component/officerList/component/nearestOfficer/component/officer_name.dart';

class NearestOfficer extends StatefulWidget {
  const NearestOfficer({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot<Response<dynamic>> snapshot;

  @override
  State <NearestOfficer> createState() => _NearestOfficerState();
}

class _NearestOfficerState extends State<NearestOfficer> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: List.generate(widget.snapshot.data!.data["data"].length, (index) {
          return Container(
            width: size.width,
            height: size.height * 0.1,
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  offset: Offset(0, 10),
                  blurRadius: 30,
                ),
              ]
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const OfficerIcon(),

                        const SizedBox(width: 10),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OfficerName(
                              snapshot: widget.snapshot,
                              index: index,
                            ),

                            const OfficerAddress(),
                          ],
                        )
                      ],
                    )
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Distance(
                    snapshot: widget.snapshot,
                    index: index,
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}