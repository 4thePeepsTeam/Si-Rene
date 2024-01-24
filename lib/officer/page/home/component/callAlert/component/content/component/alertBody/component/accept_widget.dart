import 'package:flutter/material.dart';
import 'package:sirene/globalData/agora_data.dart';
import 'package:sirene/globalData/auth_data.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/officer/data/officer_data.dart';
import 'package:sirene/officer/page/call/call_page.dart';

class AcceptWidget extends StatefulWidget {
  const AcceptWidget({ super.key });

  @override
  State <AcceptWidget> createState() => _AcceptWidgetState();
}

class _AcceptWidgetState extends State<AcceptWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    return const CallPage();
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
    );
  }
}