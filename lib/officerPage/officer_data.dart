import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_route_service/open_route_service.dart';
import 'package:sirene/data/private.dart';

ValueNotifier isHome = ValueNotifier <bool> (true);
ValueNotifier isNotification = ValueNotifier <bool> (false);
ValueNotifier isProfile = ValueNotifier <bool> (false);
List <ORSCoordinate> routeMap = [];
List <LatLng> routeCoordinates = const  [LatLng(-6.972509, 109.108648), LatLng(-6.972401, 109.108227), LatLng(-6.972082, 109.107638), LatLng(-6.971868, 109.107241), LatLng(-6.971838, 109.107177), LatLng(-6.971815, 109.107125), LatLng(-6.971747, 109.106837), LatLng(-6.971486, 109.105728), LatLng(-6.971252, 109.104698), LatLng(-6.972055, 109.104578), LatLng(-6.972409, 109.104532), LatLng(-6.972668, 109.10448), LatLng(-6.973384, 109.104399), LatLng(-6.974491, 109.10424), LatLng(-6.974943, 109.104197), LatLng(-6.975395, 109.104144), LatLng(-6.976238, 109.104006), LatLng(-6.977933, 109.103781), LatLng(-6.98105, 109.103386), LatLng(-6.98148, 109.103319), LatLng(-6.982125, 109.103251), LatLng(-6.983778, 109.10302), LatLng(-6.984846, 109.102921), LatLng(-6.985664, 109.102802), LatLng(-6.986954, 109.10257), LatLng(-6.987903, 109.102466), LatLng(-6.988615, 109.102306), LatLng(-6.988604, 109.102235), LatLng(-6.988626, 109.102101), LatLng(-6.98871, 109.102023), LatLng(-6.988821, 109.101998), LatLng(-6.990049, 109.10183), LatLng(-6.990813, 109.101728), LatLng(-6.990909, 109.101698), LatLng(-6.991012, 109.101625), LatLng(-6.991228, 109.101584), LatLng(-6.991871, 109.101454), LatLng(-6.992281, 109.101355), LatLng(-6.992326, 109.101347), LatLng(-6.992544, 109.101243), LatLng(-6.992685, 109.101204), LatLng(-6.992909, 109.101154), LatLng(-6.993001, 109.101198), LatLng(-6.9931, 109.101314), LatLng(-6.993178, 109.101221), LatLng(-6.993554, 109.101111), LatLng(-6.993976, 109.101023), LatLng(-6.994003, 109.101085), LatLng(-6.994051, 109.101104), LatLng(-6.994477, 109.101069), LatLng(-6.994512, 109.101026), LatLng(-6.99464, 109.100999), LatLng(-6.994733, 109.101003), LatLng(-6.994931, 109.100975), LatLng(-6.994992, 109.100993), LatLng(-6.995259, 109.101104), LatLng(-6.995451, 109.101227), LatLng(-6.995526, 109.101252), LatLng(-6.995568, 109.101251), LatLng(-6.995668, 109.101257), LatLng(-6.996237, 109.101215), LatLng(-6.996809, 109.101223), LatLng(-6.997401, 109.101324), LatLng(-6.99798, 109.101332), LatLng(-6.998185, 109.101339), LatLng(-6.99871, 109.101354), LatLng(-6.999069, 109.101331), LatLng(-6.999368, 109.101336), LatLng(-6.999437, 109.10132), LatLng(-7.000037, 109.101299), LatLng(-7.000317, 109.101273), LatLng(-7.000703, 109.101263), LatLng(-7.000728, 109.101251), LatLng(-7.000751, 109.101185), LatLng(-7.000745, 109.100762), LatLng(-7.000714, 109.100707), LatLng(-7.000722, 109.10067), LatLng(-7.000752, 109.100631), LatLng(-7.001389, 109.100656), LatLng(-7.002177, 109.100635), LatLng(-7.00223, 109.10062), LatLng(-7.002265, 109.100404), LatLng(-7.002259, 109.100008), LatLng(-7.002222, 109.099564), LatLng(-7.002198, 109.098767), LatLng(-7.002787, 109.098804), LatLng(-7.00317, 109.098799), LatLng(-7.003584, 109.09886), LatLng(-7.004433, 109.098887), LatLng(-7.005273, 109.098897), LatLng(-7.00558, 109.098852), LatLng(-7.006254, 109.098899), LatLng(-7.00673, 109.098916), LatLng(-7.0082, 109.098926), LatLng(-7.008845, 109.098954), LatLng(-7.009853, 109.098969), LatLng(-7.010885, 109.099026), LatLng(-7.011166, 109.099017), LatLng(-7.011221, 109.098826), LatLng(-7.011341, 109.098535), LatLng(-7.011422, 109.098443), LatLng(-7.012452, 109.098543), LatLng(-7.012532, 109.098526), LatLng(-7.013567, 109.098702), LatLng(-7.014561, 109.098827), LatLng(-7.016068, 109.098985), LatLng(-7.017017, 109.099116), LatLng(-7.01792, 109.099476), LatLng(-7.019784, 109.100254), LatLng(-7.019995, 109.100321), LatLng(-7.020362, 109.100404), LatLng(-7.020779, 109.100475), LatLng(-7.021095, 109.100547), LatLng(-7.021716, 109.100715), LatLng(-7.022683, 109.101085), LatLng(-7.022919, 109.101189), LatLng(-7.024199, 109.101649), LatLng(-7.024148, 109.102634), LatLng(-7.025887, 109.102867), LatLng(-7.030223, 109.103562), LatLng(-7.030832, 109.103644), LatLng(-7.031267, 109.1037), LatLng(-7.032535, 109.103913), LatLng(-7.034703, 109.104246), LatLng(-7.035181, 109.104334), LatLng(-7.03515, 109.105255)];

Future <List <ORSCoordinate>> getRoute(LatLng startVal, LatLng endVal) async {
  List <ORSCoordinate> routeCoordinates = await client.directionsRouteCoordsGet(
    startCoordinate: ORSCoordinate(latitude: startVal.latitude, longitude: startVal.longitude),
    endCoordinate: ORSCoordinate(latitude: endVal.latitude, longitude: endVal.longitude),
  );

  return routeCoordinates;
}