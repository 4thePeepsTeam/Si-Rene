import 'package:flutter/material.dart';
import 'package:sirene/globalData/agora_data.dart';

class Microphone extends StatefulWidget {
  const Microphone({ super.key });

  @override
  State <Microphone> createState() => _MicrophoneState();
}

class _MicrophoneState extends State<Microphone> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}