import 'package:flutter/material.dart';
import 'package:sirene/auth/page/userName/component/continue/continue.dart';
import 'package:sirene/auth/page/userName/component/header/header.dart';
import 'package:sirene/auth/page/userName/component/nameForm/name_form.dart';

class UserNamePage extends StatefulWidget {
  const UserNamePage({ super.key });

  @override
  State <UserNamePage> createState() => _UserNamePageState();
}

class _UserNamePageState extends State<UserNamePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Header(),

              NameForm(),

              Continue(),
            ],
          ),
        ),
      ),
    );
  }
}