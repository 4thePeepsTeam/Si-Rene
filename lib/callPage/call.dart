import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sirene/callPage/user_data.dart';
import 'package:sirene/customWidget/bottom_icon.dart';
import 'package:sirene/data/agora_data.dart';
import 'package:sirene/data/auth_data.dart';
import 'package:sirene/data/firestore_data.dart';

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
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(vertical: 12.5),
                    width: size.width,
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(229, 246, 253, 1),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Icon(
                              Icons.info_outlined,
                              color: Color.fromRGBO(2, 136, 209, 1),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Lokasimu Sekarang",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(1, 67, 97, 1),
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      "Kost Wisna Arjuna, Sekaran, Gn. Pati",
                                      style: TextStyle(
                                        fontSize: 14,
                                      color: Color.fromRGBO(1, 67, 97, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "UBAH", 
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(2, 136, 209, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            
                const Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Panggil Ambulans",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                  
                      Text(
                        "Tekan tombol untuk mencari bantuan ambulans terdekat",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromRGBO(13, 1, 6, 1),
                        )
                      ),
                    ],
                  ),
                ),
            
                Expanded(
                  flex: 6,
                  child: Center(
                    child: ValueListenableBuilder(
                      valueListenable: isCalling,
                      builder: (context, value, child) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedBuilder(
                              animation: _controllerBg2,
                              builder: (context, child) {
                                return Container(
                                  width: size.width * 0.6 * _bg2.value,
                                  height: size.width * 0.6 * _bg2.value,
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
                                  width: size.width * 0.55 * _bg1.value,
                                  height: size.width * 0.55 * _bg1.value,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(255, 87, 20, 0.4)
                                  ),
                                );
                              },
                            ),
                                          
                            GestureDetector(
                              onTap: () async {
                                if (value) {
                                  isCalling.value = false;
                                  AgoraData.channelName = "";
                                  debugPrint("channel name: $AgoraData.channelName");
                                  await FirestoreData.removeCallData();
                                  AgoraData.leave();
                                }
                                else {
                                  isCalling.value = true;
                                  await AgoraData.setupVoiceSDKEngine();
                                  AgoraData.channelName = UserData.userCredential.user.uid;
                                  await FirebaseFirestore.instance.collection("user").doc(FirestoreData.otherData.entries.elementAt(0).key).set({
                                    "caller": UserData.userCredential.user.uid,
                                    "isOnCall": true,
                                  }, SetOptions(merge: true));
                              
                                  await FirebaseFirestore.instance.collection("user").doc(FirestoreData.yourData.entries.elementAt(0).key).set({
                                    "caller": UserData.userCredential.user.uid,
                                    "isOnCall": true,
                                  }, SetOptions(merge: true));
                              
                                  debugPrint("channel name: $AgoraData.channelName");
                                  AgoraData.callingIndex = 0;
                                  debugPrint("calling index: 0");
                                  AgoraData.join();
                                }
                              },
                              child: Container(
                                width: size.width * 0.5,
                                height: size.width * 0.5,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(255, 87, 20, 1),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        value ? Icons.phone_paused : Icons.call_rounded,
                                        color: Colors.white,
                                        size: size.width * 0.125,
                                      ),
                              
                                      const SizedBox(height: 10),
                              
                                      Text(
                                        value ? "Batalkan" : "Panggil Ambulans",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: SizedBox.shrink(),
                ),
              ],
            ),

            SizedBox(
              width: size.width,
              height: size.height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ValueListenableBuilder(
                  valueListenable: isOpened,
                  builder: (context, value, child) {
                    return AnimatedSlide(
                      offset: value ? const Offset(0, 0) : const Offset(0, 0.66),
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOutCirc,
                      child: Container(
                        width: size.width,
                        height: (size.height * 0.3),
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
                        child: Column(
                          children: [
                            SizedBox(
                              width: size.width,
                              height: size.height * 0.1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Expanded(
                                      flex: 3,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Lihat Pilihan Lain"),
                                      )
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          icon: Icon(
                                            value ? Icons.expand_more : Icons.expand_less,
                                          ),
                                          onPressed: () {
                                            isOpened.value = !isOpened.value;
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            
                            Container(
                              width: size.width,
                              height: size.height * 0.2,
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 10,
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
                                    return SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(
                                        children: List.generate(FirestoreData.otherData.length, (index) {
                                          return Container(
                                            width: size.width,
                                            height: size.height * 0.1,
                                            margin: const EdgeInsets.only(
                                              bottom: 10,
                                            ),
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color.fromRGBO(0, 0, 0, 0.05),
                                                  offset: Offset(0, 10),
                                                  blurRadius: 30,
                                                ),
                                              ]
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          "assets/svg/ambulance.svg",
                                                        ),
                            
                                                        const SizedBox(width: 10),
                            
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text("${FirestoreData.otherData.entries.elementAt(index).value["name"]}"),
                                                            const Text(
                                                              "Kota Semarang, Jawa Tengah",
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                                color: Color.fromRGBO(13, 1, 6, 1),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  )
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          "assets/svg/distance.svg",
                                                          width: 20,
                                                          height: 20,
                                                        ),
                                                        const Text(
                                                          "500 m",
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: Color.fromRGBO(255, 87, 20, 1),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  }
                                              
                                  return const Center(
                                    child: CircularProgressIndicator()
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: Container(
        width: size.width,
        height: size.height * 0.1,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 30,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    isHome.value = true;
                    isHistory.value = false;
                    isNotification.value = false;
                    isProfile.value = false;
                  },
                  child: BottomIcon(
                    listenable: isHome,
                    icon: Icons.home_filled,
                    label: "Beranda",
                  )
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    isHome.value = false;
                    isHistory.value = true;
                    isNotification.value = false;
                    isProfile.value = false;
                  },
                  child: BottomIcon(
                    listenable: isHistory,
                    icon: Icons.history,
                    label: "Riwayat",
                  )
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    isHome.value = false;
                    isHistory.value = false;
                    isNotification.value = true;
                    isProfile.value = false;
                  },
                  child: BottomIcon(
                    listenable: isNotification,
                    icon: Icons.notifications,
                    label: "Notifikasi",
                  )
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    isHome.value = false;
                    isHistory.value = false;
                    isNotification.value = false;
                    isProfile.value = true;
                  },
                  child: BottomIcon(
                    listenable: isProfile,
                    icon: Icons.person,
                    label: "Profil",
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}