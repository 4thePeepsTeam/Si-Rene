import 'package:flutter/material.dart';
import 'package:sirene/officer/page/home/component/call_alert/content/component/body/alert_body.dart';
import 'package:sirene/officer/page/home/component/call_alert/content/component/header/header.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({ super.key });

  @override
  State <ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: size.width * 0.85,
        height: size.height * 0.3,
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: size.height * 0.1,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 50,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: const Column(
          children: [
            Expanded(
              flex: 1,
              child: Header()
            ),

            Expanded(
              flex: 3,
              child: AlertBody(),
            ),
          ],
        ),
      ),
    );
  }
}