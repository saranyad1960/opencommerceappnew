import 'package:flutter/material.dart';

class ServiceDetail extends StatefulWidget {
  static const routeName = '/service-detail';

  @override
  _ServiceDetailState createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {

  // public view, owner view

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
