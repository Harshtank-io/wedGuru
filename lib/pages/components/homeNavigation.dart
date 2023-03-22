import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wed_guru/pages/API/api.dart';
import 'package:wed_guru/pages/Localdb/userlist.dart';
import 'package:wed_guru/pages/components/profile.dart';
import 'package:wed_guru/pages/components/swipeCardpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static  final List<Widget>  _widgetOptions = <Widget>[
    UserHome(),
    UserList(),
    //UserAdd(),
    TodoListPage(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: Colors.white,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.pink,
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,
              vertical: 12),
          child: GNav(
            backgroundColor: Colors.pink,
            color: Colors.white,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.white70,
            padding: const EdgeInsets.all(15),
            gap: 8,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),

              GButton(icon: Icons.add,
                text: 'Add',
                ),
              GButton(
                icon: Icons.api,
                text: 'Api',
              ),
              GButton(icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );

        }
}
