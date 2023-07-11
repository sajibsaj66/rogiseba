// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Appointment%203/Appointment3.dart';
import 'package:rogisheba/Providers/DoctorProvider.dart';

class Appointment2Body extends StatelessWidget {
  const Appointment2Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorProvider>(
      builder: (context, value, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: value.doctorCategory.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Appointment3(
                          categoryItem:
                              value.doctorCategory.data![index].id!.toInt(),
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  height: 55.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    bottom: 7.h,
                  ),
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 20.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: const Color(0xffD9D9D9),
                      width: 1.w,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 35.h,
                            width: 37.47.w,
                            padding: EdgeInsets.all(8.w),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffF0787E),
                            ),
                            child: Image.asset(
                              "assets/images/operations.png",
                              height: 17.12.h,
                              width: 19.31.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(width: 19.27.w),
                          Text(
                            value.doctorCategory.data![index].name.toString(),
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'custom',
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff343434),
                            ),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: const Color(0xffD9D9D9),
                        size: 18.sp,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
