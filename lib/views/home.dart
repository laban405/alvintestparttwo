import 'package:alvintestpartone/views/budget.dart';
import 'package:alvintestpartone/views/more.dart';
import 'package:alvintestpartone/views/overview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  static const List<Widget> _pages = <Widget>[
    Overview(),
    Budget(),
    Notifications(),
    More(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: _pages.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        child:  Icon(Icons.note_add_outlined,
        size:7.0.w,
        color: Colors.white,),
        onPressed: (){

        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 8.0.w),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline_outlined, size: 8.0.w),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: <Widget>[
                Icon(Icons.notifications_none_outlined, size: 8.0.w),
                Positioned(
                  right: 1.5.w,
                  top: 1.5.w,
                  child: Container(
                    width: 2.5.w,
                    height: 2.5.w,
                    padding: EdgeInsets.all(1.0.w),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(2.0.w),
                    ),
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, size: 8.0.w),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
