import 'package:flutter/material.dart';

class TabContainerWidget extends StatefulWidget {
  const TabContainerWidget({
    super.key,
    required this.listen,
    required this.text,
  });

  final ValueNotifier <bool> listen;
  final String text;

  @override
  State <TabContainerWidget> createState() => _TabContainerWidgetState();
}

class _TabContainerWidgetState extends State<TabContainerWidget> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return ValueListenableBuilder(
      valueListenable: widget.listen,
      builder: (context, value, child) {
        return Container(
          height: size.height * 0.05,
          padding: const EdgeInsets.all(7.5),
          decoration: BoxDecoration(
            color: value ? const Color.fromRGBO(0, 0, 0, 0.08) : const Color.fromRGBO(189, 189, 189, 1),
            borderRadius: BorderRadius.circular(size.height),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                fontSize: 10,
                color: Color.fromRGBO(0, 0, 0, 0.87),
              ),
            ),
          ),
        );
      },
    );
  }
}