import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../res/app_colors.dart';
import '../res/app_images.dart';
import 'bottom_screens/home/home_screen.dart';
import 'bottom_screens/job/job_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int currentIndex = 0;

  final List _screens = [
    HomeScreen(),
    const SizedBox(),
    JobScreen(),
  ];

  void _selectedPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 2.0,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.grey,
          onTap: _selectedPage,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.homeInactiveIcon),
              activeIcon: SvgPicture.asset(AppImages.homeActiveIcon),
              label: "Home",
              tooltip: "Home",
            ),
            const BottomNavigationBarItem(
              activeIcon: null,
              icon: Icon(null),
              label: "",
              tooltip: "Scan",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.jobInactiveIcon),
              activeIcon: Image.asset(AppImages.jobActiveIcon),
              label: "Jobs",
              tooltip: "Jobs",
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: AppColors.warningOneColor,
          tooltip: "Scan",
          child: SvgPicture.asset(AppImages.scanIcon),
          onPressed: () {
            setState(() {
              //currentIndex = 2;
            });
          },
        ),
      ),
      body: _screens[currentIndex],
    );
  }
}