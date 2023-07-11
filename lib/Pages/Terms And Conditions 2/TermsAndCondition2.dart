// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Providers/ProfileProvider.dart';

import 'Widgets/TermsAndConditionTop2.dart';

class TermsAndConditions2 extends StatefulWidget {
  const TermsAndConditions2({super.key});

  @override
  State<TermsAndConditions2> createState() => _TermsAndConditions2State();
}

class _TermsAndConditions2State extends State<TermsAndConditions2> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ProfileProvider>(context, listen: false);
    provider.getGeneralInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: value.isGeneral
              ? const Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  backgroundColor: const Color(0xffFFFFFF),
                  body: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      // this widget is for showing top of Terms And Conditions page
                      const TermsAndConditionsTop2(),
                      SizedBox(height: 10.5.h),
                      // this is for rest of Terms And Conditions page.
                      termsAndConditionsText(),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget termsAndConditionsText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Consumer<ProfileProvider>(
        builder: (context, value, child) {
          return Text(
            value.generalInfo.data![0].termsInfo.toString(),
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w400,
              color: const Color(0xff000000),
            ),
          );
        },
      ),
    );
  }
}
