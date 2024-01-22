import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sirene/globalData/agora_data.dart';
import 'package:sirene/globalData/auth_data.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/officer/page/home/component/bottomNavigationBar/custom_bottom_navigation_bar.dart';
import 'package:sirene/officer/page/home/component/header/header.dart';
import 'package:sirene/officer/page/home/component/tab/custom_tab.dart';
import 'package:sirene/officer/page/map/map_page.dart';
import 'package:sirene/officer/data/officer_data.dart';
import 'package:sirene/officer/page/call/on_call.dart';
import 'package:slide_to_act/slide_to_act.dart';

class HomePageOfficer extends StatefulWidget {
  const HomePageOfficer({ super.key });

  @override
  State<HomePageOfficer> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageOfficer> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 2,
                  child: Header(),
                ),
                
                const Expanded(
                  flex: 1,
                  child: CustomTab(),
                ),
            
                Expanded(
                  flex: 9,
                  child: Container(
                    width: size.width,
                    height: size.height,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(243, 244, 239, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: hasOrder,
                      builder: (context, value, child) {
                        if (value) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  width: size.width * 0.2,
                                  height: size.height * 0.02,
                                  margin: const EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(239, 108, 0, 1),
                                    borderRadius: BorderRadius.circular(size.height),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.notification_important_outlined,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      ),
                                      
                                      SizedBox(width: 7.5),
                                      
                                      Center(
                                        child: Text(
                                          "Alert",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12, 
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 8,
                                child: Center(
                                  child: Image.asset(
                                    "assets/svg/ambulance_background.png",
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 8,
                                child: Container(
                                  width: size.width,
                                  margin: const EdgeInsets.all(15),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(255, 254, 251, 0.6),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text(
                                        "Ahmad Bagas Aditya",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16, 
                                        ),
                                      ),

                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.contact_page,
                                            size: 18,
                                            color: Color.fromRGBO(255, 87, 20, 1),
                                          ),
                                          
                                          SizedBox(width: 10),

                                          Text(
                                            "08123456789",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.fmd_bad,
                                            size: 18,
                                            color: Color.fromRGBO(255, 87, 20, 1),
                                          ),
                                          
                                          SizedBox(width: 10),

                                          Expanded(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              physics: BouncingScrollPhysics(),
                                              child: Text(
                                                "Jl. Dewi Sartika Barat, Sekaran, Gn. Pati, Kota Semarang, Jawa Tengah",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.map,
                                            size: 18,
                                            color: Color.fromRGBO(255, 87, 20, 1),
                                          ),
                                          
                                          const SizedBox(width: 10),

                                          const Text(
                                            "1 Km",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),

                                          const SizedBox(width: 10),

                                          SvgPicture.asset(
                                            "assets/svg/avg_pace.svg",
                                            width: 18,
                                          ),
                                          
                                          const SizedBox(width: 10),

                                          const Text(
                                            "5 mnt",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 3,
                                child: SlideAction(
                                  outerColor: const Color.fromRGBO(255, 87, 20, 1),
                                  sliderButtonIcon: const Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: Color.fromRGBO(255, 87, 20, 1),
                                    size: 16,
                                  ),
                                  onSubmit: () async {
                                    await Future.delayed(const Duration(seconds: 1));
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const MapPage();
                                        },
                                      ),
                                    );
                                  },
                                  sliderRotate: false,
                                  elevation: 0,
                                  sliderButtonIconPadding: 10,
                                  borderRadius: 12.5,
                                  text: "Accept Request ",
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          );
                        }

                        return const Center(
                          child: Text(
                            "You don’t have any\npending requests at the moment.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(13, 1, 6, 1),
                              fontSize: 10,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

        StreamBuilder(
            stream: FirestoreData.dataFireStore,
            builder: (context, snapshot) {

              if (snapshot.hasData) {
                FirestoreData.getFireData(snapshot);
                if (FirestoreData.yourData.entries.elementAt(0).value["isOnCall"]) {
                  return Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          width: size.width,
                          height: size.height,
                          color: const Color.fromRGBO(0, 0, 0, 0.2),
                        ),
                      ),

                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: size.width * 0.85,
                          height: size.height * 0.3,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: size.height * 0.1,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                blurRadius: 50,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),

                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: SvgPicture.asset(
                                          "assets/svg/logo.svg",
                                          width: size.width * 0.4,
                                        ),
                                      ),
                                  
                                      const Expanded(
                                        flex: 2,
                                        child: SizedBox.shrink(),
                                      ),
                                  
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          width: size.width * 0.2,
                                          height: size.height * 0.04,
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(239, 108, 0, 1),
                                            borderRadius: BorderRadius.circular(size.height),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Icon(
                                                  Icons.notification_important_outlined,
                                                  color: Colors.white,
                                                  size: 14,
                                                ),
                                              ),
                                              
                                              SizedBox(width: 7.5),
                                              
                                              Center(
                                                child: Text(
                                                  "Alert",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12, 
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Incoming Call",
                                            style: TextStyle(
                                              color: Color.fromRGBO(13, 1, 6, 1),
                                              fontSize: 12,
                                            ),
                                          ),

                                          Text(
                                            "Ahmad Bagas Aditya",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Expanded(
                                      flex: 3,
                                      child: Row(
                                        children: [
                                          const Expanded(
                                            flex: 1,
                                            child: SizedBox.shrink(),
                                          ),

                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    AgoraData.channelName = "";
                                                    debugPrint("channel name: ${AgoraData.channelName}");
                                                    await FirestoreData.removeCallData();
                                                    AgoraData.leave();
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets.all(8),
                                                    decoration: const BoxDecoration(
                                                      color: Color.fromRGBO(225, 87, 20, 1),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: const Icon(
                                                      Icons.call_end,
                                                      color: Color.fromRGBO(255, 254, 251, 1),
                                                      size: 25,
                                                    ),
                                                  ),
                                                ),

                                                const SizedBox(height: 5),

                                                const Text(
                                                  "Reject",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),

                                          const Expanded(
                                            flex: 1,
                                            child: SizedBox.shrink(),
                                          ),

                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    await AgoraData.setupVoiceSDKEngine();
                                                    AgoraData.channelName = FirestoreData.yourData[UserData.userCredential.user.uid]["caller"];
                                                    debugPrint("channel name: ${AgoraData.channelName}");
                                                    AgoraData.join();
                                                    hasOrder.value = true;
                                                    WidgetsBinding.instance.addPostFrameCallback((_) {
                                                      Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                          builder: (context) {
                                                            return const OnCall();
                                                          },
                                                        ),
                                                      );
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets.all(8),
                                                    decoration: const BoxDecoration(
                                                      color: Color.fromRGBO(27, 215, 65, 1),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: const Icon(
                                                      Icons.call,
                                                      color: Color.fromRGBO(255, 254, 251, 1),
                                                      size: 25,
                                                    ),
                                                  ),
                                                ),

                                                const SizedBox(height: 5),

                                                const Text(
                                                  "Accept",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),

                                          const Expanded(
                                            flex: 1,
                                            child: SizedBox.shrink(),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                )
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }
                
                return const SizedBox.shrink();
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),

      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}