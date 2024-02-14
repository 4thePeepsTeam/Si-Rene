import 'package:flutter/material.dart';
import 'package:sirene/auth/page/officerRole/component/continue/continue.dart';
import 'package:sirene/auth/page/officerRole/component/header/header.dart';
import 'package:sirene/auth/page/officerRole/component/pickRole/pick_role.dart';

class OfficerRolePage extends StatefulWidget {
  const OfficerRolePage({ super.key });

  @override
  State <OfficerRolePage> createState() => _OfficerRolePageState();
}

class _OfficerRolePageState extends State<OfficerRolePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Header(),

              PickRole(),

              Continue()              
            ],
          ),
        ),
      ),
    );
  }
}