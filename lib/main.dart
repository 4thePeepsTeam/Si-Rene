import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sirene/call.dart';
import 'package:sirene/data.dart';
import 'package:sirene/firebase_options.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
        
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  "assets/svg/auth_background.svg",
                  width: size.width * 0.6,
                  alignment: Alignment.bottomCenter,
                ),
              ),
        
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(size.width, size.height * 0.08)),
                          surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                          backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(255, 87, 20, 1)),
                        ),
                         onPressed: () async {
                          userCredential = await signInWithGoogle();
                          if (userCredential != null) {
                            print(userCredential.user.email);
                            print("credential: ${userCredential}");
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
                                  return const Call();
                                },
                              ),
                            );
                          }   
                        },
                        child: const Center(
                          child: Text(
                            "Masuk sebagai User",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
              
                      const SizedBox(height: 10),

                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(size.width, size.height * 0.08)),
                          surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                          backgroundColor: MaterialStatePropertyAll(Colors.white),
                          side: MaterialStatePropertyAll(
                            BorderSide(
                              color: Color.fromRGBO(255, 87, 20, 1),
                            ),
                          ),
                        ),
                         onPressed: () async {
                          userCredential = await signInWithGoogle();
                          if (userCredential != null) {
                            print(userCredential.user.email);
                            print("credential: ${userCredential}");
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
                                  return const Call();
                                },
                              ),
                            );
                          }   
                        },
                        child: const Center(
                          child: Text(
                            "Masuk sebagai Officer",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 87, 20, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
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