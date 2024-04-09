import 'package:flutter/material.dart';
import 'package:sirene/user/data/user_data.dart';

class ExpandBody extends StatefulWidget {
  const ExpandBody({
    super.key,
    required this.data,
  });
  
  final dynamic data;

  @override
  State <ExpandBody> createState() => _ExpandBodyState();
}

class _ExpandBodyState extends State<ExpandBody> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            const Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("See related services"),
              )
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    widget.data ? Icons.expand_more : Icons.expand_less,
                  ),
                  onPressed: () {
                    isOpened.value = !isOpened.value;
                    setState(() {});
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}