import 'package:flutter/material.dart';

class OfficerRole with ChangeNotifier {
  ValueNotifier <bool> isAmbulanceOperator = ValueNotifier <bool> (false);
  ValueNotifier <bool> isFirefighter = ValueNotifier <bool> (false);
  ValueNotifier <bool> isPolice = ValueNotifier <bool> (false);

  void ambulance() {
    isAmbulanceOperator.value = true;
    isFirefighter.value = false;
    isPolice.value = false;
    debugPrint("ambulance");
    notifyListeners();
  }

  void firefighter() {
    isAmbulanceOperator.value = false;
    isFirefighter.value = true;
    isPolice.value = false;
    debugPrint("firefighter");
    notifyListeners();
  }

  void police() {
    isAmbulanceOperator.value = false;
    isFirefighter.value = false;
    isPolice.value = true;
    debugPrint("police");
    notifyListeners();
  }
}

OfficerRole officerRole = OfficerRole();