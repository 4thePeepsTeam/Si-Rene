import 'package:flutter/material.dart';
import 'package:sirene/officer/page/home/component/call_alert/content/component/body/accept_widget.dart';
import 'package:sirene/officer/page/home/component/call_alert/content/component/body/caller_widget.dart';
import 'package:sirene/officer/page/home/component/call_alert/content/component/body/reject_widget.dart';

class AlertBody extends StatefulWidget {
  const AlertBody({ super.key });

  @override
  State <AlertBody> createState() => _AlertBodyState();
}

class _AlertBodyState extends State<AlertBody> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: CallerWidget(),
        ),

        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox.shrink(),
              ),

              Expanded(
                flex: 1,
                child: RejectWidget(),
              ),

              Expanded(
                flex: 1,
                child: SizedBox.shrink(),
              ),

              Expanded(
                flex: 1,
                child: AcceptWidget()
              ),

              Expanded(
                flex: 1,
                child: SizedBox.shrink(),
              ),
            ],
          ),
        ),

      ],
    );
  }
}