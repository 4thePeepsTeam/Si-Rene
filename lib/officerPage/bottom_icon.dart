import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomIcon extends StatefulWidget {
  const BottomIcon({
    Key? key,
    required this.listenable,
    required this.icon,
    required this.label, 
  }) : super(key: key);

  final ValueListenable<dynamic> listenable;
  final IconData icon;
  final String label;

  @override
  State <BottomIcon> createState() => _BottomIconState();
}

class _BottomIconState extends State<BottomIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ValueListenableBuilder(
          valueListenable: widget.listenable,
          builder: (context, value, child) {
            return AnimatedCrossFade(
              firstChild: Icon(
                widget.icon,
                color:Color.fromRGBO(255, 87, 20, 1), 
              ),
              secondChild: Icon(
                widget.icon,
                color:Color.fromRGBO(28, 27, 31, 1), 
              ),
              firstCurve: Curves.easeInOut,
              secondCurve: Curves.easeInOut,
              crossFadeState: value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 250),
            );
          },
        ),
                        
        ValueListenableBuilder(
          valueListenable: widget.listenable,
          builder: (context, value, child) {
            return AnimatedCrossFade(
              firstChild: Text(
                widget.label,
                style: TextStyle(
                  color:Color.fromRGBO(255, 87, 20, 1),
                )
              ),
              secondChild: Text(
                widget.label,
                style: TextStyle(
                  color:Color.fromRGBO(28, 27, 31, 1),
                ),
              ),
              firstCurve: Curves.easeInOut,
              secondCurve: Curves.easeInOut,
              crossFadeState: value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 250)
            );
          },
        ),
      ],
    );
  }
}