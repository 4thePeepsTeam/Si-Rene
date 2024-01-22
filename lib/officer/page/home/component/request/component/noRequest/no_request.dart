import 'package:flutter/material.dart';

class NoRequest extends StatelessWidget {
const NoRequest({ super.key });

  @override
  Widget build(BuildContext context){
    return const Center(
      child: Text(
        "You don’t have any\npending requests at the moment.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromRGBO(13, 1, 6, 1),
          fontSize: 10,
        ),
      ),
    );
  }
}