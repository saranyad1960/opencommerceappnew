import 'package:flutter/material.dart';

class CategoriesManagement extends StatefulWidget {
  static const routeName = '/categories-management';

  @override
  _CategoriesManagementState createState() => _CategoriesManagementState();
}

class _CategoriesManagementState extends State<CategoriesManagement> {
  bool _editMode = false;
  List _editCategoriesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'CategoriesManagement',
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _editMode = !_editMode;
                  if (!_editMode) {
                    _editCategoriesList.clear();
                  }
                });
              },
              color: _editMode ? Colors.black: Colors.blue[500],
              icon: Icon(
                _editMode
                    ? Icons.check_box_outline_blank_rounded
                    : Icons.check_box_rounded,
              ),
              tooltip: 'Create Ad Campaign',
            ),
            SizedBox(
              width: 5,
            ),
            _editMode ?
            IconButton(
              onPressed: () {
              },
              color:  Colors.black,
              icon: Icon(
                Icons.delete_rounded,
              ),
              tooltip: 'Remove Categories',
            ): Container(),
            SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_rounded,
              ),
              tooltip: 'Create Ad Campaign',
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
                Container(
                  color: Colors.white,
                  child: GridView.builder(
                    primary: false,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(4),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: 21,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // Navigator.of(context).pushNamed(OrderProcessing.routeName);
                          setState(() {
                            if (_editMode) {
                              if (!_editCategoriesList.contains(index)) {
                                _editCategoriesList.add(index);
                              } else {
                                _editCategoriesList.remove(index);
                              }
                            }
                          });
                        },
                        onLongPress: () {
                          setState(() {
                            _editMode = !_editMode;
                            if (_editMode) {
                              if (!_editCategoriesList.contains(index)) {
                                _editCategoriesList.add(index);
                              } else {
                                _editCategoriesList.remove(index);
                              }
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          color: _editCategoriesList.contains(index)
                              ? Colors.blue[100]
                              : Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 80,
                                child: Image.asset(
                                  'assets/images/asus_laptop.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'ORDERS',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ))));
  }
}
