import 'package:flutter/material.dart';

class Header extends StatelessWidget {
const Header({ super.key });

  @override
  Widget build(BuildContext context){
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Pick Your Role",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromRGBO(13, 1, 6, 1),
            fontWeight: FontWeight.w500,
          ),
        ),
    
        SizedBox(height: 10),
    
        Text(
          "Pick a role according to your role on field",
          style: TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(13, 1, 6, 0.5),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}