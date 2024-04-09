import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sirene/user/data/user_data.dart';

class Activity extends StatefulWidget {
  const Activity({ super.key });

  @override
  State <Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 254, 251, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 254, 251, 1),
        title: const Text(
          "Activity",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder(
              valueListenable: hasOrder,
              builder: (context, value, child) {
                if (value) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Recently",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                  
                      const SizedBox(height: 10),
                      
                      Container(
                        width: size.width,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/ambulance.svg",
                                  ),
                      
                                  const SizedBox(width: 10),
                              
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rumah Sakit Bersalin Anugerah",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                      
                                      SizedBox(height: 5),
                      
                                      Text(
                                        "Kota Semarang, Jawa Tengah",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                      
                            const SizedBox(width: 10),
                        
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/distance.svg",
                                  ),
                              
                                  const SizedBox(height: 5),
                              
                                  const Text(
                                    "728 m",
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 87, 20, 1),
                                      fontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
            ),
        
            const Text(
              "Last Month",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
        
            const SizedBox(height: 10),
        
            Container(
              width: size.width,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/ambulance.svg",
                        ),

                        const SizedBox(width: 10),
                    
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rumah Sakit Bersalin Anugerah",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "Kota Semarang, Jawa Tengah",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),
              
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/distance.svg",
                        ),
                    
                        const SizedBox(height: 5),
                    
                        const Text(
                          "728 m",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 87, 20, 1),
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
        
            Container(
              width: size.width,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.fire_truck,
                          color: Colors.grey,
                        ),

                        SizedBox(width: 10),
                    
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dinas Pemadam Kebakaran Kota\nSemarang",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "Kota Semarang, Jawa Tengah",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),
              
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/distance.svg",
                        ),
                    
                        const SizedBox(height: 5),
                    
                        const Text(
                          "728 m",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 87, 20, 1),
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}