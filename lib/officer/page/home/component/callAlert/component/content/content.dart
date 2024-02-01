import 'package:flutter/material.dart';
import 'package:sirene/officer/page/home/component/callAlert/component/content/component/alertBody/alert_body.dart';
import 'package:sirene/officer/page/home/component/callAlert/component/content/component/alertHeader/alert_header.dart';

class Content extends StatefulWidget {
  const Content({ super.key });

  @override
  State <Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
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
              child: AlertHeader(),
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