import 'package:flutter/material.dart';
import 'package:sirene/user/page/homeCall/component/call/component/callButton/component/callButton/component/call_icon.dart';
import 'package:sirene/user/page/homeCall/component/call/component/callButton/component/callButton/component/call_text.dart';

class CallButtonOfficer extends StatefulWidget {
  const CallButtonOfficer({ super.key });

  @override
  State <CallButtonOfficer> createState() => _CallButtonOfficerState();
}

class _CallButtonOfficerState extends State<CallButtonOfficer> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.5,
      height: size.width * 0.5,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(255, 87, 20, 1),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CallIcon(),
    
            SizedBox(height: 10),
    
            CallText(),
          ],
        ),
      ),
    );
  }
}