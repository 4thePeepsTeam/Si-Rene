import 'package:flutter/material.dart';
import 'package:sirene/globalData/auth_data.dart';
import 'package:sirene/globalData/firestore_data.dart';

class NameWidget extends StatelessWidget {
const NameWidget({ super.key });

  Future <String> getCallerName() async {
    return FirestoreData.user.doc(
      await FirestoreData.officer.doc(UserData.userCredential.user.uid).get().then((value) => value.data()!["calling"].toString())
    ).get().then((value) => value.data()!["name"]);
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: getCallerName(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16, 
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
      },
    );
  }
}