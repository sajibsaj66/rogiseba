// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Health%20Tips/Widgets/HealthTipsTop.dart';
import 'package:rogisheba/Pages/Health%20Tips/Widgets/TipsBox.dart';
import 'package:rogisheba/Pages/Health%20Tips/Widgets/TipsRow.dart';
import 'package:rogisheba/Providers/HealthTipsProvider.dart';

class HealthTips extends StatefulWidget {
  const HealthTips({super.key});

  @override
  State<HealthTips> createState() => _HealthTipsState();
}

class _HealthTipsState extends State<HealthTips> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<HealthTipsProvider>(context, listen: false);
    provider.getTips(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HealthTipsProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: value.isHealth
              ? const Scaffold(
                  backgroundColor: Color(0xffFFFFFF),
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  backgroundColor: const Color(0xffFFFFFF),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        const HealthTipsTop(),
                        SizedBox(height: 20.5.h),
                        TipsBox(
                          healthTips: value.healthTips,
                          index: 0,
                        ),
                        SizedBox(height: 16.h),
                        TipsBox(
                          healthTips: value.healthTips,
                          index: 1,
                        ),
                        SizedBox(height: 16.h),
                        TipsRow(
                          healthTips: value.healthTips,
                        ),
                        SizedBox(height: 28.h),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
