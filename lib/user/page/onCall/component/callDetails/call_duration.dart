import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sirene/globalData/position_data.dart';

class CallDuration extends StatefulWidget {
  const CallDuration({ super.key });

  @override
  State <CallDuration> createState() => _CallDurationState();
}

class _CallDurationState extends State<CallDuration> {

  static ValueNotifier <int> callDurationSeconds = ValueNotifier <int> (0); 
  static int callDurationMinutes = 0, callDurationHours = 0;


  Stream <void> timer = Stream.periodic(const Duration(seconds: 1), (seconds) {
    callDurationSeconds.value += 1;

    if (callDurationSeconds.value >= 60) {
      callDurationMinutes += callDurationSeconds.value ~/ 60;
      callDurationSeconds.value %= 60;
    }

    if (callDurationMinutes >= 60) {
      callDurationHours += callDurationMinutes ~/ 60;
      callDurationMinutes %= 60;
    }
  });



  late StreamSubscription timerSub;

  bool subStarted = false;

  @override
  void initState() {
    timerSub = timer.listen((event) { });
    timerSub.pause();
    super.initState();
  }
  
  @override
  void dispose() {
    super.dispose();
    timerSub.cancel();
    callDurationSeconds.value = 0;
    callDurationMinutes = 0;
    callDurationHours = 0;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('officer').doc(officerId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          debugPrint(snapshot.data!.data()!["isOnCall"].toString());
          if (snapshot.data!.data()!["isOnCall"]) {
            if (!subStarted) {
              timerSub.resume();
              subStarted = true;
            }

            return ValueListenableBuilder(
              valueListenable: callDurationSeconds,
              builder:(context, value, child) {
                if (callDurationHours > 0) {
                  return Text(
                    "$callDurationHours:$callDurationMinutes:$value",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  );
                }

                if (callDurationMinutes > 9 && callDurationSeconds.value > 9) {
                  return Text(
                    "$callDurationMinutes:$value",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  );
                }

                if (callDurationMinutes > 9) {
                  return Text(
                    "$callDurationMinutes:0$value",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  );
                }

                if (callDurationSeconds.value > 9) {
                  return Text(
                    "0$callDurationMinutes:$value",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  );
                }

                if (callDurationSeconds.value == 0) {
                  return Text(
                    "0$callDurationMinutes:0$value",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  );
                }

                return Text(
                  "0$callDurationMinutes:0$value",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                );  
              },
            );
          }
        }

        return const Text(
          "Waiting...",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        );
      },
    );
  }
}