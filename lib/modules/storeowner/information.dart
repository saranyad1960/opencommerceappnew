

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart'; 
//import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:latlong2/latlong.dart';

import '../stockmanagement/categoriesmanagement.dart';
//import '../stockmanagement/offers.dart';
import '../stockmanagement/products.dart';

class BusinessInformation extends StatefulWidget {
  static const routeName = '/business-information';

  @override
  _BusinessInformationState createState() => _BusinessInformationState();
}

/* 
Mission information
business information
business area - locations, service locations
timings
industries, categories

*/


class _BusinessInformationState extends State<BusinessInformation> {
  int _currentPageIndex = 0;
  List<String> _imageUrls = [
    'lib/assets/c1.jpeg',
    'lib/assets/c2.jpg',
    'lib/assets/c3.webp',
  ];
  
  _callNumber() async {
    const number = '08592119XXXX'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body:
      // Stack(
      // children: [
      //   Container(
      //    // height: MediaQuery.of(context).size.height * 1,
      //     child:
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
              child:
              Column(
            children: [

              // MyCustomPainter(),
              Stack(
                    children: [
                      // Container(
                      //   height: 300,
                      //   child: Center(
                      //     child: GestureDetector(
                      //       behavior: HitTestBehavior.opaque,
                      //       onTap: () {
                      //         _changePage(1);
                      //       },
                      //       child: PageView.builder(
                      //         itemCount: _imageUrls.length,
                      //         controller: PageController(initialPage: _currentPageIndex),
                      //         onPageChanged: (int index) {
                      //           setState(() {
                      //             _currentPageIndex = index;
                      //           });
                      //         },
                      //         itemBuilder: (BuildContext context, int index) {
                      //           return Image.asset(_imageUrls[index],fit: BoxFit.fill,);
                      //         },
                      //       ),
                      //     ),
                      //     // Positioned.fill(
                      //     //   child: Row(
                      //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     //     children: [
                      //     //       GestureDetector(
                      //     //         onTap: (){
                      //     //           setState(() {
                      //     //             _changePage(-1);
                      //     //           });
                      //     //         },
                      //     //         child: Icon(Icons.arrow_back_ios),
                      //     //       ),
                      //     //       // IconButton(
                      //     //       //   icon: Icon(Icons.arrow_back),
                      //     //       //   onPressed: () {
                      //     //       //     _changePage(-1);
                      //     //       //   },
                      //     //       // ),
                      //     //       GestureDetector(
                      //     //         onTap: (){
                      //     //           setState(() {
                      //     //             _changePage(1);
                      //     //           });
                      //     //         },
                      //     //         child: Icon(Icons.arrow_forward_ios),
                      //     //       ),
                      //     //     ],
                      //     //   ),
                      //     // ),
                      //
                      //   ),
                      // ),


                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height * .95,
                            //alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                // image: DecorationImage(
                                //     image: ExactAssetImage('lib/assets/c4.webp'),
                                //     fit: BoxFit.fill)
                              ),
                              child: Image.asset('lib/assets/c6.jpeg',fit: BoxFit.fill,)

                          ),
                          Container(
                              height: MediaQuery.of(context).size.height * .46,
                              width: double.infinity,
                              child: Card(
                                  elevation: 4,
                                // color: Colors.white70,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          'AlphaCommerce Technologies Private Limited',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          softWrap: true,
                                        ),
                                      ),
                                      GridView.count(
                                        primary: false,
                                        crossAxisSpacing: 0,
                                        mainAxisSpacing: 0,
                                        crossAxisCount: 5,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.all(8),
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              // Navigator.of(context)
                                              //     .pushNamed(Offers.routeName);
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                      Icons.local_offer_rounded,
                                                      size: 20),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Offers',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                  Products.routeName);
                                            },
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.list_alt_rounded,
                                                      size: 20),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Products',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (() {
                                              Navigator.of(context).pushNamed(
                                                  CategoriesManagement
                                                      .routeName);
                                            }),
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.category_rounded,
                                                      size: 20),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Categories',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (() {
                                              // Navigator.of(context).pushNamed(
                                              //     AcceleratePage.routeName);
                                            }),
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                      Icons
                                                          .construction_rounded,
                                                      size: 20),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Services',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // Navigator.of(context).pushNamed(
                                              //     StorePublicView.routeName);
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.directions_rounded,
                                                      size: 20),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Direction',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (() {
                                              // Navigator.of(context)
                                              //     .pushNamed(Categories.routeName);
                                            }),
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.punch_clock,
                                                      size: 20),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'timings',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (() {
                                              // Navigator.of(context).pushNamed(
                                              //     AcceleratePage.routeName);
                                            }),
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.factory_rounded,
                                                      size: 20),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Industries',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                _callNumber();
                                                // Navigator.of(context).pushNamed(
                                                //     BusinessAnalytics.routeName);
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.phone_rounded,
                                                      size: 20),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Call',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              )),
                                          InkWell(
                                            onTap: () {
                                              // Navigator.of(context).pushNamed(
                                              //     BusinessFinance.routeName);
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Icon(Icons.message_rounded,
                                                    size: 20),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Message',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // Navigator.of(context).pushNamed(
                                              //     BusinessFinance.routeName);
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                      Icons
                                                          .question_mark_rounded,
                                                      size: 20),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Enquiry',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // Navigator.of(context).pushNamed(
                                              //     BusinessFinance.routeName);
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.search_rounded,
                                                      size: 20),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Search',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // Navigator.of(context).pushNamed(
                                              //     BusinessFinance.routeName);
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.public_rounded,
                                                      size: 20),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Website',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // Navigator.of(context).pushNamed(
                                              //     BusinessFinance.routeName);
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(top: 8,bottom: 8),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.picture_as_pdf,
                                                      size: 20),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Catalogue',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              // await FlutterEmailSender.send(
                                              //     email);
                                              // Navigator.of(context).pushNamed(
                                              //     BusinessFinance.routeName);
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                      Icons
                                                          .alternate_email_rounded,
                                                      size: 20),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Email',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              // await FlutterEmailSender.send(
                                              //     email);
                                              // Navigator.of(context).pushNamed(
                                              //     BusinessFinance.routeName);
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.add_box_rounded,
                                                      size: 20),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Follow',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))),
                        ],
                      ),
                      Positioned(
                        top:215,
                        //MediaQuery.of(context).size.height * .4,
                        left: MediaQuery.of(context).size.width * .4,
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.of(context).pushNamed(ProfilePage.routeName);
                          },
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.black26,
                            child: Container(
                              padding: const EdgeInsets.all(4.5),
                              height: 90,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    'lib/assets/c7.jpeg',
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
            


              
              // Container(
              //       height: 300,
              //       child: FlutterMap(
              //         options: MapOptions(
              //           center: LatLng(18.578290, 78.370637),
              //           zoom: 13.0,
              //           minZoom: 2.5,
              //           maxZoom: 17.5,
              //         ),
              //         layers: [
              //           PolylineLayerOptions(
              //             polylineCulling: false,
              //             polylines: [
              //               Polyline(
              //                 points: [
              //                   LatLng(18.578290, 78.370637),
              //                   LatLng(18.578290, 80.370637),
              //                   LatLng(18.578290, 90.370637),
              //                 ],
              //                 color: Colors.blue,
              //               ),
              //             ],
              //           ),
              //
              //           PolygonLayerOptions(
              //             polygonCulling: false,
              //             polygons: [
              //               Polygon(
              //                 points: [
              //                   LatLng(18.578290, 78.370637),
              //                   LatLng(18.578290, 80.370637),
              //                   LatLng(18.578290, 90.370637),
              //                   // LatLng(30, 40),
              //                   // LatLng(20, 50),
              //                   // LatLng(25, 45),
              //                 ],
              //                 color: Colors.blue,
              //               ),
              //             ],
              //           ),
              //           TileLayerOptions(
              //             urlTemplate:
              //                 "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              //             subdomains: ['a', 'b', 'c'],
              //             // attributionBuilder: (_) {
              //             //   return Text(
              //             //       "© OpenStreetMap contributors");
              //             // },
              //           ),
              //           MarkerLayerOptions(
              //             markers: [
              //               Marker(
              //                 width: 80.0,
              //                 height: 80.0,
              //                 point: LatLng(18.578290, 78.370637),
              //                 // point: LatLng(position!.latitude.toDouble(), position!.longitude.toDouble()),
              //                 builder: (ctx) => Container(
              //                   child: Icon(
              //                     Icons.location_on_rounded,
              //                     color: Colors.blue,
              //                     size: 30,
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //       ///
              //       // FlutterMap(
              //       //       options: MapOptions(),
              //       //       layers: [
              //       //         PolylineLayerOptions(
              //       //           polylineCulling: false,
              //       //           polylines: [
              //       //             Polyline(
              //       //               points: [
              //       //                 LatLng(30, 40),
              //       //                 LatLng(20, 50),
              //       //                 LatLng(25, 45),
              //       //               ],
              //       //               color: Colors.blue,
              //       //             ),
              //       //           ],
              //       //         ),
              //       //       ],
              //       //     ),
              //     ),


              // Container(
              //   child: Column(
              //     children: [
              //       Text(
              //         'Growth Hack Solutions is a software solutions and services company. Growth Hack Solutions has successfully served the technology needs of customers from diverse industries and locations. We believe we are best defined by our people - Talented, Enthusiastic and Value Driven. Today, we have a team of multiple committed people from different managerial and engineering backgrounds. They use powerful technologies to provide services for business transformation and product realization as well as complete solutions for the service provider market',
              //         softWrap: true,
              //         textAlign: TextAlign.justify,
              //       )
              //     ],
              //   ),
              // ),

              // Container(
              //   height: 300,
              //   width: double.infinity,
              //   child: FlutterMap(
              //     options: MapOptions(),
              //     layers: [
              //       PolygonLayerOptions(
              //         polygonCulling: false,
              //         polygons: [
              //           Polygon(
              //             points: [
              //               LatLng(30, 40),
              //               LatLng(20, 50),
              //               LatLng(25, 45),
              //             ],
              //             color: Colors.blue,
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              //
              // ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                margin: const EdgeInsets.all(10),
                child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 15
                ),
                child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      'OUR MISSION',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      '\"Growth Hack Solutions is a software solutions and services company. Growth Hack Solutions has successfully served the technology needs of customers from diverse industries and locations. We believe we are best defined by our people - Talented, Enthusiastic and Value Driven. Today, we have a team of multiple committed people from different managerial and engineering backgrounds. They use powerful technologies to provide services for business transformation and product realization as well as complete solutions for the service provider market\"',
                      textAlign: TextAlign.justify,
                      style: TextStyle(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
              ),
              ),
              

              // Text('vision'),
              // Text('philosophy'),
              // Text(
              //   'partners'),


              // Text('philosophy'),
              // Text('service locations, areas'),
              //
              //
              // Text('about, '),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.all(10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'BUSINESS TIMINGS',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                     // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'MONDAY',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 32),
                        Text(
                          '10:00 AM    -   ',
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '10:00 PM',
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),



                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),Row(
                     // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'TUESDAY',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 30),
                        Text(
                          '10:00 AM    -   ',
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '10:00 PM',
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),



                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),Row(
                     // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'WEDNESDAY',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '10:00 AM    -   ',
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '10:00 PM',
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),



                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'THURSDAY',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 21),
                        Text(
                          '10:00 AM    -   ',
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '10:00 PM',
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),



                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'FRIDAY',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 45),
                        Text(
                          '10:00 AM    -   ',
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '10:00 PM',
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),



                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                     // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'SATURDAY',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 22),
                        Text(
                          '10:00 AM    -   ',
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '10:00 PM',
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),



                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'SUNDAY',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 40),
                        Text(
                          '10:00 AM    -   ',
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '10:00 PM',
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                ),
              ),
              
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.all(10),
                child: Container(
                  // padding:
                  //     const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'OPERATING INDUSTRIES',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * .17,
                          child: Image.asset(
                            'lib/assets/c5.jpeg',
                            fit: BoxFit.fill,
                          )
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width * .7,
                          child: Text(
                            'OPERATING INDUSTRIES', 
                            softWrap: true,
                            style: TextStyle(
                                // fontSize: 21,
                                // fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),


                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),



                  ]),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Address: ',
                        style: TextStyle(
                          fontSize: 15,fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                          '8/1/b, ameerpet, Hyderabad.'
                      ),
                      // Container(
                      //   height: 300,
                      //   child: FlutterMap(
                      //           options: MapOptions(
                      //             center: LatLng(18.578290, 78.370637),
                      //             zoom: 13.0,
                      //             minZoom: 2.5,
                      //             maxZoom: 17.5,
                      //           ),
                      //           layers: [
                      //             // PolylineLayerOptions(
                      //             //   polylineCulling: false,
                      //             //   polylines: [
                      //             //     Polyline(
                      //             //       points: [
                      //             //         LatLng(18.578290, 78.370637),
                      //             //         LatLng(18.578290, 80.370637),
                      //             //         LatLng(18.578290, 90.370637),
                      //             //       ],
                      //             //       color: Colors.blue,
                      //             //     ),
                      //             //   ],
                      //             // ),
                      //             TileLayerOptions(
                      //               urlTemplate:
                      //                   "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      //               subdomains: ['a', 'b', 'c'],
                      //               // attributionBuilder: (_) {
                      //               //   return Text(
                      //               //       "© OpenStreetMap contributors");
                      //               // },
                      //             ),
                      //             MarkerLayerOptions(
                      //               markers: [
                      //                 Marker(
                      //                   width: 80.0,
                      //                   height: 80.0,
                      //                   point: LatLng(18.578290, 78.370637),
                      //                   // point: LatLng(position!.latitude.toDouble(), position!.longitude.toDouble()),
                      //                   builder: (ctx) => Container(
                      //                     child: Icon(
                      //                       Icons.location_on_rounded,
                      //                       color: Colors.blue,
                      //                       size: 30,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ],
                      //         ),
                      //
                      // )

                    ],
                  )
              ),
            ],
          )),
    //     ),
    //   ],
    // )
    );

  }
  void _changePage(int increment) {
    setState(() {
      _currentPageIndex =
          (_currentPageIndex + increment) % _imageUrls.length;
    });
  }
}
