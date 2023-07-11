// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Providers/AuthProvider.dart';

// creating custom button for complete authentication proccess. it works for login and register both.
class AuthCustomButton extends StatelessWidget {
  const AuthCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
        return Container(
          height: 30.h,
          width: 40.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.r),
            color: const Color(0xffE51C26),
          ),
          child: value.isLoginDone
              ? SizedBox(
                height: 20.h,
                width: 20.h,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Image.asset(
                  "assets/images/arrow.png",
                  height: 13.75.h,
                  width: 21.52.w,
                  fit: BoxFit.fill,
                ),
        );
      },
    );
  }
}
