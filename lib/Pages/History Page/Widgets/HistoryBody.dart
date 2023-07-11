// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// starting of History body.
class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: 12.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "২২/০২/২৩",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'custom',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffABABAB),
                      ),
                    ),
                    SizedBox(width: 31.w),
                    Text(
                      "সার্ভিসের নাম",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'custom',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff343434),
                      ),
                    )
                  ],
                ),
                Text(
                  "এক্টিভিটি",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffABABAB),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
