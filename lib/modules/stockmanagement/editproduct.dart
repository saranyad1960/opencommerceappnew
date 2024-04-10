import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:im_stepper/stepper.dart';

class EditProduct extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _EditProduct createState() => _EditProduct();
}
/*
basic details - title, description, or select product
images, videos
tags
stock - skuid, cost, selling price,  mrp, 


reorder level, stock alert, etc

*/

class _EditProduct extends State<EditProduct> {
  int activeStep = 0;
  int upperBound = 4;
  final _form = GlobalKey<FormState>();
  final _searchForm = GlobalKey<FormState>();
  final _tagsForm = GlobalKey<FormState>();
  final _skuForm = GlobalKey<FormState>();
  final _stockControlForm = GlobalKey<FormState>();
  Widget _activeWidget = Container();
  bool _productExists = false;
  int _qtycount = 0;
  TextEditingController _productNameController1 = TextEditingController(text: 'Lenovo Ideapad');
  TextEditingController _productDescriptionController2 = TextEditingController(text: 'Lenovo IdeaPad Gaming 3i Core i7 11th Gen - (8 GB/512 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce RTX 3050/120 Hz) IPG3-15IHU6 Gaming Laptop  (15.6 inch, Shadow Black, 2.25 kg)',);
  TextEditingController _mrpController = TextEditingController(text: '50,000.93');
  TextEditingController _offerpriceController = TextEditingController(text: '45,000.93');
  TextEditingController _qtyController = TextEditingController(text: '10');
  String selectedHSNCode = ''; // Holds the selected HSN code
  HSNCode? selectedHSNDetails; // Holds the details of the selected HSN code
  final _formKey = GlobalKey<FormState>();
  Set<String> selectedCategories = Set();
  bool _showErrorMessage = false;
  bool _showErrorMessage1 = false;
  bool _showErrorMessage2 = false;
  bool _showErrorMessage3 = false;
  bool _showErrorMessage4 = false;
  bool _showErrorMessage5 = false;

  void updateCategory(String category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }
    });
  }
  void updateErrorMessageVisibility() {
    setState(() {
      double offerPrice = parseCurrencyString(_offerpriceController.text);
      double mrp = parseCurrencyString(_mrpController.text);
      _showErrorMessage4 = offerPrice >= mrp;
    });
  }

  double parseCurrencyString(String value) {
    String cleanedValue = value.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.parse(cleanedValue);
  }

  @override
  void initState() {
    super.initState();
    updateSelectedHSNCode(hsnCodes.first);
    _productNameController1.addListener(() {
      setState(() {
        _showErrorMessage = _productNameController1.text.isEmpty;
      });
    });
    _productDescriptionController2.addListener(() {
      setState(() {
        _showErrorMessage1 = _productDescriptionController2.text.isEmpty;
      });
    });
    _mrpController.addListener(() {
      setState(() {
        _showErrorMessage2 = _mrpController.text.isEmpty;
      });
    });
    _offerpriceController.addListener(() {
      setState(() {
        _showErrorMessage3 = _offerpriceController.text.isEmpty;
      });
    });
    _offerpriceController.addListener(updateErrorMessageVisibility);
    _mrpController.addListener(updateErrorMessageVisibility);
    _qtyController.addListener(() {
      setState(() {
        _showErrorMessage5 = _qtyController.text.isEmpty;
      });
    });
  }


  void updateSelectedHSNCode(HSNCode hsnCode) {
    setState(() {
      selectedHSNCode = hsnCode.code;
      selectedHSNDetails = hsnCode;
    });
  }





  Widget _productInfo() {
    // return Column(
    //   children: [
    //     Container(
    //       child: Form(
    //         key: _searchForm,
    //         child: Container(
    //           padding: const EdgeInsets.symmetric(horizontal: 15),
    //           alignment: Alignment.center,
    //           child: Column(
    //             children: [
    //               ClipRRect(
    //                 borderRadius: BorderRadius.circular(10),
    //                 child: Container(
    //                   width: double.infinity,
    //                   color: Colors.black12,
    //                   padding: EdgeInsets.all(4),
    //                   child: TextFormField(
    //                     decoration: InputDecoration(
    //                       hintStyle: TextStyle(fontSize: 17),
    //                       hintText: 'Search Products',
    //                       suffixIcon: Icon(
    //                         Icons.search_rounded,
    //                         color: Colors.black,
    //                       ),
    //                       border: InputBorder.none,
    //                       contentPadding: EdgeInsets.symmetric(
    //                           vertical: 15, horizontal: 20),
    //                     ),
    //                     keyboardType: TextInputType.emailAddress,
    //                     validator: (value) {
    //                       if (value!.isEmpty || !value.contains('@')) {
    //                         return 'Invalid email!';
    //                       }
    //                     },
    //                     onSaved: (value) {
    //                       // _userAuthData = UserAuthData(
    //                       //   email: value,
    //                       //   password: _userAuthData.password
    //                       // );
    //                     },
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               ElevatedButton(
    //                   onPressed: () {},
    //                   style: ElevatedButton.styleFrom(
    //                       padding: const EdgeInsets.symmetric(horizontal: 10)),
    //                   child: Text(
    //                       _productExists ? 'CONFIRM PRODUCT' : 'ADD PRODUCT'))
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //     SizedBox(
    //       height: 10,
    //     ),
    //     Container(
    //       padding: const EdgeInsets.all(8),
    //       child: Text(
    //         'IF PRODUCT NOT YOU CAN CREATE THE PRODUCT BY CLICKING CREATE BUTTION',
    //         softWrap: true,
    //         textAlign: TextAlign.center,
    //         style: TextStyle(fontWeight: FontWeight.bold),
    //       ),
    //     ),
    //     Container(
    //       child: Form(
    //         key: _form,
    //         child: Container(
    //           padding: const EdgeInsets.symmetric(horizontal: 15),
    //           alignment: Alignment.center,
    //           child: Column(
    //             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             // crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               SizedBox(
    //                 height: 25,
    //               ),
    //               Icon(
    //                 Icons.account_circle_rounded,
    //                 color: Colors.black,
    //                 size: 80,
    //               ),
    //               SizedBox(
    //                 height: 25,
    //               ),
    //               ClipRRect(
    //                 borderRadius: BorderRadius.circular(10),
    //                 child: Container(
    //                   width: double.infinity,
    //                   color: Colors.black12,
    //                   padding: EdgeInsets.all(4),
    //                   child: TextFormField(
    //                     decoration: InputDecoration(
    //                       hintStyle: TextStyle(fontSize: 17),
    //                       hintText: 'email',
    //                       suffixIcon: Icon(
    //                         Icons.alternate_email_rounded,
    //                         color: Colors.black,
    //                       ),
    //                       border: InputBorder.none,
    //                       contentPadding: EdgeInsets.symmetric(
    //                           vertical: 15, horizontal: 20),
    //                     ),
    //                     keyboardType: TextInputType.emailAddress,
    //                     validator: (value) {
    //                       if (value!.isEmpty || !value.contains('@')) {
    //                         return 'Invalid email!';
    //                       }
    //                     },
    //                     onSaved: (value) {
    //                       // _userAuthData = UserAuthData(
    //                       //   email: value,
    //                       //   password: _userAuthData.password
    //                       // );
    //                     },
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               ClipRRect(
    //                 borderRadius: BorderRadius.circular(10),
    //                 child: Container(
    //                   color: Colors.black12,
    //                   width: double.infinity,
    //                   padding: EdgeInsets.all(4),
    //                   child: TextFormField(
    //                     // obscureText: !_passwordVisible,
    //                     decoration: InputDecoration(
    //                       hintStyle: TextStyle(fontSize: 17),
    //                       hintText: 'password',
    //                       suffixIcon: IconButton(
    //                         onPressed: () {
    //                           setState(() {
    //                             // _passwordVisible = !_passwordVisible;
    //                           });
    //                         },
    //                         icon: Icon(
    //                           Icons.visibility_off,
    //                           color: Colors.black,
    //                         ),
    //                       ),
    //                       border: InputBorder.none,
    //                       contentPadding: EdgeInsets.symmetric(
    //                           vertical: 15, horizontal: 20),
    //                     ),
    //                     onSaved: (value) {
    //                       // _userAuthData = UserAuthData(
    //                       //     email: _userAuthData.email,
    //                       //     password: value,
    //                       // );
    //                     },
    //                   ),
    //                 ),
    //               ),
    //
    //               SizedBox(
    //                 height: 25,
    //               ),
    //               ClipRRect(
    //                 borderRadius: BorderRadius.circular(10),
    //                 child: Container(
    //                   width: double.infinity,
    //                   color: Colors.black12,
    //                   padding: EdgeInsets.all(4),
    //                   child: TextFormField(
    //                     decoration: InputDecoration(
    //                       hintStyle: TextStyle(fontSize: 17),
    //                       hintText: 'email',
    //                       suffixIcon: Icon(
    //                         Icons.alternate_email_rounded,
    //                         color: Colors.black,
    //                       ),
    //                       border: InputBorder.none,
    //                       contentPadding: EdgeInsets.symmetric(
    //                           vertical: 15, horizontal: 20),
    //                     ),
    //                     keyboardType: TextInputType.emailAddress,
    //                     validator: (value) {
    //                       if (value!.isEmpty || !value.contains('@')) {
    //                         return 'Invalid email!';
    //                       }
    //                     },
    //                     onSaved: (value) {
    //                       // _userAuthData = UserAuthData(
    //                       //   email: value,
    //                       //   password: _userAuthData.password
    //                       // );
    //                     },
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               ClipRRect(
    //                 borderRadius: BorderRadius.circular(10),
    //                 child: Container(
    //                   color: Colors.black12,
    //                   width: double.infinity,
    //                   padding: EdgeInsets.all(4),
    //                   child: TextFormField(
    //                     // obscureText: !_passwordVisible,
    //                     decoration: InputDecoration(
    //                       hintStyle: TextStyle(fontSize: 17),
    //                       hintText: 'password',
    //                       suffixIcon: IconButton(
    //                         onPressed: () {
    //                           setState(() {
    //                             // _passwordVisible = !_passwordVisible;
    //                           });
    //                         },
    //                         icon: Icon(
    //                           Icons.visibility_off,
    //                           color: Colors.black,
    //                         ),
    //                       ),
    //                       border: InputBorder.none,
    //                       contentPadding: EdgeInsets.symmetric(
    //                           vertical: 15, horizontal: 20),
    //                     ),
    //                     onSaved: (value) {
    //                       // _userAuthData = UserAuthData(
    //                       //     email: _userAuthData.email,
    //                       //     password: value,
    //                       // );
    //                     },
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 25,
    //               ),
    //               ClipRRect(
    //                 borderRadius: BorderRadius.circular(10),
    //                 child: Container(
    //                   width: double.infinity,
    //                   color: Colors.black12,
    //                   padding: EdgeInsets.all(4),
    //                   child: TextFormField(
    //                     decoration: InputDecoration(
    //                       hintStyle: TextStyle(fontSize: 17),
    //                       hintText: 'email',
    //                       suffixIcon: Icon(
    //                         Icons.alternate_email_rounded,
    //                         color: Colors.black,
    //                       ),
    //                       border: InputBorder.none,
    //                       contentPadding: EdgeInsets.symmetric(
    //                           vertical: 15, horizontal: 20),
    //                     ),
    //                     keyboardType: TextInputType.emailAddress,
    //                     validator: (value) {
    //                       if (value!.isEmpty || !value.contains('@')) {
    //                         return 'Invalid email!';
    //                       }
    //                     },
    //                     onSaved: (value) {
    //                       // _userAuthData = UserAuthData(
    //                       //   email: value,
    //                       //   password: _userAuthData.password
    //                       // );
    //                     },
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               // ClipRRect(
    //               //         borderRadius: BorderRadius.circular(10),
    //               //         child: Container(
    //               //           color: Colors.black12,
    //               //           width: double.infinity,
    //               //           padding: EdgeInsets.all(4),
    //               //           child: TextFormField(
    //               //             // obscureText: !_passwordVisible,
    //               //             decoration: InputDecoration(
    //               //               hintStyle: TextStyle(fontSize: 17),
    //               //               hintText: 'password',
    //               //               suffixIcon: IconButton(
    //               //                 onPressed: () {
    //               //                   setState(() {
    //               //                     // _passwordVisible = !_passwordVisible;
    //               //                   });
    //               //                 },
    //               //                 icon: Icon(
    //               //                   Icons.visibility_off,
    //               //                   color: Colors.black,
    //               //                 ),
    //               //               ),
    //               //               border: InputBorder.none,
    //               //               contentPadding: EdgeInsets.symmetric(
    //               //                   vertical: 15, horizontal: 20),
    //               //             ),
    //               //             onSaved: (value) {
    //               //               // _userAuthData = UserAuthData(
    //               //               //     email: _userAuthData.email,
    //               //               //     password: value,
    //               //               // );
    //               //             },
    //               //           ),
    //               //         ),
    //               //       ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     )
    //   ],
    // );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Product Name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _productNameController1,
                      decoration: InputDecoration(
                        hintText: 'Enter product name',
                        border: InputBorder.none,
                      ),
                    ),
                    //SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
        _showErrorMessage
            ? Padding(
              padding: const EdgeInsets.only(left: 10,top: 4),
              child: Text(
                        'Please enter a product name',
                        style: TextStyle(
              color: Colors.red,
              fontSize: 12,
                        ),
                      ),
            )
            : SizedBox(),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Product Description',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: TextFormField(
                controller: _productDescriptionController2,
                decoration: InputDecoration(
                  hintText: 'Enter product description',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        _showErrorMessage1
            ? Padding(
          padding: const EdgeInsets.only(left: 10,top: 4),
          child: Text(
            'Please enter a product description',
            style: TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        )
            : SizedBox(),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: ElevatedButton(
            onPressed: () {
              // Show bottom sheet when button is pressed
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return HSNCodeBottomSheet(
                    onHSNCodeSelected: (code) {
                      // Find selected HSN code details
                      HSNCode selectedCode =
                      hsnCodes.firstWhere((hsn) => hsn.code == code);
                      updateSelectedHSNCode(selectedCode);
                      Navigator.pop(context); // Close bottom sheet
                    },
                  );
                },
              );
            },
            child: Text('Select HSN Code'),
          ),
        ),
        if (selectedHSNDetails != null) ...[
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Selected HSN Code Details:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  decoration: BoxDecoration(
                    border:Border.all(width: 1,color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text("${selectedHSNDetails!.code}")),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${selectedHSNDetails!.description}',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.grey),),
                      Row(
                        children: [
                          Text('CGST Rate: ${selectedHSNDetails!.cgstRate}%',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.grey),),
                          SizedBox(width: 10,),
                          Text('SGST Rate: ${selectedHSNDetails!.sgstRate}%',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.grey),),
                        ],
                      ),
                      Row(
                        children: [
                          Text('IGST Rate: ${selectedHSNDetails!.igstRate}%',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.grey),),
                          SizedBox(width: 10,),
                          Text('UGST Rate: ${selectedHSNDetails!.ugstRate}%',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.grey),),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
        SizedBox(height: 20,),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'M.R.P : ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1,color: Colors.grey)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextFormField(
                    controller: _mrpController,
                    decoration: InputDecoration(
                      hintText: '0.0',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        _showErrorMessage2
            ? Padding(
          padding: const EdgeInsets.only(left: 115,top: 4),
          child: Text(
            'Please enter amount',
            style: TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        )
            : SizedBox(),
        SizedBox(height: 10,),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Offer Price : ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1,color: Colors.grey)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: TextFormField(
                  controller: _offerpriceController,
                  decoration: InputDecoration(
                    hintText: '0.0',
                    border: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ),
        _showErrorMessage3
            ? Padding(
          padding: const EdgeInsets.only(left: 115,top: 4),
          child: Text(
            'Please enter amount',
            style: TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        )
            :
        _showErrorMessage4
            ? Padding(
          padding: const EdgeInsets.only(left: 115,top: 4),
          child: Text(
            'Offer price should be less than M.R.P',
            style: TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        ) : SizedBox(),
        SizedBox(height: 10,),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Quantity : ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1,color: Colors.grey)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextFormField(
                    controller: _qtyController,
                    decoration: InputDecoration(
                      hintText: '0',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        _showErrorMessage5
            ? Padding(
          padding: const EdgeInsets.only(left: 115,top: 4),
          child: Text(
            'Please enter quantity',
            style: TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        ) : SizedBox(),
        SizedBox(height: 20,),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
            },
            child: Text('Save'),
          ),
        ),
      ],
    );
  }

  Widget _multimediaData() {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'IMAGES',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        GridView.count(
            primary: false,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: 3,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(2),
            children: <Widget>[
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Products.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'lib/assets/download.jpeg',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Products.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'lib/assets/download (1).jpeg',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Products.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'lib/assets/download (2).jpeg',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Products.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'lib/assets/download (3).webp',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Products.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'lib/assets/download (4).webp',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Products.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'lib/assets/download (5).jpeg',
                      fit: BoxFit.fill,
                    )),
              ),
            ]),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'VIDEOS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        GridView.count(
            primary: false,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: 3,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(2),
            children: <Widget>[
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Products.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'lib/assets/giphy.gif',
                      fit: BoxFit.fill,
                    )
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Products.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'lib/assets/e4d395849317f98f2a418c0e10182b0d.gif',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Products.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'lib/assets/2108b1128233439.615236a4da3da.gif',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Products.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'lib/assets/giphy.gif',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Products.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'lib/assets/e4d395849317f98f2a418c0e10182b0d.gif',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Products.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'lib/assets/2108b1128233439.615236a4da3da.gif',
                      fit: BoxFit.fill,
                    )),
              ),
            ]),
      ],
    );
  }

  Widget _tags() {
    return Column(children: [
      Container(
        child: Form(
          key: _searchForm,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.center,
            child: Column(
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(10),
                //   child: Container(
                //     width: double.infinity,
                //     color: Colors.black12,
                //     padding: EdgeInsets.all(4),
                //     child: TextFormField(
                //       decoration: InputDecoration(
                //         hintStyle: TextStyle(fontSize: 17),
                //         hintText: 'Search Products',
                //         suffixIcon: Icon(
                //           Icons.search_rounded,
                //           color: Colors.black,
                //         ),
                //         border: InputBorder.none,
                //         contentPadding:
                //             EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                //       ),
                //       keyboardType: TextInputType.emailAddress,
                //       validator: (value) {
                //         if (value!.isEmpty || !value.contains('@')) {
                //           return 'Invalid email!';
                //         }
                //       },
                //       onSaved: (value) {
                //         // _userAuthData = UserAuthData(
                //         //   email: value,
                //         //   password: _userAuthData.password
                //         // );
                //       },
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      _showBottomSheet(context);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10)),
                    child: Text(
                        _productExists ? 'CONFIRM PRODUCT' : 'ADD TAGS')),
                Center(
                  child: selectedCategories.isEmpty
                      ? Text('No categories selected')
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Selected Categories:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: selectedCategories
                      //       .map((category) => Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Container(
                      //           height: 40,
                      //           width: 120,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(20),
                      //             color: Colors.red,
                      //           ),
                      //           child: Row(
                      //             children: [
                      //               Text(
                      //                 category,
                      //                 style: TextStyle(fontSize: 18,color: Colors.white),
                      //               ),
                      //               SizedBox(width: 8),
                      //               GestureDetector(
                      //                 onTap: () {
                      //                   updateCategory(category); // Remove category
                      //                 },
                      //                 child: Icon(
                      //                   Icons.clear, // X symbol
                      //                   size: 20,
                      //                   color: Colors.white,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       )
                      //   )
                      //       .toList(),
                      // ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        alignment: WrapAlignment.start,
                        spacing: 8.0, // Horizontal spacing between items
                        runSpacing: 8.0, // Vertical spacing between lines
                        children: selectedCategories.map((category) {
                          double containerWidth = calculateContainerWidth(category);
                          return Container(
                            height: 40,
                            width: containerWidth,
                            constraints: BoxConstraints(maxWidth: containerWidth), // Maximum width for each category
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Text(
                                      category,
                                      style: TextStyle(fontSize: 18, color: Colors.white,),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: GestureDetector(
                                    onTap: () {
                                      updateCategory(category); // Remove category
                                    },
                                    child: Icon(
                                      Icons.clear, // X symbol
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
    ]);
  }
  double calculateContainerWidth(String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: double.infinity);

    // Add padding to the calculated width
    double widthWithPadding = textPainter.width + 24.0; // Horizontal padding of 12.0 on each side
    return widthWithPadding;
  }

  Widget _sku() {
    return Column(
      children: [
        Container(
          child: Form(
            key: _skuForm,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      color: Colors.black12,
                      padding: EdgeInsets.all(4),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Search Products',
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Invalid email!';
                          }
                        },
                        onSaved: (value) {
                          // _userAuthData = UserAuthData(
                          //   email: value,
                          //   password: _userAuthData.password
                          // );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      color: Colors.black12,
                      padding: EdgeInsets.all(4),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Search Products',
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Invalid email!';
                          }
                        },
                        onSaved: (value) {
                          // _userAuthData = UserAuthData(
                          //   email: value,
                          //   password: _userAuthData.password
                          // );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      color: Colors.black12,
                      padding: EdgeInsets.all(4),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Search Products',
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Invalid email!';
                          }
                        },
                        onSaved: (value) {
                          // _userAuthData = UserAuthData(
                          //   email: value,
                          //   password: _userAuthData.password
                          // );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      color: Colors.black12,
                      padding: EdgeInsets.all(4),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Search Products',
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Invalid email!';
                          }
                        },
                        onSaved: (value) {
                          // _userAuthData = UserAuthData(
                          //   email: value,
                          //   password: _userAuthData.password
                          // );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_qtycount <= 0) {
                                  _qtycount = 0;
                                } else {
                                  _qtycount -= 1;
                                }
                              });
                            },
                            child: Card(
                                // elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                          Container(
                              // color: Colors.black12,
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text(
                              '${_qtycount} Units',
                              style: TextStyle(
                                  // color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_qtycount >= 100) {
                                  _qtycount = 100;
                                } else {
                                  _qtycount += 1;
                                }
                              });
                            },
                            child: Card(
                                // elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_qtycount >= 100) {
                              _qtycount = 100;
                            } else {
                              _qtycount += 1;
                            }
                          });
                        },
                        child: Card(
                            // elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: Icon(Icons.add_shopping_cart_rounded))),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_qtycount >= 100) {
                              _qtycount = 100;
                            } else {
                              _qtycount += 1;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Icon(Icons.favorite_rounded, size: 30),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }


  Widget _stockControl() {
    return Column(
      children: [
        Container(
          child: Form(
            key: _skuForm,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      color: Colors.black12,
                      padding: EdgeInsets.all(4),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Search Products',
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Invalid email!';
                          }
                        },
                        onSaved: (value) {
                          // _userAuthData = UserAuthData(
                          //   email: value,
                          //   password: _userAuthData.password
                          // );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      color: Colors.black12,
                      padding: EdgeInsets.all(4),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Search Products',
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Invalid email!';
                          }
                        },
                        onSaved: (value) {
                          // _userAuthData = UserAuthData(
                          //   email: value,
                          //   password: _userAuthData.password
                          // );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      color: Colors.black12,
                      padding: EdgeInsets.all(4),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Search Products',
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Invalid email!';
                          }
                        },
                        onSaved: (value) {
                          // _userAuthData = UserAuthData(
                          //   email: value,
                          //   password: _userAuthData.password
                          // );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      color: Colors.black12,
                      padding: EdgeInsets.all(4),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Search Products',
                          suffixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Invalid email!';
                          }
                        },
                        onSaved: (value) {
                          // _userAuthData = UserAuthData(
                          //   email: value,
                          //   password: _userAuthData.password
                          // );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_qtycount <= 0) {
                                  _qtycount = 0;
                                } else {
                                  _qtycount -= 1;
                                }
                              });
                            },
                            child: Card(
                                // elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                          Container(
                              // color: Colors.black12,
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text(
                              '${_qtycount} Units',
                              style: TextStyle(
                                  // color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_qtycount >= 100) {
                                  _qtycount = 100;
                                } else {
                                  _qtycount += 1;
                                }
                              });
                            },
                            child: Card(
                                // elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_qtycount >= 100) {
                              _qtycount = 100;
                            } else {
                              _qtycount += 1;
                            }
                          });
                        },
                        child: Card(
                            // elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: Icon(Icons.add_shopping_cart_rounded))),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_qtycount >= 100) {
                              _qtycount = 100;
                            } else {
                              _qtycount += 1;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Icon(Icons.favorite_rounded, size: 30),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'STOCK ALERT',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'REORDER LEVEL',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'DANGER LEVEL',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'STOCK TIMER',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EDIT PRODUCT',
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).pushNamed(BusinessDashboard.routeName);
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
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height * 1,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconStepper(
                  activeStepColor: Colors.white,
                  stepColor: Colors.black12,
                  lineColor: Colors.blue,
                  icons: [
                    Icon(Icons.info_rounded),
                    Icon(
                      Icons.perm_media_rounded,
                    ),
                    Icon(Icons.access_alarm),
                    Icon(Icons.supervised_user_circle),
                    Icon(Icons.flag),
                    // Icon(Icons.access_alarm),
                    // Icon(Icons.supervised_user_circle),
                  ],

                  // activeStep property set to activeStep variable defined above.
                  activeStep: activeStep,

                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                ),

                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      '${headerText()}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),

                Container(
                  child: _activeWidget,
                ),

                SizedBox(
                  height: 50,
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     activeStep == 0 ? Container() : previousButton(),
                //   ],
                // ),
              ],
            ),
          ),
        ),
        // Positioned(
        //   top: 50,
        //   left: 0,
        //   child: IconStepper(
        //     activeStepColor: Colors.white,
        //     stepColor: Colors.black12,
        //     lineColor: Colors.blue,
        //     icons: [
        //       Icon(Icons.info_rounded),
        //       Icon(
        //         Icons.perm_media_rounded,
        //       ),
        //       Icon(Icons.access_alarm),
        //       Icon(Icons.supervised_user_circle),
        //       Icon(Icons.flag),
        //       // Icon(Icons.access_alarm),
        //       // Icon(Icons.supervised_user_circle),
        //     ],

        //     // activeStep property set to activeStep variable defined above.
        //     activeStep: activeStep,

        //     // This ensures step-tapping updates the activeStep.
        //     onStepReached: (index) {
        //       setState(() {
        //         activeStep = index;
        //       });
        //     },
        //   ),
        // ),
        Positioned(
          bottom: 10,
          left: 2,
          child: activeStep == 0 ? Container() : previousButton(),
        ),
        Positioned(
          bottom: 10,
          right: 2,
          child: nextButton(),
        ),

        // Positioned(
        //   right: 10,
        //   top: 10,
        //   child: Container(
        //     color: Colors.amber,
        //     // margin: const EdgeInsets.all(8),
        //     padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        //     child: Text(
        //       'Sponsored',
        //       style: TextStyle(
        //           color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
        //     ),
        //   ),
        // )
      ]),
    );
  }

  /// Returns the next button.
  Widget nextButton() {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          if (activeStep < upperBound) {
            setState(() {
              activeStep++;
            });
          }
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            padding: const EdgeInsets.all(0)),
        child: activeStep == upperBound
            ? Text('Save')
            : Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          padding: const EdgeInsets.all(0)),
      child: Icon(Icons.arrow_back_ios_rounded),
    );
  }

  // /// Returns the header wrapping the header text.
  // Widget header() {
  //   return Container(
  //     decoration: BoxDecoration(
  //         // color: Colors.orange,
  //         // borderRadius: BorderRadius.circular(5),
  //         ),
  //     alignment: Alignment.center,
  //     margin: const EdgeInsets.all(8),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Container(
  //           alignment: Alignment.center,
  //           padding: const EdgeInsets.all(8.0),
  //           child: Text(
  //             headerText(),
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 color: Colors.black,
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
      case 0:
        _activeWidget = _productInfo();
        return 'PRODUCT INFORMATION';

      case 1:
        _activeWidget = _multimediaData();
        return 'MULTIMEDIA DATA';

      case 2:
        _activeWidget = _tags();
        return 'TAGS';

      case 3:
        _activeWidget = _sku();
        return 'SKU MANAGEMENT';

      case 4:
        _activeWidget = _stockControl();
        return 'STOCK CONTROL';

      default:
        _activeWidget = _productInfo();
        return 'PRODUCT INFORMATION';
    }
  }
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildCategoryTile('Food and beverages'),
              buildCategoryTile('Shirts'),
              buildCategoryTile('Casuals'),
              buildCategoryTile('Formals'),
              buildCategoryTile('Toys'),
              buildCategoryTile('Cool drinks'),
              buildCategoryTile('Vegetables'),
              buildCategoryTile('Fruits'),
              // Add more category tiles as needed
            ],
          ),
        );
      },
    );
  }

  Widget buildCategoryTile(String category) {
    final isSelected = selectedCategories.contains(category);
    return ListTile(
      title: Text(category),
      leading: isSelected ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
      onTap: () {
          updateCategory(category);
          Navigator.pop(context); // Close the bottom sheet
      },
    );
  }
}

class HSNCode {
  final String code;
  final String description;
  final double cgstRate;
  final double sgstRate;
  final double igstRate;
  final double ugstRate;

  HSNCode({
    required this.code,
    required this.description,
    required this.cgstRate,
    required this.sgstRate,
    required this.igstRate,
    required this.ugstRate,
  });
}
class HSNCodeBottomSheet extends StatelessWidget {
  final Function(String) onHSNCodeSelected; // Callback to notify selection

  const HSNCodeBottomSheet({Key? key, required this.onHSNCodeSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hsnCodes.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
              '${hsnCodes[index].code} - ${hsnCodes[index].description}'),
          subtitle: Text(
              'CGST: ${hsnCodes[index].cgstRate}%, SGST: ${hsnCodes[index].sgstRate}%, IGST: ${hsnCodes[index].igstRate}%,UGST: ${hsnCodes[index].ugstRate}%'),
          onTap: () {
            // Pass selected HSN code to the main page
            onHSNCodeSelected(hsnCodes[index].code);
          },
        );
      },
    );
  }
}

final List<HSNCode> hsnCodes = [
  HSNCode(
    code: "12345678",
    description: "Product 1",
    cgstRate: 5.0,
    sgstRate: 5.0,
    igstRate: 10.0,
    ugstRate: 10.0,
  ),
  HSNCode(
    code: "87654321",
    description: "Product 2",
    cgstRate: 6.0,
    sgstRate: 6.0,
    igstRate: 12.0,
    ugstRate: 10.0,
  ),
  HSNCode(
    code: "98765432",
    description: "Product 3",
    cgstRate: 7.0,
    sgstRate: 7.0,
    igstRate: 14.0,
    ugstRate: 11.0,
  ),
  HSNCode(
    code: "23456789",
    description: "Product 4",
    cgstRate: 8.0,
    sgstRate: 8.0,
    igstRate: 16.0,
    ugstRate: 12.0,
  ),
  HSNCode(
    code: "34567890",
    description: "Product 5",
    cgstRate: 9.0,
    sgstRate: 9.0,
    igstRate: 18.0,
    ugstRate: 13.0,
  ),
  // Add more HSNCode objects here as needed
];


class OrdersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            _showBottomSheet1(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white, // Background color of the container
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Color of the shadow
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset of the shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 70,
                      width:70,
                      child: Image.asset(
                          'lib/assets/download.jpeg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Order No. : 3",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,),),
                        Text("Lenovo Ideapad",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,),),
                        Text("QTY : 1",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,),),
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8,top: 20),
                        child: Text("Waiting for delivery",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Colors.grey),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text("Rs.45000.93",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.green),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white, // Background color of the container
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Color of the shadow
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: Offset(0, 3), // Offset of the shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 70,
                    width:70,
                    child: Image.asset(
                        'lib/assets/download (2).jpeg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order No. : 4",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,),),
                      Text("HP",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,),),
                      Text("QTY : 1",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,),),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8,top: 20),
                      child: Text("Waiting for delivery",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Colors.grey),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text("Rs.43000.63",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.green),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white, // Background color of the container
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Color of the shadow
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: Offset(0, 3), // Offset of the shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 70,
                    width:70,
                    child: Image.asset(
                        'lib/assets/download.jpeg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order No. : 1",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,),),
                      Text("Lenovo Ideapad",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,),),
                      Text("QTY : 1",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,),),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8,top: 20),
                      child: Text("Delivered",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Colors.green),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text("Rs.45000.93",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.green),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white, // Background color of the container
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Color of the shadow
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: Offset(0, 3), // Offset of the shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 70,
                    width:70,
                    child: Image.asset(
                        'lib/assets/download (2).jpeg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order No. : 2",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,),),
                      Text("HP",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,),),
                      Text("QTY : 1",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,),),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8,top: 20),
                      child: Text("Cancelled",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Colors.red),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text("Rs.43000.63",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.green),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  void _showBottomSheet1(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Text("Order No. : 3",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.indigoAccent),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Text("Lenovo Ideapad",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,),),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Text("Payment details:",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey.shade700),),
              ),
             SizedBox(height: 5,),
             Padding(
               padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
               child: Row(
                 children: [
                   Text("Product Price",style: TextStyle(fontSize: 15),),
                   Spacer(),
                   Text("42,000.00",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,fontFamily: 'MonoSpace'),),
                 ],
               ),
             ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Row(
                  children: [
                    Text("Giftwrap Charge",style: TextStyle(fontSize: 15),),
                    Spacer(),
                    Text("300.00",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,fontFamily: 'MonoSpace'),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Row(
                  children: [
                    Text("Packing Charge",style: TextStyle(fontSize: 15),),
                    Spacer(),
                    Text("700.00",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,fontFamily: 'MonoSpace'),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Row(
                  children: [
                    Text("Shipping Charge",style: TextStyle(fontSize: 15),),
                    Spacer(),
                    Text("1,900.93",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,fontFamily: 'MonoSpace'),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Row(
                  children: [
                    Text("Delivery Charge",style: TextStyle(fontSize: 15),),
                    Spacer(),
                    Text("100.00",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,fontFamily: 'MonoSpace'),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Row(
                  children: [
                    Text("Total",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                    Spacer(),
                    Text("45000.93",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,fontFamily: 'MonoSpace',color: Colors.black),),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CompletedTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white, // Background color of the container
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Color of the shadow
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: Offset(0, 3), // Offset of the shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 70,
                    width:70,
                    child: Image.asset(
                        'lib/assets/download.jpeg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order No. : 1",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,),),
                      Text("Lenovo Ideapad",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,),),
                      Text("QTY : 1",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,),),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8,top: 20),
                      child: Text("Delivered",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Colors.green),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text("Rs.45000.93",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.green),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CancelledTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white, // Background color of the container
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Color of the shadow
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: Offset(0, 3), // Offset of the shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 70,
                    width:70,
                    child: Image.asset(
                        'lib/assets/download (2).jpeg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order No. : 2",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,),),
                      Text("HP",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,),),
                      Text("QTY : 1",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,),),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8,top: 20),
                      child: Text("Cancelled",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Colors.red),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text("Rs.43000.63",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.green),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

