
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

import '../../star_clipper.dart';


class BusinessDashboard extends StatefulWidget {
  static const routeName = '/business-dashboard';

  @override
  _BusinessDashboardState createState() => _BusinessDashboardState();
}

/*
menu - crm, stock, partner, marketing, wallet, order processing


*/

class _BusinessDashboardState extends State<BusinessDashboard> {
  final List<String> images = [
    'lib/assets/c1.jpeg',
    'lib/assets/c2.jpg',
    'lib/assets/c3.webp',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
              CarouselSlider(
              options: CarouselOptions(
              aspectRatio: 16 / 9,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  // Handle page change
                },
              ),
          items: images.map((assetPath) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                 // margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.asset(assetPath, fit: BoxFit.fill),
                );
              },
            );
          }).toList(),
        ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Collections",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Text("View all",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5, // Set itemCount according to your requirement
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 170,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left:5,
                                    child: Container(
                                      height:100,
                                      width: 130,
                                      child: Image.asset('lib/assets/download.jpeg'),
                                    ),
                                  ),
                                  Positioned(
                                    left: 100,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      child: ClipPath(
                                        clipper: StarClipper(10),
                                        child: Container(
                                          height: 150,
                                          color: Colors.redAccent,
                                          child: Center(child: Text("5%\nOFF", style: TextStyle(fontSize: 8,
                                          fontWeight: FontWeight.w500,color: Colors.white
                                          ),
                                          textAlign: TextAlign.center,
                                          )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 100,
                                    left: 8,
                                    child: Text(
                                      "Lenovo Ideapad",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 120,
                                    left: 8,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber[700],
                                          size: 12,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber[700],
                                          size: 12,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber[700],
                                          size: 12,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber[700],
                                          size: 12,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber[700],
                                          size: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 140,
                                    left: 8,
                                    child: Row(
                                      children: [
                                        Text(
                                          "M.R.P: ",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Rs.50.000.00",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                            decoration: TextDecoration.lineThrough,
                                            decorationThickness: 2.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 155,
                                    left: 8,
                                    child: Row(
                                      children: [
                                        Text(
                                          "Offer Price: ",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Rs.45.000.00",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: Colors.green
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                   ///
            //         SizedBox(
            //   height: 55,
            // ),
            // GridView.count(
            //   primary: false,
            //   crossAxisSpacing: 0,
            //   mainAxisSpacing: 0,
            //   crossAxisCount: 3,
            //   scrollDirection: Axis.vertical,
            //   shrinkWrap: true,
            //   padding: const EdgeInsets.all(8),
            //   children: <Widget>[
                ///
                // InkWell(
                //   onTap: () {
                //     Navigator.of(context).pushNamed(OrderProcessing.routeName);
                //   },
                //   child: Container(
                //     alignment: Alignment.center,
                //     padding: const EdgeInsets.all(8),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         // Row(
                //         //   mainAxisAlignment: MainAxisAlignment.end,
                //         //   children: [
                //         //     Card(
                //         //         color: Colors.amberAccent,
                //         //         shape: RoundedRectangleBorder(
                //         //             borderRadius: BorderRadius.circular(20)),
                //         //         child: Padding(
                //         //           padding: const EdgeInsets.symmetric(
                //         //               horizontal: 5, vertical: 1),
                //         //           child: Text(
                //         //             '2',
                //         //             style: TextStyle(
                //         //                 fontSize: 12,
                //         //                 fontWeight: FontWeight.bold),
                //         //           ),
                //         //         ))
                //         //   ],
                //         // ),
                //         Icon(
                //           Icons.shopping_basket_rounded,
                //           size: 40,
                //         ),
                //         SizedBox(
                //           height: 5,
                //         ),
                //         Text(
                //           'ORDERS MANAGEMENT',
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold, fontSize: 12),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                
                InkWell(
                  onTap: () {
                   // Navigator.of(context).pushNamed(StockManagement.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.archive_rounded,
                            size: 20,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'INVENTORY MANAGEMENT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: (() {
                //     Navigator.of(context).pushNamed(CRM.routeName);
                //   }),
                //   child: Container(
                //     padding: const EdgeInsets.all(5),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Icon(
                //           Icons.group_rounded,
                //           size: 40,
                //         ),
                //         SizedBox(
                //           height: 5,
                //         ),
                //         Text(
                //           'USERS MANAGEMENT',
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold, fontSize: 12),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                InkWell(
                  onTap: (() {
                   // Navigator.of(context).pushNamed(AcceleratePage.routeName);
                  }),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.rocket_rounded,
                            size: 20,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'MARKETING',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                InkWell(
                  onTap: () {
                   // Navigator.of(context).pushNamed(StorePublicView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.remove_red_eye_rounded,
                            size: 20,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'PUBLIC VIEW',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      // Navigator.of(context)
                      //     .pushNamed(BusinessAnalytics.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.analytics_rounded,
                              size: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'ANALYTICS',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    )),

                // InkWell(
                //   onTap: () {
                //     Navigator.of(context).pushNamed(BusinessFinance.routeName);
                //   },
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Icon(
                //         Icons.calculate_rounded,
                //         size: 40,
                //       ),
                //       SizedBox(
                //         height: 5,
                //       ),
                //       Text(
                //         'FINANCE',
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold, fontSize: 12),
                //       ),
                //     ],
                //   ),
                // ),

                InkWell(
                  onTap: () {
                  //  Navigator.of(context).pushNamed(BusinessSettings.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings_rounded,
                            size: 20,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'SETTINGS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
///
//               ],
//             ),
            ///
            SizedBox(
              height: 5,
            ),
          ]),
        ));
  }
}


