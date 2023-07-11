// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rogisheba/Pages/Operation%202/Widgets/Operation2Body.dart';
import 'package:rogisheba/Pages/Operation%202/Widgets/Operation2Top.dart';

class Operation2 extends StatelessWidget {
  final String operationName;
  const Operation2({super.key, required this.operationName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Column(
          children: [
            SizedBox(height: 10.h),
            // top of blood group page.
            const Operation2Top(),
            SizedBox(height: 19.5.h),
            // rest of the blood group page.
            Operation2Body(operationName: operationName)
          ],
        ),
      ),
    );
  }
}
