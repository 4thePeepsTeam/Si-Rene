import 'package:flutter/material.dart';


class Bg1 extends StatefulWidget {
  const Bg1({ super.key });

  @override
  State <Bg1> createState() => _Bg1State();
}

class _Bg1State extends State<Bg1> with TickerProviderStateMixin {

  late AnimationController _controllerBg1;
  late Animation <double> _bg1;

  @override
  void initState() {
    super.initState();

    _controllerBg1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _bg1 = Tween(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerBg1,
        curve: Curves.easeOutSine,
      ),
    );

    _controllerBg1.repeat(reverse: true);
  }


  @override
  void dispose() {
    _controllerBg1.dispose();

    // FirestoreData.user.doc(UserData.userCredential.user!.uid).snapshots().listen((event) {}).cancel().then((value) => debugPrint("cancelled"));

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: _controllerBg1,
      builder: (context, child) {
        return Container(
          width: size.width * 0.55 * _bg1.value,
          height: size.width * 0.55 * _bg1.value,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(255, 87, 20, 0.4)
          ),
        );
      },
    );
  }
}