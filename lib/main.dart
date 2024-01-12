import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sirene/call.dart';
import 'package:sirene/data.dart';
import 'package:sirene/firebase_options.dart';

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
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({ Key? key }) : super(key: key);

  @override
  State <Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: size.width,
        height: size.height,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () async {
              userCredential = await signInWithGoogle();
              if (userCredential != null) {
                print(userCredential.user.email);
                  await FirebaseFirestore.instance.collection("user").doc(userCredential.user.uid).get().then((value) async {
                  if (!value.exists) {
                    await FirebaseFirestore.instance.collection("user").doc(userCredential.user.uid).set({
                      "name": userCredential.user.displayName,
                      "isOnCall": false,
                      "caller": "",
                      "remoteUid": "",
                      "calling": "",
                    }); 
                  }
                }); 
                await removeCallData();
                leave();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Call();
                    },
                  ),
                );
              }   
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: size.height * 0.08,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
              child: const Center(
                child: Text(
                  "Sign Up",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future <dynamic> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } on Exception catch(e) {
    print("An error occurred $e");
  }
}

Future <bool> signOutFromGoogle() async {
  try {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    return true;
  } on Exception catch(_) {
    return false;
  }
}