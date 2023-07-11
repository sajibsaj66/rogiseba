// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../Providers/AddDonatorProvider.dart';

class DistrictSelector extends StatelessWidget {
  const DistrictSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddDonatorProvider>(
      builder: (context, value, child) {
        return Container(
          height: 36.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(
              color: const Color(0xffABABAB),
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
                      value.hint4.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'custom',
                        fontWeight: value.isDistrict
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: value.isDistrict
                            ? Colors.black
                            : const Color(0xffCACACA),
                      ),
                    ),
                    onChanged: (val) {
                      value.setDistrict(val!.toInt());
                      value.getThana(context);
                    },
                    items: List.generate(
                      value.districts.data!.length,
                      (index) {
                        return DropdownMenuItem(
                          value: value.districts.data![index].id,
                          child: Text(
                            value.districts.data![index].districtName
                                .toString(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                height: 35.56.h,
                width: 35.w,
                alignment: Alignment.center,
                color: const Color(0xffABABAB),
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
