import 'package:flutter/material.dart';
import 'package:sirene/auth/page/userName/data/user_name_data.dart';

class NameForm extends StatefulWidget {
  const NameForm({ super.key });

  @override
  State <NameForm> createState() => _NameFormState();
}

class _NameFormState extends State<NameForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(0, 0, 0, 0.03),
            contentPadding: const EdgeInsets.all(0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(13, 1, 6, 0.1),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(255, 87, 20, 1),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            hintText: "Your name here",
            hintStyle: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              fontSize: 20,
            ),
          ),
          textAlign: TextAlign.center,
          onChanged: (value) {
            name = value;
            debugPrint(name);
            if (value.isNotEmpty && value != "") {
              isFilled.value = true;
            }
            else {
              isFilled.value = false;
            }
          },
        )
      ),
    );
  }
}