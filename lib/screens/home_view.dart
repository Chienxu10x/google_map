import 'dart:async';
import 'package:demo1/screens/fetch_data.dart';
import 'package:demo1/screens/ggmap.dart';
import 'package:demo1/screens/insert_location_data.dart';
import 'package:flutter/material.dart';

/*
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int index = 0;
  List<Widget> views = [
    MapSample(),
    InsertData(),
    FetchData()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: views.elementAt(index),
      bottomNavigationBar: MediaQuery.of(context).size.width < 640 ? NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value){
          index = value;
          setState(() {
          });
        },
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.map),
              label: 'Map'
          ),

          NavigationDestination(
              icon: Icon(Icons.insert_drive_file),
              label: 'Insert'),

          NavigationDestination(
              icon: Icon(Icons.update),
              label: 'Update'),

        ],

      ),

    );
  }
}*/

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // The contents of views
  // Only the content associated with the selected tab is displayed on the screen

  List<Widget> views = [
    const MapSample(),
    const MapSample2(),
    const FetchData()
  ];

  // The index of the selected tab
  // In the beginning, the Home tab is selected
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Show the navigaiton rail if screen width >= 640
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
              minWidth: 55.0,
              selectedIndex: _selectedIndex,
              // Called when one tab is selected
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: const TextStyle(
                color: Colors.amber,
              ),
              leading: Column(
                children: const [
                  SizedBox(
                    height: 8,
                  ),
                  CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person),
                  ),
                ],
              ),
              unselectedLabelTextStyle: const TextStyle(),
              // navigation rail items
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text('Home')),
                NavigationRailDestination(
                    icon: Icon(Icons.feed), label: Text('Insert')),
                NavigationRailDestination(
                    icon: Icon(Icons.update), label: Text('Update')),
              ],
            ),

          // Main content
          // This part is always shown
          // You will see it on both small and wide screen
          Expanded(child: views[_selectedIndex]),
        ],
      ),

      // Show the bottom tab bar if screen width < 640
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.indigoAccent,
          // called when one tab is selected
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          // bottom tab items
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.feed), label: 'Insert'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Update')
          ])
          : null,

    );
  }
}




