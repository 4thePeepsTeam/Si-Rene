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
            onTap: officerRole.ambulance,
            child: ValueListenableBuilder(
              valueListenable: officerRole.isAmbulanceOperator,
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
            onTap: officerRole.firefighter,
            child: ValueListenableBuilder(
              valueListenable: officerRole.isFirefighter,
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
            onTap: officerRole.police,
            child: ValueListenableBuilder(
              valueListenable: officerRole.isPolice,
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