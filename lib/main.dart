import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sirene/auth/page/auth/auth_page.dart';
import 'package:sirene/globalData/firebase_options.dart';
import 'package:sirene/user/page/homePageUser/home_page_user.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );

    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: HomePageUser(),
    // );
  }
}

