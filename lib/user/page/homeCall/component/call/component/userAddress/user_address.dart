import 'package:flutter/material.dart';
import 'package:sirene/user/page/homeCall/component/call/component/userAddress/component/address_details.dart';
import 'package:sirene/user/page/homeCall/component/call/component/userAddress/component/change_address.dart';
import 'package:sirene/user/page/homeCall/component/call/component/userAddress/component/info_icon.dart';
import 'package:sirene/user/page/homeCall/component/call/component/userAddress/component/your_location.dart';

class UserAddress extends StatefulWidget {
  const UserAddress({ super.key });

  @override
  State <UserAddress> createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 12.5),
      width: size.width,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(229, 246, 253, 1),
      ),
      child: const Row(
        children: [
          Expanded(
            flex: 1,
            child: InfoIcon(),
          ),

          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: YourLocation(),
                ),

                Expanded(
                  child: AddressDetails(),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: ChangeAddress(),
          ),
        ],
      ),
    );
  }
}