import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sirene/globalData/auth_data.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/globalData/position_data.dart';

class AddressDetails extends StatefulWidget {
  const AddressDetails({ super.key });

  @override
  State <AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {

  Future <Response <dynamic>> getData() async {
    String caller = await FirestoreData.officer.doc(UserData.userCredential.user.uid).get().then((value) => value.data()!["calling"]);
    double callerLatitude = await FirestoreData.user.doc(caller).get().then((value) => value.data()!["location"].latitude);
    double callerLongitude = await FirestoreData.user.doc(caller).get().then((value) => value.data()!["location"].longitude);

    debugPrint("got caller coordinates");

    return await getTimeDistance(callerLatitude, callerLongitude, double.parse(userPosition["latitude"]!), double.parse(userPosition["longitude"]!));
  }
  
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return StreamBuilder(
      stream: FirestoreData.officer.doc(UserData.userCredential.user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.data()!["isOnDuty"]) {
            return FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    width: size.width,
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(255, 254, 251, 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Icon(
                                Icons.my_location,
                                size: 20,
                              ),
                            ),
                                                  
                            const SizedBox(width: 10),
                                                  
                            const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Start",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10
                                ),
                              ),
                            ),
                                                  
                            const SizedBox(width: 10),
                                                  
                            Expanded(
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  snapshot.data!.data["origin_addresses"].elementAt(0),
                                  style: const TextStyle(
                                    fontSize: 10
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                  
                        
                    
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Divider(
                            height: 1,
                          ),
                        ),
                    
                        Row(
                          children: [
                            const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Icon(
                                Icons.fmd_bad,
                                size: 20,
                              ),
                            ),
                                                  
                            const SizedBox(width: 10),
                                                  
                            const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "End",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10
                                ),
                              ),
                            ),
                                                  
                            const SizedBox(width: 10),
                                                  
                            Expanded(
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  snapshot.data!.data["destination_addresses"].elementAt(0),
                                  style: const TextStyle(
                                    fontSize: 10
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    width: size.width,
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(255, 254, 251, 1),
                    ),
                    child: Center(
                      child: Text("Error\n${snapshot.error}"),
                    ),
                  );
                }

                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  width: size.width,
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(255, 254, 251, 1),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            );
          }

          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            width: size.width,
            height: size.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromRGBO(255, 254, 251, 1),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text("Error\n${snapshot.error}"),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}