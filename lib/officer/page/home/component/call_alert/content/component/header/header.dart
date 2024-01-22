import 'package:flutter/material.dart';
import 'package:sirene/officer/page/home/component/call_alert/content/component/header/alert_widget.dart';
import 'package:sirene/officer/page/home/component/call_alert/content/component/header/logo_widget.dart';

class Header extends StatefulWidget {
  const Header({ super.key });

  @override
  State <Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: LogoWidget()
          ),
      
          Expanded(
            flex: 2,
            child: SizedBox.shrink(),
          ),
      
          Expanded(
            flex: 1,
            child: AlertWidget()
          ),
        ],
      ),
    );
  }
}