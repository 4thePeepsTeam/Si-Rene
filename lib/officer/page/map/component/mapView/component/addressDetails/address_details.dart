import 'package:flutter/material.dart';

class AddressDetails extends StatefulWidget {
  const AddressDetails({ super.key });

  @override
  State <AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      width: size.width,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(255, 254, 251, 1),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  Icons.my_location,
                  size: 20,
                ),
              ),
                                    
              SizedBox(width: 10),
                                    
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Start",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10
                  ),
                ),
              ),
                                    
              SizedBox(width: 10),
                                    
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Your Location",
                  style: TextStyle(
                    fontSize: 10
                  ),
                ),
              ),
            ],
          ),

          
      
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(
              height: 1,
            ),
          ),
      
          Row(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  Icons.fmd_bad,
                  size: 20,
                ),
              ),
                                    
              SizedBox(width: 10),
                                    
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "End",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10
                  ),
                ),
              ),
                                    
              SizedBox(width: 10),
                                    
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Jl. Dewi Sartika Barat, Sekaran, Gn. Pati",
                  style: TextStyle(
                    fontSize: 10
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}