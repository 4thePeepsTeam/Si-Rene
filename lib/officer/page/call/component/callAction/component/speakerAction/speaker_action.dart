import 'package:flutter/material.dart';
import 'package:sirene/globalData/agora_data.dart';

class SpeakerAction extends StatefulWidget {
  const SpeakerAction({ super.key });

  @override
  State <SpeakerAction> createState() => _SpeakerActionState();
}

class _SpeakerActionState extends State<SpeakerAction> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}