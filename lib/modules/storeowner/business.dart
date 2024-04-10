import 'package:flutter/material.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';

import '../storepublicview/store.dart';
import 'dashboard.dart';
import 'information.dart';
// import 'searchinstore.dart';
// import 'store.dart';

class Business extends StatefulWidget {
  static const routeName = '/business';

  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;
  final _scrollcontroller = ScrollController();

  @override
  void initState() {
    _pages = [
      {
        'page': Store(),
        'title': 'Home',
      },
      {
        'page': BusinessDashboard(),
        'title': 'Dashboard',
      },
      {
        'page': BusinessInformation(),
        'title': 'Information',
      },
      {
        'page': BusinessInformation(),
        'title': 'Notifications',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedPageIndex]['page'],

          Positioned(
              top: 30,
              left: 8,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.white,
                      child: Icon(Icons.arrow_back),
                    )),
              ),
              ),
              ),
        
          _selectedPageIndex != 1 ?  Positioned(
              top: 30,
              right: 8,
              child: Row(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: GestureDetector(
                        onTap: () {
                          // Navigator.of(context)
                          //     .pushNamed(SearchInStore.routeName);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.search_rounded,
                          ),
                        )),
                  ),
                ],
              ),
            )
          : Container()
        ],
      ),


      
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_rounded),
            label: 'Information',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded), // if note count > 0 color - blue, else black
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}
