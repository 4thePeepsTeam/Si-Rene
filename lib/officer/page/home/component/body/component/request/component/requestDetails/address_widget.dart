import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sirene/globalData/auth_data.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/globalData/position_data.dart';

class AddressWidget extends StatelessWidget {
const AddressWidget({ super.key });

  Future <Response <dynamic>> getData() async {
    String caller = await FirestoreData.officer.doc(UserData.userCredential.user.uid).get().then((value) => value.data()!["calling"]);
    double callerLatitude = await FirestoreData.user.doc(caller).get().then((value) => value.data()!["location"].latitude);
    double callerLongitude = await FirestoreData.user.doc(caller).get().then((value) => value.data()!["location"].longitude);

    debugPrint("got caller coordinates");

    return await getTimeDistance(callerLatitude, callerLongitude, double.parse(userPosition["latitude"]!), double.parse(userPosition["longitude"]!));
  }

  @override
  Widget build(BuildContext context){
    return StreamBuilder(
      stream: FirestoreData.officer.doc(UserData.userCredential.user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: [
                    const Icon(
                      Icons.fmd_bad,
                      size: 18,
                      color: Color.fromRGBO(255, 87, 20, 1),
                    ),
                    
                    const SizedBox(width: 10),
                
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          snapshot.data!.data["origin_addresses"].elementAt(0),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
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
            },
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
      },
    );
  }
}