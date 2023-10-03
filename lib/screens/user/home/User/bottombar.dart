import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/classes/custom_text.dart';
import 'package:uber_ui/screens/startup_screen.dart';
import 'package:uber_ui/screens/user/account/account_screen.dart';
import 'package:uber_ui/screens/user/history/activity_screen.dart';
import 'package:uber_ui/screens/user/home/User/home_screen.dart';
import 'package:uber_ui/screens/user/services/service_screen.dart';

final drawerKey = GlobalKey<ScaffoldState>();

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;
  late List<BottomNavigationBarItem> _bottomNavBarItems;

  bool isDriver = true;

  @override
  void initState() {
    super.initState();

    _widgetOptions = <Widget>[
      const HomeScreen(),
      const ServiceScreen(),
      const ActivityScreen(),
      const AccountScreen(),
    ];

    _bottomNavBarItems = const [
      BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.home,
            color: Colors.black26,
          ),
          activeIcon: Icon(
            CupertinoIcons.home,
            color: Colors.black,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.calendar,
            color: Colors.black26,
          ),
          activeIcon: Icon(
            CupertinoIcons.calendar,
            color: Colors.black,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.clock,
            color: Colors.black26,
          ),
          activeIcon: Icon(
            CupertinoIcons.clock,
            color: Colors.black,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.person,
            color: Colors.black26,
          ),
          activeIcon: Icon(
            CupertinoIcons.person,
            color: Colors.black,
          ),
          label: ''),
    ];

    _selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                  SizedBox(height: 10),
                  CustomTextWidget(
                    text: 'John Smith',
                    textColor: Colors.white,
                    fSize: 18,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.person_2_rounded),
                  // ignore: dead_code
                  title: CustomTextWidget(
                    text: isDriver ? 'Driver Mode' : 'User Mode',
                    textColor: Colors.black,
                    fSize: 18,
                  ),
                  onTap: () {
                    drawerKey.currentState?.closeDrawer();
                  },
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.55),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Card(
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: const CustomTextWidget(text: 'Log out'),
                  onTap: () {
                    Get.offAll(const StartUpScreen());
                  },
                ),
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        items: _bottomNavBarItems,
      ),
    );
  }
}
