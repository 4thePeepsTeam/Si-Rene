import 'package:flutter/material.dart';
import 'package:sirene/officer/page/home/component/customTab/data/data.dart';
import 'package:sirene/officer/page/home/component/customTab/component/tabContainerWidget/tab_container_widget.dart';

class CustomTab extends StatefulWidget {
  const CustomTab({ super.key });

  @override
  State <CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TabContainerWidget(
            listen: isRequest,
            text: "Request",
          ),

          const SizedBox(width: 10),

          TabContainerWidget(
            listen: isInProgress,
            text: "In Progress",
          ),

          const SizedBox(width: 10),

          TabContainerWidget(
            listen: isDone,
            text: "Done",
          ),
        ],
      ),
    );
  }
}