import 'package:flutter/material.dart';
import 'package:sirene/callPage/user_data.dart';
import 'package:sirene/globalData/agora_data.dart';
import 'package:sirene/globalData/firestore_data.dart';

class OnCall extends StatefulWidget {
  const OnCall({ super.key });

  @override
  State <OnCall> createState() => _OnCallState();
}

class _OnCallState extends State<OnCall> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: size.width,
              child: const Column(
                children: [
                  Text(
                    "Ahmad Bagas Aditya",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
    
                  SizedBox(height: 15),
    
                  Text(
                    "Call",
                    style: TextStyle(
                      fontSize: 9,
                      color: Color.fromRGBO(13, 1, 6, 1), 
                    ),
                  )
                ],
              ),
            ),
    
            const Text(
              "00:00",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
    
            SizedBox(
              width: size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          AgoraData.channelName = "";
                          debugPrint("channel name: ${AgoraData.channelName}");
                          await FirestoreData.removeCallData();
                          AgoraData.leave();
                          hasOrder.value = true;
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
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
                        "Hang up",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
    
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          if (AgoraData.isMute) {
                            await AgoraData.agoraEngine.enableLocalAudio(false).then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("mute off"),
                                ), 
                              );
                            }).onError((error, stackTrace) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("error $error"),
                                ), 
                              );
                            });
                            AgoraData.isMute = false;
                          }
                          else {
                            await AgoraData.agoraEngine.enableLocalAudio(true).then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("mute on"),
                                ), 
                              );
                            }).onError((error, stackTrace) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("error $error"),
                                ), 
                              );
                            });
                            AgoraData.isMute = true;
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.mic,
                            size: 25,
                          ),
                        ),
                      ),
                  
                      const SizedBox(height: 5),
                  
                      const Text(
                        "Microphone",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
    
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          if (AgoraData.isSpeaker) {
                            await AgoraData.agoraEngine.setDefaultAudioRouteToSpeakerphone(false).then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("speaker off"),
                                ), 
                              );
                            }).onError((error, stackTrace) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("error $error"),
                                ), 
                              );
                            });
                            AgoraData.isSpeaker = false;
                          }
                          else {
                            await AgoraData.agoraEngine.setDefaultAudioRouteToSpeakerphone(true).then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("speaker on"),
                                ), 
                              );
                            }).onError((error, stackTrace) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("error $error"),
                                ), 
                              );
                            });
                            AgoraData.isSpeaker = true;
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.volume_up,
                            size: 25,
                          ),
                        ),
                      ),
                  
                      const SizedBox(height: 5),
                  
                      const Text(
                        "Speaker",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}