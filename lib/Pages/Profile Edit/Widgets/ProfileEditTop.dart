// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileEditTop extends StatelessWidget {
  const ProfileEditTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 22.w),
          child: Row(
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
                    "Profile Edit",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'custom',
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff343434),
                    ),
                  )
                ],
              ),
            ],
          ),
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
