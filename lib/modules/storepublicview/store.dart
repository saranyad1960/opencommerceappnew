// store owner
// import 'package:alphacommerceenterprise/modules/business/searchinstore.dart';
// import 'package:alphacommerceenterprise/modules/utils/editenquiry.dart';
// import 'package:alphacommerceenterprise/modules/explore/explore.dart';
// import 'package:alphacommerceenterprise/modules/stockmanagement/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_switch/flutter_switch.dart';
//import 'package:glass_kit/glass_kit.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:opencommerce/modules/storeowner/editstore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../stockmanagement/products.dart';


class Store extends StatefulWidget {
  static const routeName = '/storehome';

  @override
  _StoreState createState() => _StoreState();
}

/*
storefront - recommend for you from store

verified - orange tick, blue tick, verified stamp, 

top sold, top services,
best sellers, best services
categories - top/best/etc sold, rendered,
last purchases
cart  - 

offers
products
categories
services
map


storefront - 

*/

class _StoreState extends State<Store> {
  int _currentPageIndex = 0;
  List<String> _imageUrls = [
    'lib/assets/c10.jpeg',
    'lib/assets/c11.jpeg',
    'lib/assets/c12.jpeg',
  ];
  bool _openStatus = false;

  _callNumber() async {
    const number = '08592119XXXX'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  List<String> attachments = [];
  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'example@example.com',
  );

  final _subjectController = TextEditingController(text: 'The subject');

  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

  _mapLaunch(double lat, double long) async {
    final availableMaps = await MapLauncher.installedMaps;
    await availableMaps.first.showMarker(
      coords: Coords(lat, long),
      title: "Ocean Beach",
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height * 1,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  child: Center(
                    child: GestureDetector(
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
                ),
                // Positioned.fill(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       GestureDetector(
                //         onTap: (){
                //           setState(() {
                //             print("kj");
                //             _currentPageIndex --;
                //            // _changePage1();
                //           });
                //         },
                //         child: Icon(Icons.arrow_back_ios),
                //       ),
                //       // IconButton(
                //       //   icon: Icon(Icons.arrow_back),
                //       //   onPressed: () {
                //       //     _changePage(-1);
                //       //   },
                //       // ),
                //       GestureDetector(
                //         onTap: (){
                //           setState(() {
                //             print("kj");
                //             _currentPageIndex++;
                //             //_changePage2();
                //           });
                //         },
                //         child: Icon(Icons.arrow_forward_ios),
                //       ),
                //     ],
                //   ),
                // ),
                // Container(
                //   height: MediaQuery.of(context).size.height * .54,
                //   alignment: Alignment.bottomCenter,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //           image: ExactAssetImage('assets/images/1.jpg'),
                //           fit: BoxFit.fill)),
                // ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      // color: Colors.white,
                      width: 125,
                      // padding: const EdgeInsets.symmetric(
                      //     horizontal: 4, vertical: 2),
                      child: FlutterSwitch(
                        width: 125.0,
                        activeText: 'OPEN',
                        // activeTextColor: Colors.green,
                        inactiveText: 'CLOSED',
                        height: 45.0,
                        activeToggleColor: Colors.blue,
                        // inactiveToggleColor: Colors.grey,
                        activeColor: Colors.white,
                        activeTextColor: Colors.blue,
                        inactiveTextColor: Colors.white,

                        // toggleColor: Colors.white,
                        // activeColor: Colors.white,
                        // inactiveColor: Colors.red,
                        valueFontSize: 16.0,
                        toggleSize: 40.0,
                        // inactiveTextColor: Colors.red,
                        value: _openStatus,
                        borderRadius: 0,
                        padding: 8.0,
                        showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            _openStatus = val;
                          });
                        },
                      ),
                    ))
              ],
            ),
            Container(
                // height: MediaQuery.of(context).size.height * .4,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              // radius: 35,
                              backgroundColor: Colors.black26,
                              child: Container(
                              //  padding: const EdgeInsets.all(4.5),
                                height: 90,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      'lib/assets/c7.jpeg',
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .8,
                              child: Text(
                                'AlphaCommerce Technologies Private Limited'
                                    .toUpperCase(),
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                    // fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                softWrap: true,
                              ),
                            ),
                          ],
                        )),
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
                            // Navigator.of(context).pushNamed(Offers.routeName);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.local_offer_rounded, size: 20),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'OFFERS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(Products.routeName);
                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.list_alt_rounded, size: 20),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Products',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (() {
                            //Navigator.of(context).pushNamed(Services.routeName);
                          }),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.construction_rounded, size: 20),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Services',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (() {
                            // Navigator.of(context)
                            //     .pushNamed(CategoriesManagement.routeName);
                          }),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.category_rounded, size: 20),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Categories',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _mapLaunch(18.578290, 78.370637);
                            // Navigator.of(context).pushNamed(
                            //     StorePublicView.routeName);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.directions_rounded, size: 20),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Direction',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (() {
                            // Navigator.of(context)
                            //     .pushNamed(StoreTimings.routeName);
                          }),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.punch_clock, size: 20),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Timings',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (() {
                            // Navigator.of(context)
                            //     .pushNamed(BusinessServiceArea.routeName);
                          }),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.map_rounded, size: 20),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'SERVICE AREA',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.phone_rounded, size: 20),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Call',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            )),
                        InkWell(
                          onTap: () {
                            // Navigator.of(context).pushNamed(ChatRoom.routeName);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.message_rounded, size: 20),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Message',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.of(context)
                            //     .pushNamed(EditEnquiry.routeName);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.question_mark_rounded, size: 20),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Enquiry',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.of(context)
                            //     .pushNamed(SearchInStore.routeName);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.search_rounded, size: 20),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Search',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            // Navigator.of(context).pushNamed(
                            //     BusinessFinance.routeName);
                            final Uri _storeurl = Uri.parse(
                                'https://github.com/tortuvshin/open-source-flutter-apps#business');
                            // _launchInBrowser(_storeurl);
                            // await _storeurl;
                            _launchInWebViewOrVC(_storeurl);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.public_rounded, size: 20),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Website',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Naviga`tor.of(context).pushNamed(
                            //     BusinessFinance.routeName);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8,bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.picture_as_pdf, size: 20),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Catalogue',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            send();
                            // Navigator.of(context).pushNamed(
                            //     BusinessFinance.routeName);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.alternate_email_rounded, size: 20),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Email',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: ()  {
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) =>
                                EditStore()));
                            //send();
                            // Navigator.of(context).pushNamed(
                            //     BusinessFinance.routeName);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.edit, size: 20),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Edit',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // InkWell(
                        //   onTap: () async {
                        //     // await FlutterEmailSender.send(email);
                        //     // Navigator.of(context).pushNamed(
                        //     //     BusinessFinance.routeName);
                        //   },
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Column(
                        //       mainAxisAlignment:
                        //           MainAxisAlignment.center,
                        //       crossAxisAlignment:
                        //           CrossAxisAlignment.center,
                        //       children: [
                        //         Icon(Icons.groups,
                        //             size: 20),
                        //         SizedBox(
                        //           height: 5,
                        //         ),
                        //         Text(
                        //           'Followers',
                        //           textAlign: TextAlign.center,
                        //           style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    ));
  }
  void _changePage(int increment) {
    setState(() {
      _currentPageIndex =
          (_currentPageIndex + increment) % _imageUrls.length;
    });
  }

  void _changePage1() {
    setState(() {
      _currentPageIndex = _currentPageIndex - 1;
    });
  }
  void _changePage2() {
    setState(() {
      _currentPageIndex = _currentPageIndex + 1;
    });
  }
}
