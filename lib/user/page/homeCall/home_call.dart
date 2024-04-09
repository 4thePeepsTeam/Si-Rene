import 'package:flutter/material.dart';
import 'package:sirene/user/page/homeCall/component/activity/activity.dart';
import 'package:sirene/user/page/homeCall/component/call/call.dart';
import 'package:sirene/user/data/user_data.dart';
import 'package:sirene/user/page/homeCall/component/customBottomNavigationBar/custom_bottom_navigation_bar.dart';

class HomeCall extends StatefulWidget {
  const HomeCall({ super.key });

  @override
  State <HomeCall> createState() => _HomeCallState();
}

class _HomeCallState extends State<HomeCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageNumber,
        builder: (context, value, child) {
          if (value == 0) {
            return const Call();
          }

          return const Activity();
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}