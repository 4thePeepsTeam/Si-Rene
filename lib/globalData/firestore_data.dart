import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'auth_data.dart';

mixin FirestoreData {

  static CollectionReference<Map<String, dynamic>> user = FirebaseFirestore.instance.collection("user");
  static CollectionReference<Map<String, dynamic>> officer = FirebaseFirestore.instance.collection("officer");

  static Stream <DocumentSnapshot<Map<String, dynamic>>> userDataFireStore = FirebaseFirestore.instance.collection('user').doc(UserData.userCredential.user!.uid).snapshots();

  static Map <String, dynamic> yourData = {};

  static void getFireData(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) async {

    var anything = snapshot.data!.docs.map((e) => {e.id: e.data() as Map <String, dynamic>}).toList();

    for (var element in anything) {
      yourData.addAll(element);
    }

    yourData.removeWhere((key, value) => key != UserData.userCredential.user!.uid); // isinya diri sendiri

    debugPrint("anything: $anything");
    debugPrint("yourData: $yourData");
  }

  static Future <void> removeCallData () async {
    try {
      if (UserData.userRole == "user") {
        await FirestoreData.officer.doc(yourData[UserData.userCredential.user.uid]["calling"]).set({
          "isOnCall": false,
          "remoteUid": "",
          "calling": "",
        }, SetOptions(merge: true));

        await FirestoreData.user.doc(UserData.userCredential.user!.uid).set({
          "calling": "",
          "isOnCall": false,
          "remoteUid": "",
        }, SetOptions(merge: true));
      }
      else {
        await FirestoreData.user.doc(yourData[UserData.userCredential.user.uid]["calling"]).set({
          "isOnCall": false,
          "remoteUid": "",
          "calling": "",
        }, SetOptions(merge: true));

        await FirestoreData.officer.doc(UserData.userCredential.user!.uid).set({
          "calling": "",
          "isOnCall": false,
          "remoteUid": "",
        }, SetOptions(merge: true));
      }
    } 
    catch (e) {
      debugPrint("data is not initialized yet");
    }
  }
}

mixin OfficerFireStoreData {
  static Stream <DocumentSnapshot<Map<String, dynamic>>> dataFireStore = FirebaseFirestore.instance.collection('officer').doc(UserData.userCredential.user!.uid).snapshots();
  static Stream <QuerySnapshot<Object?>> allDataFireStore = FirebaseFirestore.instance.collection('officer').snapshots();
  static Stream <DocumentSnapshot<Map<String, dynamic>>> callerData = FirestoreData.user.doc(yourData!["calling"]).snapshots();

  static late Map <String, dynamic>? yourData;
  static late String callerName;
  static Map <String, dynamic>? allData = {};

  static void getFireData(AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) async {
    debugPrint("Getting officer data");
    yourData = snapshot.data!.data();
    debugPrint(yourData.toString());
  }

  static void getAllData(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) async {
    debugPrint("Getting all officer data");
    var anything = snapshot.data!.docs.map((e) => {e.id: e.data() as Map <String, dynamic>}).toList();

    for (var element in anything) {
      allData!.addAll(element);
      debugPrint("Data added");
    }

    debugPrint("All data: $allData");
  }

  static bool isGetCall() {
    return yourData!["calling"] != "";
  }
}