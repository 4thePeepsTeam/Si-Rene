import 'package:flutter/material.dart';
import 'package:sirene/globalData/position_data.dart';
import 'package:sirene/user/data/user_data.dart';
import 'package:sirene/user/page/homeCall/component/call/component/officerList/component/expandBody/expand_body.dart';
import 'package:sirene/user/page/homeCall/component/call/component/officerList/component/nearestOfficer/nearest_officer.dart';

class OfficerList extends StatefulWidget {
  const OfficerList({ super.key });

  @override
  State <OfficerList> createState() => _OfficerListState();
}

class _OfficerListState extends State<OfficerList> {

  // static String isNeedHelp = "";

  @override
  void initState() {
    super.initState();

    if (!isStreamPosition) {
      subLocation = streamUserPosition.listen((event) {});
      isStreamPosition = true;
    }
  }

  @override
  void dispose() {
    subLocation.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ValueListenableBuilder(
          valueListenable: isOpened,
          builder: (context, data, child) {
            return AnimatedSlide(
              offset: data ? const Offset(0, 0) : const Offset(0, 0.66),
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOutCirc,
              child: Container(
                width: size.width,
                height: (size.height * 0.3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 5,
                      color: Color.fromARGB(31, 124, 124, 124),
                    )
                  ]
                ),
                child: Column(
                  children: [
                    ExpandBody(data: data),
                    
                    Container(
                      width: size.width,
                      height: size.height * 0.2,
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      child: FutureBuilder(
                        future: getNearbyAmbulance(context),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("Something went wrong\n${snapshot.error}"),
                            );
                          }
                          if (snapshot.hasData) {
                            officerId = snapshot.data!.data["data"].elementAt(0)["id"].toString();
                            officerName = snapshot.data!.data["data"].elementAt(0)["name"];
                            officerLatitude = snapshot.data!.data["data"].elementAt(0)["location"]["latitude"].toString();
                            officerLongitude = snapshot.data!.data["data"].elementAt(0)["location"]["longitude"].toString();
                            return NearestOfficer(snapshot: snapshot);
                          }
                                      
                          return const Center(
                            child: CircularProgressIndicator()
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ),
    );
  }
}