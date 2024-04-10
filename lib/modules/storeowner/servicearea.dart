import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
//import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:latlong2/latlong.dart';

class BusinessServiceArea extends StatefulWidget {
  static const routeName = '/business-service-area';

  @override
  _BusinessServiceAreaState createState() => _BusinessServiceAreaState();
}

/* 
search page


*/

class _BusinessServiceAreaState extends State<BusinessServiceArea> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
          'SERVICE LOCATIONS'
        ),
        actions: [
          CircleAvatar(
            // radius: 30,
            backgroundColor: Colors.black26,
            child: Container(
              padding: const EdgeInsets.all(4.5),
              height: 40,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/1.jpg',
                    fit: BoxFit.fill,
                  )),
            ),
          ),
        ],
      ),


      body: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: 
              SingleChildScrollView(
                child:               Container(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      // Container(
                      //       height: MediaQuery.of(context).size.height * .5,
                      //       child:  FlutterMap(
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
                      //             PolygonLayerOptions(
                      //               polygonCulling: false,
                      //               polygons: [
                      //                 Polygon(
                      //                   points: [
                      //                     LatLng(18.578290, 78.370637),
                      //                     LatLng(18.578290, 80.370637),
                      //                     LatLng(18.578290, 90.370637),
                      //                     // LatLng(30, 40),
                      //                     // LatLng(20, 50),
                      //                     // LatLng(25, 45),
                      //                   ],
                      //                   color: Colors.blue,
                      //                 ),
                      //               ],
                      //             ),
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
                      //         // FlutterMap(
                      //         //       options: MapOptions(),
                      //         //       layers: [
                      //         //         PolylineLayerOptions(
                      //         //           polylineCulling: false,
                      //         //           polylines: [
                      //         //             Polyline(
                      //         //               points: [
                      //         //                 LatLng(30, 40),
                      //         //                 LatLng(20, 50),
                      //         //                 LatLng(25, 45),
                      //         //               ],
                      //         //               color: Colors.blue,
                      //         //             ),
                      //         //           ],
                      //         //         ),
                      //         //       ],
                      //         //     ),
                      //   ),
                       Container(
                        color: Colors.white,
                          // padding:
                          //     const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'SERVICE LOCATION LIST',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.map_rounded),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Text(
                                        'OPERATING INDUSTRIES',
                                        softWrap: true,
                                        style: TextStyle(
                                          // fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.map_rounded),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Text(
                                        'OPERATING INDUSTRIES',
                                        softWrap: true,
                                        style: TextStyle(
                                          // fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.map_rounded),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Text(
                                        'OPERATING INDUSTRIES',
                                        softWrap: true,
                                        style: TextStyle(
                                          // fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.map_rounded),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Text(
                                        'OPERATING INDUSTRIES',
                                        softWrap: true,
                                        style: TextStyle(
                                          // fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.map_rounded),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Text(
                                        'OPERATING INDUSTRIES',
                                        softWrap: true,
                                        style: TextStyle(
                                          // fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.map_rounded),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Text(
                                        'OPERATING INDUSTRIES',
                                        softWrap: true,
                                        style: TextStyle(
                                          // fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.map_rounded),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Text(
                                        'OPERATING INDUSTRIES',
                                        softWrap: true,
                                        style: TextStyle(
                                          // fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.map_rounded),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Text(
                                        'OPERATING INDUSTRIES',
                                        softWrap: true,
                                        style: TextStyle(
                                          // fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.map_rounded),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Text(
                                        'OPERATING INDUSTRIES',
                                        softWrap: true,
                                        style: TextStyle(
                                          // fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.map_rounded),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Text(
                                        'OPERATING INDUSTRIES',
                                        softWrap: true,
                                        style: TextStyle(
                                          // fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.map_rounded),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Text(
                                        'OPERATING INDUSTRIES',
                                        softWrap: true,
                                        style: TextStyle(
                                          // fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.map_rounded),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Text(
                                        'OPERATING INDUSTRIES',
                                        softWrap: true,
                                        style: TextStyle(
                                          // fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ]),
                        ),
                        
                    ],
                  ),
                ),


              ),
              
 

           
      ),
      
    );
  }
}
