import 'package:flutter/material.dart';

class AlertWidget extends StatefulWidget {
  const AlertWidget({ super.key });

  @override
  State <AlertWidget> createState() => _AlertWidgetState();
}

class _AlertWidgetState extends State<AlertWidget> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return Container(
      width: size.width * 0.2,
      height: size.height * 0.04,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(239, 108, 0, 1),
        borderRadius: BorderRadius.circular(size.height),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.notification_important_outlined,
              color: Colors.white,
              size: 14,
            ),
          ),
          
          SizedBox(width: 7.5),
          
          Center(
            child: Text(
              "Alert",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}