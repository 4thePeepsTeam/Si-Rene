import 'dart:async';

import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  const Time({ super.key });

  @override
  State <Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  
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