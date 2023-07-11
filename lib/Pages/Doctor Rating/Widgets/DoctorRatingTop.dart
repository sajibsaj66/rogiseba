// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorRatingTop extends StatelessWidget {
  const DoctorRatingTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20.sp,
                    color: const Color(0xff343434),
                  ),
                ),
                SizedBox(
                  width: 14.5.w,
                ),
                Text(
                  "ডাক্তারকে রেটিং দিন",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff343434),
                  ),
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 20.sp,
                    color: const Color(0xff343434),
                  ),
                ),
                SizedBox(
                  width: 19.w,
                ),
                GestureDetector(
                  child: Image.asset(
                    "assets/images/sidebar_button.png",
                    height: 18.59.h,
                    width: 22.w,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 21.w,
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          height: 0.5.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: 21.w,
          ),
          color: const Color(0xff343434),
        )
      ],
    );
  }
}
