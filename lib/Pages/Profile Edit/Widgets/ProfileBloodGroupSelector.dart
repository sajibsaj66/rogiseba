// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Providers/AddDonatorProvider.dart';

class ProfileBloodGroupSelector extends StatelessWidget {
  const ProfileBloodGroupSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddDonatorProvider>(
      builder: (context, value, child) {
        return DropdownButtonHideUnderline(
          child: DropdownButton(
            iconSize: 0.0,
            padding: EdgeInsets.only(left: 10.w),
            hint: Text(
              value.hint1.toString(),
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'custom',
                fontWeight: value.isBlood ? FontWeight.w600 : FontWeight.w400,
                color: value.isBlood ? Colors.black : const Color(0xffCACACA),
              ),
            ),
            onChanged: (val) {
              value.setBloodGroup(val!.toInt());
            },
            items: List.generate(
              value.allBloodGroup.data!.length,
              (index) => DropdownMenuItem(
                value: value.allBloodGroup.data![index].id,
                child: Text(
                  value.allBloodGroup.data![index].bloodGroupName.toString(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
