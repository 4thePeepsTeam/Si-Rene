import 'package:flutter/material.dart';

ValueNotifier isHome = ValueNotifier <bool> (true);
ValueNotifier isHistory = ValueNotifier <bool> (false);
ValueNotifier isNotification = ValueNotifier <bool> (false);
ValueNotifier isProfile = ValueNotifier <bool> (false);
ValueNotifier isOpened = ValueNotifier <bool> (false);
ValueNotifier isCalling = ValueNotifier <bool> (false);
ValueNotifier hasOrder = ValueNotifier <bool> (true);
ValueNotifier pageNumber = ValueNotifier <int> (0);
ValueNotifier isOnCallPage = ValueNotifier <bool> (true);