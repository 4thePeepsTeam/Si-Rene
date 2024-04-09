import 'package:flutter/material.dart';

class Bg2 extends StatefulWidget {
  const Bg2({ super.key });

  @override
  State <Bg2> createState() => _Bg2State();
}

class _Bg2State extends State<Bg2> with TickerProviderStateMixin {

  late AnimationController _controllerBg2;
  late Animation <double> _bg2;

  @override
  void initState() {
    super.initState();

    _controllerBg2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _bg2 = Tween(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerBg2,
        curve: Curves.easeOutSine,
      ),
    );
    _controllerBg2.repeat(reverse: true);
  }


  @override
  void dispose() {
    _controllerBg2.dispose();

    // FirestoreData.user.doc(UserData.userCredential.user!.uid).snapshots().listen((event) {}).cancel().then((value) => debugPrint("cancelled"));

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return AnimatedBuilder(
      animation: _controllerBg2,
      builder: (context, child) {
        return Container(
          width: size.width * 0.6 * _bg2.value,
          height: size.width * 0.6 * _bg2.value,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(255, 87, 20, 0.1)
          ),
        );
      },
    );
  }
}