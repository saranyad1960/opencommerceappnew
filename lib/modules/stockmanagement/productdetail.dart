import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

import '../../expandable_text.dart';
import '../../star_clipper.dart';
import '../../tabs.dart';
import 'editproduct.dart';




class ProductDetail extends StatefulWidget {
  static const routeName = '/product-detail';

  @override
  _ProductDetailState createState() => _ProductDetailState();
}
// public view, owner view

class _ProductDetailState extends State<ProductDetail> {
  int _currentPageIndex = 0;
  bool _isFavorite = false;
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      if (_quantity < 10) {
        _quantity++;
      } else {
        _showSnackBar("Sorry...No stocks available");
      }
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }



  List<String> _imageUrls = [
    'lib/assets/download.jpeg',
    'lib/assets/download (1).jpeg',
    'lib/assets/download (2).jpeg',
  ];


  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          leading: GestureDetector(
            onTap: (){
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) =>
                  Tabs()));
            },
            child: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
          ),
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'CATALOGUE MANAGEMENT',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),
                ),
              ),
              Spacer(),
              Badge(
                backgroundColor: Colors.redAccent,
                label: Text('3', style: TextStyle(color: Colors.white)),
                child: Icon(Icons.shopping_cart,color: Colors.white,),
              ),
            ],
          ),
          // actions: [
          //   SizedBox(
          //     width: 5,
          //   ),
          // ],
        ),
        body: Container(
            height: MediaQuery.of(context).size.height * 1,
            color: Colors.white,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .4,
                      color: Colors.white,
                      child:
                      // CarouselSlider(
                      //   options: CarouselOptions(
                      //     height: MediaQuery.of(context).size.height * .4,
                      //     // aspectRatio: 16 / 9,
                      //     pauseAutoPlayOnTouch: true,
                      //     viewportFraction: 1.05,
                      //     initialPage: 0,
                      //     enableInfiniteScroll: true,
                      //     reverse: false,
                      //     autoPlay: false,
                      //     autoPlayInterval: Duration(seconds: 5),
                      //     autoPlayAnimationDuration:
                      //         Duration(milliseconds: 800),
                      //     autoPlayCurve: Curves.linear,
                      //     enlargeCenterPage: true,
                      //     scrollDirection: Axis.horizontal,
                      //   ),
                      //   items: [1, 2, 3, 4, 5].map((i) {
                      //     return Builder(
                      //       builder: (BuildContext context) {
                      //         return InkWell(
                      //           onTap: () {},
                      //           child: Container(
                      //             child: Image.asset(
                      //               'lib/assets/download.jpeg',
                      //               fit: BoxFit.fill,
                      //             ),
                      //             // child: Center(child: Text('text $i', style: TextStyle(fontSize: 16.0),))
                      //           ),
                      //         );
                      //       },
                      //     );
                      //   }).toList(),
                      // ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          _changePage(1);
                        },
                        child: PageView.builder(
                          itemCount: _imageUrls.length,
                          controller: PageController(initialPage: _currentPageIndex),
                          onPageChanged: (int index) {
                            setState(() {
                              _currentPageIndex = index;
                            });
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Image.asset(_imageUrls[index],fit: BoxFit.fill,);
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      left: 4,
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
                      // ClipRRect(
                      //     borderRadius: BorderRadius.circular(100),
                      //     child: Container(
                      //       color: Colors.redAccent,
                      //       padding: const EdgeInsets.all(10),
                      //       child: Text(
                      //         '- 54 %',
                      //         style: TextStyle(
                      //             color: Colors.white,
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     )),
                    ),
                    Positioned(
                        top: 4,
                        right: 34,
                        child: GestureDetector(
                            onTap: (){
                              _toggleFavorite();
                            },
                            child: Icon(
                              _isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: _isFavorite ? Colors.red : Colors.grey,
                            ),),
                    ),
                    Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                            onTap: (){
                              _showBottomSheet(context);
                            },
                            child: Icon(Icons.more_vert)))
                  ],
                ),
                Container(
                    // width: MediaQuery.of(context).size.width * .5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Container(
                          // width: MediaQuery.of(context).size.width * .72,
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Lenovo IdeaPad Gaming 3i Core i7 11th Gen - (8 GB/512 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce RTX 3050/120 Hz) IPG3-15IHU6 Gaming Laptop  (15.6 inch, Shadow Black, 2.25 kg)',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            softWrap: true,
                          ),
                        ),

                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    'MRP:  ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w900),
                                    softWrap: true,
                                  ),
                                ),
                                Text(
                                  '50,00,000.93',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 1.5,
                                      fontSize: 15,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w900),
                                  softWrap: true,
                                ),
                                Spacer(),
                                Text(
                                  'Ratings:  ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w900),
                                  softWrap: true,
                                ),
                                Text(
                                  '(4.5)',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                  softWrap: true,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        Icons.star_half_sharp,
                                        color: Colors.amber[700],
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    'OFFER PRICE:  ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w900),
                                    softWrap: true,
                                  ),
                                ),
                                Text(
                                  '45,00,000.93',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w900),
                                  softWrap: true,
                                ),
                                Spacer(),
                                Text(
                                  'QTY:  ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w900),
                                  softWrap: true,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    _decrementQuantity();
                                  },
                                  child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(
                                          child: Icon(Icons.remove,size: 15,color: Colors.white,))),
                                ),
                                  Container(
                                    height: 30,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:Border.all(color: Colors.white,width: 1)
                                    ),
                                    child: TextField(
                                      readOnly: true,
                                      textAlign: TextAlign.center,
                                      controller: TextEditingController(text: '$_quantity'),
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Remove the underline
                                      ),
                                    ),
                                  ),
                                GestureDetector(
                                  onTap: (){
                                    _incrementQuantity();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Center(
                                            child: Icon(Icons.add,size: 15,color: Colors.white,))),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    'SIZE:  ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w900),
                                    softWrap: true,
                                  ),
                                ),
                                Icon(
                                  Icons.height_rounded,
                                  size: 25,
                                ),
                                Spacer(),
                                Text(
                                  'COLOR:  ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w900),
                                  softWrap: true,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 73),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              Colors.blue,
                                              Colors.red,
                                            ],
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      
                        GridView.count(
                          primary: false,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          crossAxisCount: 5,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          // padding: const EdgeInsets.all(2),
                          children: <Widget>[
                            // InkWell(
                            //   onTap: () {
                            //     // Navigator.of(context).pushNamed(Services.routeName);
                            //   },
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     padding: const EdgeInsets.all(8),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Container(
                            //           height: 40,
                            //           child: Image.asset(
                            //               'assets/images/asus_laptop.png'),
                            //         ),
                            //         SizedBox(
                            //           height: 1,
                            //         ),
                            //         Text(
                            //           'LENOVO IDEAPAD',
                            //           textAlign: TextAlign.center,
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w900,
                            //               fontSize: 12),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //
                            //   },
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     padding: const EdgeInsets.all(8),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Text(
                            //           '4.5',
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w900,
                            //               fontSize: 20),
                            //         ),
                            //         SizedBox(
                            //           height: 3,
                            //         ),
                            //         Row(
                            //           mainAxisAlignment: MainAxisAlignment.center,
                            //           children: [
                            //             Icon(
                            //               Icons.star,
                            //               color: Colors.amber[700],
                            //               size: 12,
                            //             ),
                            //             Icon(
                            //               Icons.star,
                            //               color: Colors.amber[700],
                            //               size: 12,
                            //             ),
                            //             Icon(
                            //               Icons.star,
                            //               color: Colors.amber[700],
                            //               size: 12,
                            //             ),
                            //             Icon(
                            //               Icons.star,
                            //               color: Colors.amber[700],
                            //               size: 12,
                            //             ),
                            //             Icon(
                            //               Icons.star,
                            //               color: Colors.amber[700],
                            //               size: 12,
                            //             ),
                            //           ],
                            //         ),
                            //
                            //
                            //         SizedBox(
                            //           height: 3,
                            //         ),
                            //         Text(
                            //           'STARS',
                            //           textAlign: TextAlign.center,
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w900,
                            //               fontSize: 12),
                            //         ),
                            //         SizedBox(
                            //           height: 3,
                            //         ),
                            //         Text(
                            //           '100K',
                            //           textAlign: TextAlign.center,
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w900,
                            //               fontSize: 12),
                            //         ),
                            //
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     // Navigator.of(context).pushNamed(Services.routeName);
                            //   },
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     padding: const EdgeInsets.all(8),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Icon(
                            //           Icons.add_shopping_cart_rounded,
                            //           size: 25,
                            //         ),
                            //         SizedBox(
                            //           height: 10,
                            //         ),
                            //         Text(
                            //           'ADD TO CART',
                            //           textAlign: TextAlign.center,
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w900,
                            //               fontSize: 12),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     // Navigator.of(context).pushNamed(Services.routeName);
                            //   },
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     padding: const EdgeInsets.all(8),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Icon(
                            //           Icons.shopping_basket_rounded,
                            //           size: 25,
                            //         ),
                            //         SizedBox(
                            //           height: 10,
                            //         ),
                            //         Text(
                            //           'BUY NOW',
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w900,
                            //               fontSize: 12),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     // Navigator.of(context).pushNamed(Services.routeName);
                            //   },
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     padding: const EdgeInsets.all(8),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Icon(
                            //           Icons.timer_rounded,
                            //           size: 25,
                            //         ),
                            //         SizedBox(
                            //           height: 10,
                            //         ),
                            //         Text(
                            //           'RESERVE TO PICK',
                            //           textAlign: TextAlign.center,
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w900,
                            //               fontSize: 12),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     // Navigator.of(context).pushNamed(Services.routeName);
                            //   },
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     padding: const EdgeInsets.all(8),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Icon(
                            //           Icons.height_rounded,
                            //           size: 25,
                            //         ),
                            //         SizedBox(
                            //           height: 10,
                            //         ),
                            //         Text(
                            //           'SIZE',
                            //           textAlign: TextAlign.center,
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w900,
                            //               fontSize: 12),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                           //  InkWell(
                           //    onTap: () {
                           //      // Navigator.of(context).pushNamed(Services.routeName);
                           //    },
                           //    child: Container(
                           //      alignment: Alignment.center,
                           //      padding: const EdgeInsets.all(8),
                           //      child: Column(
                           //        mainAxisAlignment: MainAxisAlignment.center,
                           //        crossAxisAlignment: CrossAxisAlignment.center,
                           //        children: [
                           //          Icon(
                           //            Icons.scale_rounded,
                           //            size: 25,
                           //          ),
                           //          SizedBox(
                           //            height: 10,
                           //          ),
                           //          Text(
                           //            'QUANTITY - 10 UNITS',
                           //            textAlign: TextAlign.center,
                           //            style: TextStyle(
                           //                fontWeight: FontWeight.w900,
                           //                fontSize: 12),
                           //          ),
                           //        ],
                           //      ),
                           //    ),
                           // ),
                           //  InkWell(
                           //    onTap: () {
                           //      // Navigator.of(context).pushNamed(Services.routeName);
                           //    },
                           //    child: Container(
                           //      alignment: Alignment.center,
                           //      padding: const EdgeInsets.all(8),
                           //      child: Column(
                           //        mainAxisAlignment: MainAxisAlignment.center,
                           //        crossAxisAlignment: CrossAxisAlignment.center,
                           //        children: [
                           //          Icon(
                           //            Icons.play_arrow_rounded,
                           //            size: 25,
                           //          ),
                           //          SizedBox(
                           //            height: 10,
                           //          ),
                           //          Text(
                           //            'VIEW',
                           //            textAlign: TextAlign.center,
                           //            style: TextStyle(
                           //                fontWeight: FontWeight.w900,
                           //                fontSize: 12),
                           //          ),
                           //        ],
                           //      ),
                           //    ),
                           //  ),
                            // InkWell(
                            //   onTap: () {
                            //     // Navigator.of(context).pushNamed(Services.routeName);
                            //   },
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     padding: const EdgeInsets.all(8),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Icon(
                            //           Icons.add_box_rounded,
                            //           size: 25,
                            //         ),
                            //         SizedBox(
                            //           height: 10,
                            //         ),
                            //         Text(
                            //           'ADD TO WISHLIST',
                            //           textAlign: TextAlign.center,
                            //
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w900,
                            //               fontSize: 12),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     // Navigator.of(context).pushNamed(Services.routeName);
                            //   },
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     padding: const EdgeInsets.all(8),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         ClipRRect(
                            //           borderRadius: BorderRadius.circular(100),
                            //           child: Container(
                            //             height: 40,
                            //             width: 40,
                            //             decoration: BoxDecoration(
                            //               gradient: LinearGradient(
                            //                 begin: Alignment.topRight,
                            //                 end: Alignment.bottomLeft,
                            //                 colors: [
                            //                   Colors.blue,
                            //                   Colors.red,
                            //                 ],
                            //               )
                            //             ),
                            //           ),
                            //         ),
                            //         SizedBox(
                            //           height: 10,
                            //         ),
                            //         Text(
                            //           'COLOR',
                            //           textAlign: TextAlign.center,
                            //
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w900,
                            //               fontSize: 12),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     // Navigator.of(context).pushNamed(Services.routeName);
                            //   },
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     padding: const EdgeInsets.all(8),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Icon(
                            //           Icons.compare_rounded,
                            //           size: 25,
                            //         ),
                            //         SizedBox(
                            //           height: 10,
                            //         ),
                            //         Text(
                            //           'ADD TO COMPARE',
                            //           textAlign: TextAlign.center,
                            //
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w900,
                            //               fontSize: 12),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: () {
                                // Navigator.of(context).pushNamed(Services.routeName);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.phone_rounded,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'CALL',
                                      textAlign: TextAlign.center,

                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: () {
                                // Navigator.of(context).pushNamed(Services.routeName);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.message_rounded,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'MESSAGE',
                                      textAlign: TextAlign.center,

                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     // Navigator.of(context).pushNamed(Services.routeName);
                            //   },
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     padding: const EdgeInsets.all(8),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Icon(
                            //           Icons.store_rounded,
                            //           size: 25,
                            //         ),
                            //         SizedBox(
                            //           height: 10,
                            //         ),
                            //         Text(
                            //           'VISIT STORE',
                            //           textAlign: TextAlign.center,
                            //
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w900,
                            //               fontSize: 12),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     // Navigator.of(context).pushNamed(Services.routeName);
                            //   },
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     padding: const EdgeInsets.all(8),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Icon(
                            //           Icons.share_rounded,
                            //           size: 25,
                            //         ),
                            //         SizedBox(
                            //           height: 10,
                            //         ),
                            //         Text(
                            //           'SHARE',
                            //           textAlign: TextAlign.center,
                            //
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w900,
                            //               fontSize: 12),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            //
                          ],
                        ),

                        //  Container(
                        //   alignment: Alignment.topLeft,
                        //   // width: MediaQuery.of(context).size.width * .72,
                        //   padding: const EdgeInsets.all(8),
                        //   child: Text(
                        //     'SELLER : ',
                        //     textAlign: TextAlign.start,
                        //     style: TextStyle(
                        //         fontSize: 15, fontWeight: FontWeight.bold),
                        //     softWrap: true,
                        //   ),
                        // ),

                        // Row(
                        //   children: [
                        //     CircleAvatar(
                        //       radius: 40,
                        //       backgroundColor: Colors.black26,
                        //       child: Container(
                        //         padding: const EdgeInsets.all(4.5),
                        //         height: 80,
                        //         child: ClipRRect(
                        //             borderRadius: BorderRadius.circular(100),
                        //             child: Image.asset(
                        //               'assets/images/1.jpg',
                        //               fit: BoxFit.fill,
                        //             )),
                        //       ),
                        //     ),
                        //     Container(
                        //       width: MediaQuery.of(context).size.width * .7,
                        //       padding: const EdgeInsets.all(8),
                        //       child: Text(
                        //         'Lenovo IdeaPad Gaming 3i Core i7 11th Gen - (8 GB/512 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce RTX 3050/120 Hz) IPG3-15IHU6 Gaming Laptop  (15.6 inch, Shadow Black, 2.25 kg)',
                        //         textAlign: TextAlign.justify,
                        //         style: TextStyle(
                        //             fontSize: 15, fontWeight: FontWeight.bold),
                        //         softWrap: true,
                        //       ),
                        //     ),
                        //   ],
                        // )


                       Container(
                        alignment: Alignment.topLeft,
                        // width: MediaQuery.of(context).size.width * .72,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'DESCRIPTION : ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          softWrap: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: ExpandableTextWidget(
                            text:
                            'Material Composition 100% Poly Cotton Style'
                                'Regular  Neck Style Collared Neck Pattern Printed Country of Origin India About this Item'
                                'Stylish Half sleeve Casual Printed Shirts & Party Wear Casual shirts'
                                '100% Premium Poly Cottton, Pre Washed for an extremely soft finish and Rich look'
                                'Disclaimer: Product colour may slightly vary due to photographic lighting sources or your monitor settings'
                                'Modern slim fit ( we have updated our size chart, please refer the size chart for new measurements before ordering)'
                                'Breathable : Truly comfortable and easy to wear in every season it is insulating in winter and breathable in summer.Description'
                                'LookMark Mens Regular Fit Printed Shirt Try on something different with LookMark collection of Printed shirts that will add a new spice to your wardrobe! The unique color combinations, seamlessly stitched ends and perfect collar gives you a charming look when worn for any occasions, even on a Printed day! (1).Comfortable Material Printed Shirts for men by LookMark are made using quality fabrics that are durable and comfortable for long term use and for any weather. They come in the latest designs along with unique color combinations. (2).Classy & Charming Look Upgrade your fashion quotient with these shirts for men as they give you a new look and appeal. Made to make you look good effortlessly, wear them on any day, in any mood, you will surely feel good as you look! Upgrade your fashion quotient with these shirts for men as they give you a new look and appeal. Made to make you look good effortlessly, wear them on any day, in any mood, you will surely feel good as you look! (3).Easy Care Make these shirts look as good as new by washing with a mild detergent. Do not bleach it or wash with other colours. You need not dry clean this as it can be easily washed by hand. Additional Information'
                            ,
                            maxLines: 1,
                            textStyle: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),

                        // ExpandablePanel(
                        //   header: Text('article.title'),
                        //   collapsed: Text('article.body', softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                        //   expanded: Text(
                        //     'Material Composition 100% Poly Cotton Style'
                        //       'Regular  Neck Style Collared Neck Pattern Printed Country of Origin India About this Item'
                        //       'Stylish Half sleeve Casual Printed Shirts & Party Wear Casual shirts'
                        //       '100% Premium Poly Cottton, Pre Washed for an extremely soft finish and Rich look'
                        //       'Disclaimer: Product colour may slightly vary due to photographic lighting sources or your monitor settings'
                        //       'Modern slim fit ( we have updated our size chart, please refer the size chart for new measurements before ordering)'
                        //       'Breathable : Truly comfortable and easy to wear in every season it is insulating in winter and breathable in summer.Description'
                        //       'LookMark Mens Regular Fit Printed Shirt Try on something different with LookMark collection of Printed shirts that will add a new spice to your wardrobe! The unique color combinations, seamlessly stitched ends and perfect collar gives you a charming look when worn for any occasions, even on a Printed day! (1).Comfortable Material Printed Shirts for men by LookMark are made using quality fabrics that are durable and comfortable for long term use and for any weather. They come in the latest designs along with unique color combinations. (2).Classy & Charming Look Upgrade your fashion quotient with these shirts for men as they give you a new look and appeal. Made to make you look good effortlessly, wear them on any day, in any mood, you will surely feel good as you look! Upgrade your fashion quotient with these shirts for men as they give you a new look and appeal. Made to make you look good effortlessly, wear them on any day, in any mood, you will surely feel good as you look! (3).Easy Care Make these shirts look as good as new by washing with a mild detergent. Do not bleach it or wash with other colours. You need not dry clean this as it can be easily washed by hand. Additional Information'
                        //       ,
                        //       textAlign: TextAlign.justify,
                        //       softWrap: true, ),
                        //   // tapHeaderToExpand: true,
                        //   // hasIcon: true,
                        // ),
                      
                      
                        Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 3
                                ),
                                child:  Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.black12,
                                      child: Container(
                                        padding: const EdgeInsets.all(4.5),
                                        height: 80,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.asset(
                                              'lib/assets/download.jpeg',
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width * .62,
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        'Lenovo IdeaPad Gaming 3i Core',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        softWrap: true,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '4.5',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                  Icons.star_half_sharp,
                                                  color: Colors.amber[700],
                                                  size: 12,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                        ],
                                        ),
                                      ),
                                    ),
                            
                                  ],
                                ),
                              ),

                              Text('avatar, username, rating, comment, images, videos, ')
                            ],
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 5,
                ),
              ],
          ))),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            backgroundColor: Colors.indigoAccent,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: GestureDetector(
                    onTap: (){},
                    child: Icon(Icons.add_shopping_cart_rounded)),
                label: 'ADD TO CART',
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                    onTap: (){},
                    child: Icon(Icons.shopping_basket_rounded)),
                label: 'BUY NOW',
              ),
            ],
            selectedItemColor: Colors.white, // Set the selected item color
            unselectedItemColor: Colors.white, // Set the unselected item color
            selectedLabelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w900), // Set the selected label color
            unselectedLabelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: MediaQuery.of(context).size.width / 2 - 0.5, // Half width of the screen
            child: Container(
              width: 1,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );


  }
  void _changePage(int increment) {
    setState(() {
      _currentPageIndex =
          (_currentPageIndex + increment) % _imageUrls.length;
    });
  }
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      height: 25,
                      width:25,
                      child: Image.asset(
                          'lib/assets/download.jpeg'),
                    ),
                    title: Text('LENOVO IDEAPAD',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),),
                    onTap: () {
                      // Do something when Add Video is tapped
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.timer_rounded),
                    title: Text('RESERVE TO PICK',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),),
                    onTap: () {
                      // Do something when Add Video is tapped
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.video_library),
                    title: Text('ADD TO WISHLIST',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),),
                    onTap: () {
                      // Do something when Add Video is tapped
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.compare_rounded),
                    title: Text('ADD TO COMPARE',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),),
                    onTap: () {
                      // Do something when Add Video is tapped
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.share_rounded),
                    title: Text('SHARE',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,),),
                    onTap: () {
                      // Do something when Add Music is tapped
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.play_arrow_rounded),
                    title: Text('VIEW',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,),),
                    onTap: () {
                      // Do something when Add Music is tapped
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.storefront_outlined),
                    title: Text('VISIT STORE',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,),),
                    onTap: () {
                      // Do something when Add Music is tapped
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('EDIT',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,),),
                    onTap: () {
                      // Do something when Add Music is tapped
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) =>
                          EditProduct()));
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
