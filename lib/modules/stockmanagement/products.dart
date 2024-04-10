import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:opencommerce/modules/stockmanagement/editproduct.dart';
import 'package:opencommerce/modules/stockmanagement/productdetail.dart';

import '../../expandable_text.dart';
import '../../star_clipper.dart';
import '../storeowner/editstore.dart';

class Products extends StatefulWidget {
  static const routeName = '/products';

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  // public view, owner view, 


  @override
  Widget build(BuildContext context) {
    Widget _rowProducts = Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) =>
                  ProductDetail()));
            },
            child: Container(
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
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.5, // Example maxHeight
                ),
                width: MediaQuery.of(context).size.width * .48,
                child: Stack(
                  children: [
                    IntrinsicHeight(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            // ExploreProducts()
                            Container(

                              // width: MediaQuery.of(context).size.width * .49,
                              // height: 300,
                              // padding: const EdgeInsets.all(8),
                              child: Stack(
                               // mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Container(
                                    height: 168,
                                    // width: 128,
                                    child: Image.asset(
                                      'lib/assets/download.jpeg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Positioned(
                                    right: 4,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      child: ClipPath(
                                        clipper: StarClipper(10),
                                        child: Container(
                                          height: 150,
                                          color: Colors.redAccent,
                                          child: Center(child: Text("- 54%", style: TextStyle(fontSize: 10,
                                              fontWeight: FontWeight.w500,color: Colors.white
                                          ),
                                            textAlign: TextAlign.center,
                                          )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                // width: MediaQuery.of(context).size.width * .5,
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ExpandableTextWidget(
                                    text:
                                    'Lenovo IdeaPad Gaming 3i Core i7 11th Gen - (8 GB/512 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce RTX 3050/120 Hz) IPG3-15IHU6 Gaming Laptop  (15.6 inch, Shadow Black, 2.25 kg)',
                                    maxLines: 3,
                                    textStyle: TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                  // Text(
                                  //   'Lenovo IdeaPad Gaming 3i Core i7 11th Gen - (8 GB/512 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce RTX 3050/120 Hz) IPG3-15IHU6 Gaming Laptop  (15.6 inch, Shadow Black, 2.25 kg)',
                                  //   style: TextStyle(
                                  //       fontSize: 12, fontWeight: FontWeight.bold),
                                  //   softWrap: true,
                                  // ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text("Ratings:",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber[700],
                                                size: 15,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber[700],
                                                size: 15,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber[700],
                                                size: 15,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber[700],
                                                size: 15,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber[700],
                                                size: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text("M.R.P : ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                        ),
                                        Text(
                                          'Rs.50,00,000.93',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              decoration: TextDecoration.lineThrough,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w900),
                                          softWrap: true,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text("Offer Price : ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                        ),
                                        Text(
                                          'Rs.45,00,000.93',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w900),
                                          softWrap: true,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                    // Positioned(
                    //   top: 2,
                    //   right: 1,
                    //   child: ClipRRect(
                    //       borderRadius: BorderRadius.circular(100),
                    //       child: Container(
                    //         color: Colors.redAccent,
                    //         padding: const EdgeInsets.all(10),
                    //         child: Text(
                    //           '- 43 %',
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 15,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //       )),
                    // )
                  ],
                )),
          ),
          Container(
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
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5, // Example maxHeight
              ),
              width: MediaQuery.of(context).size.width * .48,
              // child: Stack(
              //   children: [
                 child:
                 IntrinsicHeight(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          // ExploreProducts()
                        //  Container(
                            // width: MediaQuery.of(context).size.width * .49,
                            // height: 100,
                            // padding: const EdgeInsets.all(8),
                            // child: Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 168,
                                      // width: 128,
                                      child: Image.asset(
                                        'lib/assets/download (2).jpeg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      right: 4,
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        child: ClipPath(
                                          clipper: StarClipper(10),
                                          child: Container(
                                            height: 150,
                                            color: Colors.redAccent,
                                            child: Center(child: Text("- 54%", style: TextStyle(fontSize: 10,
                                                fontWeight: FontWeight.w500,color: Colors.white
                                            ),
                                              textAlign: TextAlign.center,
                                            )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            //   ],
                            // ),
                        //  ),
                          Container(
                              // width: MediaQuery.of(context).size.width * .5,
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: ExpandableTextWidget(
                                  text:
                                  'Lenovo IdeaPad Gaming 3i Core i7 11th Gen - (8 GB/512 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce RTX 3050/120 Hz) IPG3-15IHU6 Gaming Laptop  (15.6 inch, Shadow Black, 2.25 kg)',
                                  maxLines: 3,
                                  textStyle: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                // Text(
                                //   'Lenovo IdeaPad Gaming 3i Core i7 11th Gen - (8 GB/512 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce RTX 3050/120 Hz) IPG3-15IHU6 Gaming Laptop  (15.6 inch, Shadow Black, 2.25 kg)',
                                //   style: TextStyle(
                                //       fontSize: 12, fontWeight: FontWeight.bold),
                                //   softWrap: true,
                                // ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text("Ratings:",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber[700],
                                              size: 15,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber[700],
                                              size: 15,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber[700],
                                              size: 15,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber[700],
                                              size: 15,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber[700],
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text("M.R.P : ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                      ),
                                      Text(
                                        'Rs.50,00,000.93',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            decoration: TextDecoration.lineThrough,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900),
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text("Offer Price : ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                      ),
                                      Text(
                                        'Rs.45,00,000.93',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900),
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),),
                  // Positioned(
                  //   top: 2,
                  //   right: 1,
                  //   child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(100),
                  //       child: Container(
                  //         color: Colors.redAccent,
                  //         padding: const EdgeInsets.all(10),
                  //         child: Text(
                  //           '- 43 %',
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 15,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       )),
                  // )
              //   ],
              // )
          ),
        ],
      )
    );



    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BUSINESS',
          ),
          actions: [
            IconButton(
              onPressed: () {

              },
              icon: Icon(
                Icons.add_rounded,
              ),
              tooltip: 'Create Ad Campaign',
            ),
            SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: SingleChildScrollView(
            child: Column(
              children: [

                _rowProducts,




              ],
            )            
          )
        )
            
    );
  }
}



