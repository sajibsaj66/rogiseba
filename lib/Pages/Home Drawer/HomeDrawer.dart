// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/About%20Us%20Page/AboutUs.dart';
import 'package:rogisheba/Pages/Complain%20Page/Complain.dart';
import 'package:rogisheba/Pages/Doctor%20Rating/DoctorRating.dart';
import 'package:rogisheba/Pages/Doner%20Page/DonerPage.dart';
import 'package:rogisheba/Pages/Home%20Drawer/Widgets/SaveLocation.dart';
import 'package:rogisheba/Pages/Terms%20And%20Conditions/TermsAndCondition.dart';
import 'package:rogisheba/Providers/HomeDrawerProvider.dart';

// starting of Homepage sdrawer widget.
class HomeDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  const HomeDrawer({
    super.key,
    required this.drawerKey,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeDrawerProvider>(
      builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35.h),
              // creating close drawer method to close drawer after click.
              closeDrawer(drawerKey),
              SizedBox(height: 30.h),
              value.isLocation
                  ? const SaveLocation()
                  : GestureDetector(
                      onTap: () {
                        value.showLocation();
                      },
                      child: locationWidget(),
                    ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AboutUs();
                      },
                    ),
                  );
                },
                child: drawerOptions(
                  "assets/images/about_us.png",
                  15,
                  22,
                  "আমাদের সম্পর্কে",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Complain();
                      },
                    ),
                  );
                },
                child: drawerOptions2(
                  "assets/images/complain.png",
                  16,
                  14,
                  "অভিযোগ বাক্স",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DoctorRating();
                      },
                    ),
                  );
                },
                child: drawerOptions3(
                  "assets/images/rating.png",
                  13,
                  13,
                  "ডাক্তার রেটিং",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DonerPage();
                      },
                    ),
                  );
                },
                child: drawerOptions4(
                  "assets/images/doner.png",
                  16,
                  16,
                  "ডোনার হিসেবে যুক্ত হোন",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const TermsAndConditions();
                      },
                    ),
                  );
                },
                child: drawerOptions5(
                  "assets/images/rules.png",
                  15,
                  16,
                  "নিয়মকানুন ও শর্তাবলী",
                ),
              ),
              GestureDetector(
                child: drawerOptions6(
                  "assets/images/refer.png",
                  14,
                  16,
                  "রেফার করুন",
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget closeDrawer(GlobalKey<ScaffoldState> drawerKey) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w),
      child: IconButton(
        onPressed: () {
          drawerKey.currentState?.closeEndDrawer();
        },
        icon: Icon(
          Icons.close,
          size: 22.sp,
          color: const Color(0xff343434),
        ),
      ),
    );
  }
}

Widget locationWidget() {
  return Padding(
    padding: EdgeInsets.only(left: 40.w),
    child: Row(
      children: [
        Image.asset(
          "assets/images/location_icon.png",
          height: 15.h,
          width: 11.17.w,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 20.w),
        Text(
          "স্থান",
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xff000000),
          ),
        ),
        SizedBox(width: 6.w),
        Icon(
          Icons.arrow_right,
          size: 15.sp,
          color: const Color(0xff000000),
        )
      ],
    ),
  );
}

Widget drawerOptions(String image, int height, int width, title) {
  return Padding(
    padding: EdgeInsets.only(left: 36.w, top: 20.h),
    child: Row(
      children: [
        Image.asset(
          image,
          height: height.h,
          width: width.w,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 15.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xff000000),
          ),
        ),
      ],
    ),
  );
}

Widget drawerOptions2(String image, int height, int width, title) {
  return Padding(
    padding: EdgeInsets.only(left: 40.w, top: 20.h),
    child: Row(
      children: [
        Image.asset(
          image,
          height: height.h,
          width: width.w,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 19.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xff000000),
          ),
        ),
      ],
    ),
  );
}

Widget drawerOptions3(String image, int height, int width, title) {
  return Padding(
    padding: EdgeInsets.only(left: 40.w, top: 20.h),
    child: Row(
      children: [
        Image.asset(
          image,
          height: height.h,
          width: width.w,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 20.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xff000000),
          ),
        ),
      ],
    ),
  );
}

Widget drawerOptions4(String image, int height, int width, title) {
  return Padding(
    padding: EdgeInsets.only(left: 39.w, top: 20.h),
    child: Row(
      children: [
        Image.asset(
          image,
          height: height.h,
          width: width.w,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 18.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xff000000),
          ),
        ),
      ],
    ),
  );
}

Widget drawerOptions5(String image, int height, int width, title) {
  return Padding(
    padding: EdgeInsets.only(left: 39.w, top: 20.h),
    child: Row(
      children: [
        Image.asset(
          image,
          height: height.h,
          width: width.w,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 19.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xff000000),
          ),
        ),
      ],
    ),
  );
}

Widget drawerOptions6(String image, int height, int width, title) {
  return Padding(
    padding: EdgeInsets.only(left: 40.w, top: 20.h),
    child: Row(
      children: [
        Image.asset(
          image,
          height: height.h,
          width: width.w,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 18.07.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xff000000),
          ),
        ),
      ],
    ),
  );
}
