import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../storeowner/enquiries.dart';
import '../storeowner/servicearea.dart';
import 'categoriesmanagement.dart';
import 'editservice.dart';

class Services extends StatefulWidget {
  static const routeName = '/services';

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'SERVICES',
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
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) =>
                    EditService()));
              },
              child: Icon(Icons.edit),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),

        body:
        //Text('crm dashboard')
        Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) =>
                    BusinessServiceArea()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.95,
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
                  ]
                  ),
                  child: Center(child: Text("Service Locations",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) =>
                    DeliveryStoreEnquiries()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.95,
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
                      ]
                  ),
                  child: Center(child: Text("Enquiries",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) =>
                    CategoriesManagement()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.95,
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
                      ]
                  ),
                  child: Center(child: Text("Category Management",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
                ),
              ),
            ),
          ],
        )
        );
  }
}
