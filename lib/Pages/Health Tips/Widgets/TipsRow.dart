// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Models/HealthTipsModel.dart';
import '../../Health Tips Details/HealthTipsDetails.dart';

class TipsRow extends StatelessWidget {
  final HealthTipsModel healthTips;
  const TipsRow({super.key, required this.healthTips});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(healthTips.data!.length, (index) {
            return index != 0 && index != 1
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HealthTipsDetails(
                                healthTips: healthTips, index: index);
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 153.5.h,
                      width: 128.w,
                      margin: EdgeInsets.only(right: 15.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(0.25),
                            offset: const Offset(0, 1),
                            spreadRadius: 0,
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 114.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xffD9D9D9),
                              image: DecorationImage(
                                image: NetworkImage(healthTips
                                    .data![index].healthTipsImageUrl
                                    .toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            height: 38.h,
                            width: double.infinity,
                            alignment: Alignment.center,
                            color: const Color(0xffFFFFFF),
                            child: Text(
                              healthTips.data![index].healthTipsHeading
                                  .toString(),
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'custom',
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff343434),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container();
          }),
        ),
      ),
    );
  }
}
