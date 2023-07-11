// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/About%20Us%20Page/Widgets/AboutUsTop.dart';
import 'package:rogisheba/Providers/ProfileProvider.dart';

// starting of About us Page
class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
                      // this widget is for showing top of About Us page
                      const AboutUsTop(),
                      SizedBox(height: 9.5.h),
                      // this is for rest of About Us page.
                      aboutUsText()
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget aboutUsText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Consumer<ProfileProvider>(
        builder: (context, value, child) {
          return Text(
            value.generalInfo.data![0].aboutUs.toString(),
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
