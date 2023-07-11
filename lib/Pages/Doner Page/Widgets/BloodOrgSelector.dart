// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../Providers/AddDonatorProvider.dart';

class BloodOrgSelector extends StatelessWidget {
  const BloodOrgSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AddDonatorProvider>(
      builder: (context, value, child) {
        return DropdownButtonHideUnderline(
          child: DropdownButton(
            iconSize: 0.0,
            padding: EdgeInsets.only(left: 10.w),
            hint: Text(
              value.hint2.toString(),
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'custom',
                fontWeight: value.isOrg ? FontWeight.w600 : FontWeight.w400,
                color: value.isOrg ? Colors.black : const Color(0xffCACACA),
              ),
            ),
            onChanged: (val) {
              value.setBloodOrg(val!.toInt());
            },
            items: List.generate(
              value.bloodDonationGroup.data!.length,
              (index) => DropdownMenuItem(
                value: value.bloodDonationGroup.data![index].id,
                child: Text(
                  value.bloodDonationGroup.data![index].bloodDonationGroupName
                      .toString(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
