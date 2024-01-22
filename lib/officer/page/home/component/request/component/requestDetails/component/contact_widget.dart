import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
const ContactWidget({ super.key });

  @override
  Widget build(BuildContext context){
    return const Row(
      children: [
        Icon(
          Icons.contact_page,
          size: 18,
          color: Color.fromRGBO(255, 87, 20, 1),
        ),
        
        SizedBox(width: 10),

        Text(
          "08123456789",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}