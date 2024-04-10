import 'package:flutter/material.dart';

import 'modules/stockmanagement/editproduct.dart';
import 'modules/stockmanagement/editservice.dart';
import 'modules/stockmanagement/products.dart';
import 'modules/stockmanagement/services.dart';
import 'modules/storeowner/dashboard.dart';
import 'modules/storeowner/editstore.dart';
import 'modules/storeowner/enquiries.dart';
import 'modules/storeowner/information.dart';
import 'modules/storeowner/servicearea.dart';
import 'modules/storepublicview/store.dart';

void main() {
  runApp(const Tabs());
}

class Tabs extends StatelessWidget {
  const Tabs({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tab(),
    );
  }
}

class Tab extends StatefulWidget {
    @override
  _TabState createState() => _TabState();
}

class _TabState extends State<Tab> {
  TextEditingController _controller = TextEditingController();
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Explore Page'),
    Text('Shop Page'),
    Text('Favorites Page'),
    Text('Account Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on,color: Colors.white,size: 10,),
                Text("Nizamabad,Telangana,India",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Colors.white
                ),
                )
              ],
            ),
            SizedBox(height: 3,),
            Row(
              children: [
                Container(
                 height: 40,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0,3,0,0),
                      hintText: 'Search',
                        border: InputBorder.none,
                      prefixIcon: Icon(Icons.search,color: Colors.grey,)
                    ),
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
            SizedBox(height: 5,),
          ],
        ),
      ),
      body: _selectedIndex == 0 ? BusinessDashboard() :
            _selectedIndex == 1 ? Products() :
            _selectedIndex == 2 ? Services() :
            _selectedIndex == 3 ? BusinessInformation() :
            _selectedIndex == 4 ? Store() : SizedBox(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_rounded),
            label: 'Information',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: 'Store',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigoAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}