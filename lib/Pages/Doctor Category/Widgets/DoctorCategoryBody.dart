// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Appointment%203/Appointment3.dart';
import 'package:rogisheba/Providers/DoctorProvider.dart';

class DoctorCategoryBody extends StatelessWidget {
  const DoctorCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorProvider>(
      builder: (context, value, child) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: 13.w,
              left: 20.w,
            ),
            // using gridview builder for supports dynamic value.
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.9.w / 1.h,
              ),
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
                    height: 113.h,
                    width: 102.w,
                    margin: EdgeInsets.only(
                      right: 7.w,
                      bottom: 11.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: const Color(0xffD9D9D9),
                        width: 1.w,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 7.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50.h,
                          width: 50.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffF0787E),
                          ),
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: 'custom',
                              fontWeight: FontWeight.w600,
                              color: const Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          value.doctorCategory.data![index].name.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'custom',
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff343434),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
