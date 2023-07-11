// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:rogisheba/Pages/History%20Page/HistoryPage.dart';
import 'package:rogisheba/Pages/HomePage/HomePage.dart';
import 'package:rogisheba/Pages/Point%20Page/PointPage.dart';
import 'package:rogisheba/Pages/Profile%20Page/Profile.dart';

import '../../Providers/ProfileProvider.dart';

// this is the starting of home root Page, basically it only holds bottom navigation bars.
class HomeRoot extends StatefulWidget {
  const HomeRoot({super.key});

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  // declaring index variable for changing pages.
  int _index = 0;
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ProfileProvider>(context, listen: false);
    provider.getProfile(context);
    provider.getHomeBanner();
    provider.getGeneralInfo();
  }

  @override
  Widget build(BuildContext context) {
    // list of pages.
    List<Widget> pages = [
      const HomePage(),
      const PointPage(),
      const HistoryPage(),
      const Profile(),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: pages[_index],
        // declaring  bottom navigation bar.
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          iconSize: 20.sp,
          selectedIconTheme: IconThemeData(
            size: 24.sp,
          ),
          type: BottomNavigationBarType.fixed,
          currentIndex: _index,
          onTap: (value) {
            // set value after click on bottom nav bar.
            setState(() {
              _index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/nav_home.png",
                ),
                color: Color(0xff0D99FF),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/nav_taka.png",
                ),
                color: Color(0xffE51C26),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/nav_history.png",
                ),
                color: Color(0xffFFBE3E),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/nav_profile.png",
                ),
                color: Color(0xff000000),
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
