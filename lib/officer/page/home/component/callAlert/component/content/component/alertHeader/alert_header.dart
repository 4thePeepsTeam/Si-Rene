import 'package:flutter/material.dart';
import 'package:sirene/officer/page/home/component/callAlert/component/content/component/alertHeader/component/alert_widget.dart';
import 'package:sirene/officer/page/home/component/callAlert/component/content/component/alertHeader/component/logo_widget.dart';

class AlertHeader extends StatelessWidget {
const AlertHeader({ super.key });

  @override
  Widget build(BuildContext context){
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