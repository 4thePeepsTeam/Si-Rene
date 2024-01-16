import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sirene/data/agora_data.dart';
import 'package:sirene/data/firestore_data.dart';
import 'package:sirene/data/user_data.dart';

class Call extends StatefulWidget {
  const Call({ super.key });

  @override
  State <Call> createState() => _CallState();
}

class _CallState extends State<Call> with TickerProviderStateMixin {

  late AnimationController _controllerBg1;
  late AnimationController _controllerBg2;

  late Animation <double> _bg1;
  late Animation <double> _bg2;

  @override
  void initState() {
    super.initState();
    _controllerBg1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _bg1 = Tween(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerBg1,
        curve: Curves.easeOutSine,
      ),
    );

    _controllerBg2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _bg2 = Tween(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerBg2,
        curve: Curves.easeOutSine,
      ),
    );

    _controllerBg1.repeat(reverse: true);
    _controllerBg2.repeat(reverse: true);
  }


  @override
  void dispose() {
    try {
      AgoraData.agoraEngine.release();
    } catch (x) {
      debugPrint("agora engine is not initialized yet");
    }
    _controllerBg1.dispose();
    _controllerBg2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: size.width,
            height: size.height * 0.05,
          ),
      
          SizedBox(
            width: size.width,
            height: size.height * 0.15,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Panggil",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 10),

                Text("Pilih salah satu user dibawah"),
              ],
            ),
          ),
      
          SizedBox(
            width: size.width,
            height: size.height * 0.4,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controllerBg2,
                    builder: (context, child) {
                      return Container(
                        width: size.width * 0.8 * _bg2.value,
                        height: size.width * 0.8 * _bg2.value,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 87, 20, 0.1)
                        ),
                      );
                    },
                  ),

                  AnimatedBuilder(
                    animation: _controllerBg1,
                    builder: (context, child) {
                      return Container(
                        width: size.width * 0.75 * _bg1.value,
                        height: size.width * 0.75 * _bg1.value,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 87, 20, 0.4)
                        ),
                      );
                    },
                  ),

                  Container(
                    width: size.width * 0.7,
                    height: size.width * 0.7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(255, 87, 20, 1)
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.call_rounded,
                            color: Colors.white,
                            size: size.width * 0.2,
                          ),
                  
                          const SizedBox(height: 10),
                  
                          const Text(
                            "Panggil\n(Pilih salah satu user)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              width: size.width - 20,
              height: (size.height * 0.3) - 20,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 5,
                    color: Color.fromARGB(31, 124, 124, 124),
                  )
                ]
              ),
              child: StreamBuilder(
                stream: FirestoreData.dataFireStore,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  }
            
                  if (snapshot.hasData) {
                    FirestoreData.getFireData(snapshot);
                    return ListView(
                      children: List.generate(FirestoreData.otherData.length, (index) {
                        return ListTile(
                          title: Text("${FirestoreData.otherData.entries.elementAt(index).value["name"]}"),
                          trailing: Builder(
                            builder: (context) {

                              if (FirestoreData.yourData.entries.elementAt(0).value["isOnCall"] && FirestoreData.otherData.entries.elementAt(index).value["caller"] == UserData.userCredential.user.uid) {
                                return IconButton(
                                  onPressed: () async {
                                    AgoraData.channelName = "";
                                    debugPrint("channel name: $AgoraData.channelName");
                                    await FirestoreData.removeCallData();
                                    AgoraData.leave();
                                  },
                                  icon: const Icon(Icons.call_rounded, color: Colors.red),
                                );
                              }
                              
                              if (FirestoreData.yourData.entries.elementAt(0).value["isOnCall"] && FirestoreData.yourData.entries.elementAt(0).value["caller"] == FirestoreData.otherData.entries.elementAt(index).value["caller"]) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          await AgoraData.setupVoiceSDKEngine();
                                          AgoraData.channelName = FirestoreData.yourData[UserData.userCredential.user.uid]["caller"];
                                          debugPrint("channel name: $AgoraData.channelName");
                                          AgoraData.callingIndex = index;
                                          debugPrint("calling index: $index");
                                          AgoraData.join();
                                        },
                                        icon: const Icon(Icons.call_rounded, color: Colors.green),
                                      ),
      
                                      IconButton(
                                        onPressed: () async {
                                          AgoraData.channelName = "";
                                          debugPrint("channel name: $AgoraData.channelName");
                                          await FirestoreData.removeCallData();
                                          AgoraData.leave();
                                        },
                                        icon: const Icon(Icons.call_rounded, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                );
                              }

                              if (FirestoreData.yourData.entries.elementAt(0).value["isOnCall"]) {
                                return const Icon(Icons.highlight_off_rounded);
                              }
                              
                              return IconButton(
                                icon: const Icon(Icons.call_rounded),
                                onPressed: () async {
                                  await AgoraData.setupVoiceSDKEngine();
                                  AgoraData.channelName = UserData.userCredential.user.uid;
                                  await FirebaseFirestore.instance.collection("user").doc(FirestoreData.otherData.entries.elementAt(index).key).set({
                                    "caller": UserData.userCredential.user.uid,
                                    "isOnCall": true,
                                  }, SetOptions(merge: true));
    
                                  await FirebaseFirestore.instance.collection("user").doc(FirestoreData.yourData.entries.elementAt(0).key).set({
                                    "caller": UserData.userCredential.user.uid,
                                    "isOnCall": true,
                                  }, SetOptions(merge: true));
    
                                  debugPrint("channel name: $AgoraData.channelName");
                                  AgoraData.callingIndex = index;
                                  debugPrint("calling index: $index");
                                  AgoraData.join();
                                },
                              );
                            }
                          )
                        );
                      }),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator()
                  );
                },
              ),
            ),
          ),

          Container(
            width: size.width,
            height: size.height * 0.1,
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: size.width * 0.2,
            ),
            child: ElevatedButton(
              onPressed: () async {
                await FirestoreData.removeCallData();
                AgoraData.leave();
                bool result = await UserData.signOutFromGoogle();
                if (result) {
                  UserData.userCredential = "";
                }
                Navigator.of(context).pop();
              },
              child: const Text("LogOut"),  
            ),
          )
        ],
      ),
    );
  }
}