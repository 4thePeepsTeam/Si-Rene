import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'agora_data.dart';
import 'user_data.dart';

mixin FirestoreData {
  static Stream <QuerySnapshot<Object?>> dataFireStore = FirebaseFirestore.instance.collection('user').snapshots();

  static Map <String, dynamic> otherData = {};
  static Map <String, dynamic> yourData = {};
  static Map <String, dynamic> allData = {};

  static void getFireData(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) async {

    var anything = snapshot.data!.docs.map((e) => {e.id: e.data() as Map <String, dynamic>}).toList();

    anything.forEach((element) {
      allData.addAll(element);
    });

    otherData.addAll(allData);
    yourData.addAll(allData);

    yourData.removeWhere((key, value) => key != UserData.userCredential.user!.uid); // isinya diri sendiri
    otherData.removeWhere((key, value) => key == UserData.userCredential.user!.uid); // selain  diri sendiiri

    print("anything: $anything");
    print("allData: $allData");
    print("yourData: $yourData");
    print("otherData: $otherData");
  }

  static Future <void> removeCallData () async {
    try {
      if (AgoraData.callingIndex != -1) {
        await FirebaseFirestore.instance.collection("user").doc(otherData.entries.elementAt(AgoraData.callingIndex).key).set({
          "caller": "",
          "isOnCall": false,
          "remoteUid": "",
          "calling": "",
        }, SetOptions(merge: true));
      }
    } 
    catch (e) {
      print("data is not initialized yet");
    }

    try {
      await FirebaseFirestore.instance.collection("user").doc(yourData.entries.elementAt(0).key).set({
        "caller": "",
        "isOnCall": false,
        "remoteUid": "",
        "calling": "",
      }, SetOptions(merge: true));
    }
    catch (e) {
      print("data is not initialized yet");
    }
  }
}