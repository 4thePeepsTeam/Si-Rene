
import 'package:flutter/material.dart';
import 'package:sirene/globalData/agora_data.dart';
import 'package:sirene/user/page/homeCall/component/call/component/callButton/call_button.dart';
import 'package:sirene/user/page/homeCall/component/call/component/callHeader/call_header.dart';
import 'package:sirene/user/page/homeCall/component/call/component/officerList/officer_list.dart';
import 'package:sirene/user/page/homeCall/component/call/component/userAddress/user_address.dart';

class Call extends StatefulWidget {
  const Call({ super.key });

  @override
  State <Call> createState() => _CallState();
}

class _CallState extends State<Call> with TickerProviderStateMixin {
  
  @override
  void dispose() {
    try {
      AgoraData.agoraEngine.release();
    } catch (x) {
      debugPrint("agora engine is not initialized yet");
    }
    
    // FirestoreData.user.doc(UserData.userCredential.user!.uid).snapshots().listen((event) {}).cancel().then((value) => debugPrint("cancelled"));

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: UserAddress(),
                ),
            
                Expanded(
                  flex: 2,
                  child: CallHeader(),
                ),
            
                Expanded(
                  flex: 6,
                  child: CallButton(),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox.shrink(),
                ),
              ],
            ),

            OfficerList(),
          ],
        ),
      ),
    );
  }
}