// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Providers/ProfileProvider.dart';

class ProfileGenderSelector extends StatelessWidget {
  const ProfileGenderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, value, child) {
        return DropdownButtonHideUnderline(
          child: DropdownButton(
            iconSize: 0.0,
            padding: EdgeInsets.only(left: 10.w),
            hint: Text(
              value.genderText.toString(),
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'custom',
                fontWeight: value.isGender ? FontWeight.w600 : FontWeight.w400,
                color: value.isGender ? Colors.black : const Color(0xffCACACA),
              ),
            ),
            onChanged: (val) {
              value.setGender(val!);
            },
            items: List.generate(
              value.gender.length,
              (index) => DropdownMenuItem(
                value: index,
                child: Text(
                  value.gender[index],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
