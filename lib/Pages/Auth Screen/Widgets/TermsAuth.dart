// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rogisheba/Pages/Terms%20And%20Conditions%202/TermsAndCondition2.dart';

// this is for terms and conditions agreement text.
class TermsAuth extends StatelessWidget {
  const TermsAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const TermsAndConditions2();
            },
          ),
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "By signing in, you agree to the ",
                style: GoogleFonts.inter(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffABABAB),
                ),
              ),
              Text(
                "Terms and Conditions,",
                style: GoogleFonts.inter(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffE51C26),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "User Agreement ",
                style: GoogleFonts.inter(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffE51C26),
                ),
              ),
              Text(
                "and",
                style: GoogleFonts.inter(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffABABAB),
                ),
              ),
              Text(
                " Privacy Policy",
                style: GoogleFonts.inter(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffE51C26),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
