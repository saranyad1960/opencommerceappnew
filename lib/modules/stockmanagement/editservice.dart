import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class EditService extends StatefulWidget {
  static const routeName = '/edit-service';

  @override
  _EditService createState() => _EditService();
}
/*
basic details - title, description, or select product
images, videos
tags
stock - skuid, cost, selling price,  mrp, 


reorder level, stock alert, etc

*/

class _EditService extends State<EditService> {
  int activeStep = 0;
  int upperBound = 4;
  final _form = GlobalKey<FormState>();
  final _searchForm = GlobalKey<FormState>();
  final _tagsForm = GlobalKey<FormState>();
  final _skuForm = GlobalKey<FormState>();
  final _stockControlForm = GlobalKey<FormState>();
  Widget _activeWidget = Container();
  bool _serviceExists = false;
  int _qtycount = 0;

  Widget _serviceInfo() {
    return Column(
      children: [
        Container(
          child: Form(
            key: _searchForm,
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
                          hintText: 'Search Services',
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
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10)),
                      child: Text(
                          _serviceExists ? 'CONFIRM PRODUCT' : 'ADD PRODUCT'))
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            'IF PRODUCT NOT YOU CAN CREATE THE PRODUCT BY CLICKING CREATE BUTTION',
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Form(
            key: _form,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Icon(
                    Icons.account_circle_rounded,
                    color: Colors.black,
                    size: 80,
                  ),
                  SizedBox(
                    height: 25,
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
                          hintText: 'email',
                          suffixIcon: Icon(
                            Icons.alternate_email_rounded,
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
                      color: Colors.black12,
                      width: double.infinity,
                      padding: EdgeInsets.all(4),
                      child: TextFormField(
                        // obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                // _passwordVisible = !_passwordVisible;
                              });
                            },
                            icon: Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                        onSaved: (value) {
                          // _userAuthData = UserAuthData(
                          //     email: _userAuthData.email,
                          //     password: value,
                          // );
                        },
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25,
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
                          hintText: 'email',
                          suffixIcon: Icon(
                            Icons.alternate_email_rounded,
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
                      color: Colors.black12,
                      width: double.infinity,
                      padding: EdgeInsets.all(4),
                      child: TextFormField(
                        // obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                // _passwordVisible = !_passwordVisible;
                              });
                            },
                            icon: Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                        onSaved: (value) {
                          // _userAuthData = UserAuthData(
                          //     email: _userAuthData.email,
                          //     password: value,
                          // );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
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
                          hintText: 'email',
                          suffixIcon: Icon(
                            Icons.alternate_email_rounded,
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
                  // ClipRRect(
                  //         borderRadius: BorderRadius.circular(10),
                  //         child: Container(
                  //           color: Colors.black12,
                  //           width: double.infinity,
                  //           padding: EdgeInsets.all(4),
                  //           child: TextFormField(
                  //             // obscureText: !_passwordVisible,
                  //             decoration: InputDecoration(
                  //               hintStyle: TextStyle(fontSize: 17),
                  //               hintText: 'password',
                  //               suffixIcon: IconButton(
                  //                 onPressed: () {
                  //                   setState(() {
                  //                     // _passwordVisible = !_passwordVisible;
                  //                   });
                  //                 },
                  //                 icon: Icon(
                  //                   Icons.visibility_off,
                  //                   color: Colors.black,
                  //                 ),
                  //               ),
                  //               border: InputBorder.none,
                  //               contentPadding: EdgeInsets.symmetric(
                  //                   vertical: 15, horizontal: 20),
                  //             ),
                  //             onSaved: (value) {
                  //               // _userAuthData = UserAuthData(
                  //               //     email: _userAuthData.email,
                  //               //     password: value,
                  //               // );
                  //             },
                  //           ),
                  //         ),
                  //       ),
                ],
              ),
            ),
          ),
        )
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
                  // Navigator.of(context).pushNamed(Services.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/asus_laptop.png',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Services.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/asus_laptop.png',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Services.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/asus_laptop.png',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Services.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/asus_laptop.png',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Services.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/asus_laptop.png',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Services.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/asus_laptop.png',
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
                  // Navigator.of(context).pushNamed(Services.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/asus_laptop.png',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Services.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/asus_laptop.png',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Services.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/asus_laptop.png',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Services.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/asus_laptop.png',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Services.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/asus_laptop.png',
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(Services.routeName);
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/asus_laptop.png',
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
                    color: Colors.black12,
                    padding: EdgeInsets.all(4),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 17),
                        hintText: 'Search Services',
                        suffixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10)),
                    child: Text(
                        _serviceExists ? 'CONFIRM PRODUCT' : 'ADD PRODUCT'))
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

  Widget _sku() {
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
                          hintText: 'Search Services',
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
                          hintText: 'Search Services',
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
                          hintText: 'Search Services',
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
                          hintText: 'Search Services',
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
                          hintText: 'Search Services',
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
                          hintText: 'Search Services',
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
                          hintText: 'Search Services',
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
                          hintText: 'Search Services',
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
            )),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'REORDER LEVEL',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'DANGER LEVEL',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'STOCK TIMER',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
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
        _activeWidget = _serviceInfo();
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
        _activeWidget = _serviceInfo();
        return 'PRODUCT INFORMATION';
    }
  }
}
