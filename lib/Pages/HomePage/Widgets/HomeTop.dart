// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rogisheba/Pages/Search%20Page/SearchPage.dart';

// starting of home top widget.
class HomeTop extends StatelessWidget {
  // declaring username for get user name from api.
  final String userName;
  final GlobalKey<ScaffoldState> drawerKey;
  const HomeTop({
    super.key,
    required this.userName,
    required this.drawerKey,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 170.h,
          width: double.infinity,
          padding: EdgeInsets.only(
            left: 37.w,
            right: 30.44.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.r),
              bottomRight: Radius.circular(8.r),
            ),
            color: const Color(0xffFFDBDD),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        "assets/images/home_top_logo.png",
                        height: 50.h,
                        width: 30.99,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 19.01.w,
                      ),
                      Text(
                        "হ্যালো, $userName",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'custom',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff000000),
                        ),
                      )
                    ],
                  ),

                  // it will open drawer from right after clicking.
                  GestureDetector(
                    onTap: () {
                      drawerKey.currentState?.openEndDrawer();
                    },
                    child: Image.asset(
                      "assets/images/sidebar_button.png",
                      width: 22.w,
                      height: 19.h,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
              SizedBox(height: 14.h),
              customText(),
              SizedBox(height: 29.h),
            ],
          ),
        ),
        // it will navigate search page after clicking.
        Positioned(
          top: 151.h,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const SearchPage();
                }),
              );
            },
            child: searchField(),
          ),
        ),
      ],
    );
  }

  Widget customText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "রোগী",
          style: TextStyle(
            fontSize: 15.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xffE51C26),
          ),
        ),
        Text(
          "সেবা তে আপনাকে",
          style: TextStyle(
            fontSize: 15.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xff343434),
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          "স্বাগতম !",
          style: TextStyle(
            fontSize: 24.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w600,
            color: const Color(0xff343434),
          ),
        )
      ],
    );
  }

  Widget searchField() {
    return Container(
      height: 35.h,
      width: 256.w,
      margin: EdgeInsets.symmetric(horizontal: 52.w),
      padding: EdgeInsets.only(left: 20.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: const Color(0xffFFFFFF),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 18.sp,
            color: const Color(0xffF0787E),
          ),
          SizedBox(width: 15.w),
          Container(
            height: 21.h,
            width: 1,
            color: const Color(0xffF0787E),
          ),
          SizedBox(width: 13.w),
          Text(
            "অনুসন্ধান করুন",
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w400,
              color: const Color(0xffF0787E),
            ),
          )
        ],
      ),
    );
  }
}
