import 'package:flutter/material.dart';
import 'package:sirene/globalData/agora_data.dart';
import 'package:sirene/globalData/firestore_data.dart';

class HangUpAction extends StatefulWidget {
  const HangUpAction({ super.key });

  @override
  State <HangUpAction> createState() => _HangUpActionState();
}

class _HangUpActionState extends State<HangUpAction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            AgoraData.channelName = "";
            debugPrint("channel name: ${AgoraData.channelName}");
            await FirestoreData.removeCallData();
            AgoraData.leave();
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
    );
  }
}