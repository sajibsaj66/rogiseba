// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Home%20Drawer/HomeDrawer.dart';
import 'package:rogisheba/Pages/HomePage/Widgets/HomeAd.dart';

import 'package:rogisheba/Pages/HomePage/Widgets/HomeOptions.dart';
import 'package:rogisheba/Pages/HomePage/Widgets/HomeTop.dart';
import 'package:rogisheba/Providers/ProfileProvider.dart';
import 'package:url_launcher/url_launcher_string.dart';

// starting of home page.
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //declaring global key for end drawer
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xffFFFFFF),
      endDrawer: Drawer(
        child: HomeDrawer(drawerKey: scaffoldKey),
      ),
      body: Consumer<ProfileProvider>(
        builder: (context, value, child) {
          return value.isProfile || value.isBanner || value.isGeneral
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      // declaring home top widget.
                      HomeTop(
                        userName: value.profile.user!.isNotEmpty
                            ? value.profile.user![0].name.toString()
                            : value.userData[0],
                        drawerKey: scaffoldKey,
                      ),
                      SizedBox(height: 35.h),
                      // calling advertise banner widget.
                      const HomeAd(),
                      SizedBox(height: 16.h),
                      // calling homr option widget.
                      const HomeOptions(),
                      // SizedBox(height: 15.h),
                      // // calling advertise banner widget.
                      // const HomeAd(),
                      SizedBox(height: 25.h),

                      // this button is for hotline calling.
                      GestureDetector(
                        onTap: () {
                          debugPrint("Hotline Button Clicked");
                        },
                        child: hotLineButton(),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                );
        },
      ),
    );
  }

  Widget hotLineButton() {
    return Consumer<ProfileProvider>(
      builder: (context, value, child) {
        String number = value.generalInfo.data![0].hotlineInfo.toString();
        return GestureDetector(
          onTap: () {
            launchUrlString('tel:$number');
          },
          child: Container(
            alignment: Alignment.center,
            height: 38.h,
            width: 178.w,
            padding: EdgeInsets.only(left: 32.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: const Color(0xffE51C26),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 15.sp,
                  color: const Color(0xffFFFFFF),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "রোগী সেবা হটলাইন",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFFFFFF),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
