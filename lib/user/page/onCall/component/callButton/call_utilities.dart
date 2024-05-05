import 'package:flutter/material.dart';
import 'package:sirene/user/page/onCall/component/callButton/component/hang_up.dart';
import 'package:sirene/user/page/onCall/component/callButton/component/microphone.dart';
import 'package:sirene/user/page/onCall/component/callButton/component/speaker.dart';

class CallUtilities extends StatefulWidget {
  const CallUtilities({ super.key });

  @override
  State <CallUtilities> createState() => _CallUtilitiesState();
}

class _CallUtilitiesState extends State<CallUtilities> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return SizedBox(
      width: size.width * 0.8,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HangUp(),

          Microphone(),

          Speaker(),
        ],
      ),
    );
  }
}