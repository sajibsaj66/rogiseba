// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../Providers/AddDonatorProvider.dart';

class PlaceDivision extends StatelessWidget {
  const PlaceDivision({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddDonatorProvider>(
      builder: (context, value, child) {
        return Container(
          height: 36.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(
              color: const Color(0xffF0787E),
              width: 1.w,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    iconSize: 0.0,
                    padding: EdgeInsets.only(left: 10.w),
                    hint: Text(
                      value.hint3.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'custom',
                        fontWeight: value.isDivision
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: value.isDivision
                            ? Colors.black
                            : const Color(0xffCACACA),
                      ),
                    ),
                    onChanged: (val) {
                      value.setDivision(val!.toInt());
                      value.getAllDistrict(context);
                    },
                    items: List.generate(
                      value.divisions.data!.length,
                      (index) => DropdownMenuItem(
                        value: value.divisions.data![index].id,
                        child: Text(
                          value.divisions.data![index].divisionName.toString(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 35.56.h,
                width: 35.w,
                alignment: Alignment.center,
                color:  const Color(0xffF0787E),
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 17.sp,
                  color: const Color(0xff343434),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
