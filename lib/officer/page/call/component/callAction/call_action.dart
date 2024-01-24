import 'package:flutter/material.dart';
import 'package:sirene/globalData/agora_data.dart';
import 'package:sirene/globalData/firestore_data.dart';
import 'package:sirene/officer/page/call/component/callAction/component/hangUpAction/hang_up_action.dart';
import 'package:sirene/officer/page/call/component/callAction/component/muteAction/mute_action.dart';
import 'package:sirene/officer/page/call/component/callAction/component/speakerAction/speaker_action.dart';

class CallAction extends StatefulWidget {
  const CallAction({ super.key });

  @override
  State <CallAction> createState() => _CallActionState();
}

class _CallActionState extends State<CallAction> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.8,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HangUpAction(),

          MuteAction(),

          SpeakerAction()
        ],
      ),
    );
  }
}