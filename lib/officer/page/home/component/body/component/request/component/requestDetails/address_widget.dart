import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
const AddressWidget({ super.key });

  @override
  Widget build(BuildContext context){
    return const Row(
      children: [
        Icon(
          Icons.fmd_bad,
          size: 18,
          color: Color.fromRGBO(255, 87, 20, 1),
        ),
        
        SizedBox(width: 10),

        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Text(
              "Jl. Dewi Sartika Barat, Sekaran, Gn. Pati, Kota Semarang, Jawa Tengah",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}