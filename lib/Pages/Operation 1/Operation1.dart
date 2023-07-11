// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rogisheba/Pages/Operation%201/Widgets/Operation1Body.dart';
import 'package:rogisheba/Pages/Operation%201/Widgets/Operation1Top.dart';

class Operation1 extends StatelessWidget {
  const Operation1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Column(
          children: [
            SizedBox(height: 10.h),
            // top of blood group page.
            const Operation1Top(),
            SizedBox(height: 19.5.h),
            // rest of the blood group page.
            const Operation1Body()
          ],
        ),
      ),
    );
  }
}
