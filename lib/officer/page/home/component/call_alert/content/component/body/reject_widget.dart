import 'package:flutter/material.dart';
import 'package:sirene/globalData/agora_data.dart';
import 'package:sirene/globalData/firestore_data.dart';

class RejectWidget extends StatefulWidget {
  const RejectWidget({ super.key });

  @override
  State <RejectWidget> createState() => _RejectWidgetState();
}

class _RejectWidgetState extends State<RejectWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}