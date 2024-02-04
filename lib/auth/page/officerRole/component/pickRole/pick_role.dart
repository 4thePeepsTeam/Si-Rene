import 'package:flutter/material.dart';
import 'package:sirene/auth/page/officerRole/data/officer_data.dart';

class PickRole extends StatefulWidget {
  const PickRole({ super.key });

  @override
  State <PickRole> createState() => _PickRoleState();
}

class _PickRoleState extends State<PickRole> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              isAmbulanceOperator.value = !(isAmbulanceOperator.value);
              isFireFighter.value = false;
              isPolice.value = false;
              if (!isChoosed.value) {
                isChoosed.value = true;
              }
              else {
                isChoosed.value = false;
              }
            },
            child: ValueListenableBuilder(
              valueListenable: isAmbulanceOperator,
              builder: (context, value, child) {
                return AnimatedContainer(
                  width: size.width,
                  padding: const EdgeInsets.all(10),
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutSine,
                  decoration: BoxDecoration(
                    color: value? const Color.fromRGBO(255, 87, 20, 1) : Colors.transparent,
                    borderRadius: BorderRadius.circular(size.height),
                    border: Border.all(
                      color: value? Colors.transparent : const Color.fromRGBO(255, 87, 20, 1),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Ambulance Operator",
                      style: TextStyle(
                        color: value? Colors.white : const Color.fromRGBO(255, 87, 20, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          GestureDetector(
            onTap: () {
              isAmbulanceOperator.value = false;
              isFireFighter.value = !(isFireFighter.value);
              isPolice.value = false;
              if (!isChoosed.value) {
                isChoosed.value = true;
              }
              else {
                isChoosed.value = false;
              }
            },
            child: ValueListenableBuilder(
              valueListenable: isFireFighter,
              builder: (context, value, child) {
                return AnimatedContainer(
                  width: size.width,
                  padding: const EdgeInsets.all(10),
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutSine,
                  decoration: BoxDecoration(
                    color: value? const Color.fromRGBO(255, 87, 20, 1) : Colors.transparent,
                    borderRadius: BorderRadius.circular(size.height),
                    border: Border.all(
                      color: value? Colors.transparent : const Color.fromRGBO(255, 87, 20, 1),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Firefighter",
                      style: TextStyle(
                        color: value? Colors.white : const Color.fromRGBO(255, 87, 20, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          GestureDetector(
            onTap: () {
              isAmbulanceOperator.value = false;
              isFireFighter.value = false;
              isPolice.value = !(isPolice.value);
              if (!isChoosed.value) {
                isChoosed.value = true;
              }
              else {
                isChoosed.value = false;
              }
            },
            child: ValueListenableBuilder(
              valueListenable: isPolice,
              builder: (context, value, child) {
                return AnimatedContainer(
                  width: size.width,
                  padding: const EdgeInsets.all(10),
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutSine,
                  decoration: BoxDecoration(
                    color: value? const Color.fromRGBO(255, 87, 20, 1) : Colors.transparent,
                    borderRadius: BorderRadius.circular(size.height),
                    border: Border.all(
                      color: value? Colors.transparent : const Color.fromRGBO(255, 87, 20, 1),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Police",
                      style: TextStyle(
                        color: value? Colors.white : const Color.fromRGBO(255, 87, 20, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}