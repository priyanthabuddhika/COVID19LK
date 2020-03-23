import 'package:covid19lk/models/destination.dart';
import 'package:covid19lk/screens/home.dart';
import 'package:covid19lk/screens/hospitalview.dart';
import 'package:covid19lk/screens/info.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentIndex = 0;

   final _homeTabs = {
    Home(),
    HospitalView(),
    Info(),
  };

   final _homeTabItems = [
     Destination('Home', Icons.home, Colors.blue),
     Destination('Hospitals', Icons.local_hospital, Colors.cyan),
     Destination('Info',Icons.info,Colors.deepOrange),
  ];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
          backgroundColor: _homeTabItems[_currentIndex].color,
          title: Text(
            _homeTabItems[_currentIndex].title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          )),
      body: _homeTabs.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            backgroundColor: destination.color,
            title: Text(destination.title)
          );
        }).toList(),
      ),
       );
 }
}