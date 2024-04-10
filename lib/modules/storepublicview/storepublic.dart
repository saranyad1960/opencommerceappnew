import 'package:flutter/material.dart';

class StorePublicView extends StatefulWidget {
  static const routeName = '/store-public-view';

  @override
  _StorePublicViewState createState() => _StorePublicViewState();
}
/*
business, store score
orders processed, customers, 

*/

class _StorePublicViewState extends State<StorePublicView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     'BUSINESS',
        //   ),
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //       },
        //       icon: Icon(
        //         Icons.add_rounded,
        //       ),
        //       tooltip: 'Create Ad Campaign',
        //     ),
        //     SizedBox(
        //       width: 5,
        //     ),
        //     SizedBox(
        //       width: 5,
        //     ),
        //   ],
        // ),

        body: Center(child: Text('crm dashboard')));
  }
}
