// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Appointment%202/Widgets/Appointment2.Top.dart';
import 'package:rogisheba/Pages/Appointment%202/Widgets/Appointment2Body.dart';
import 'package:rogisheba/Providers/DoctorProvider.dart';

class Appointment2 extends StatefulWidget {
  const Appointment2({super.key});

  @override
  State<Appointment2> createState() => _Appointment2State();
}

class _Appointment2State extends State<Appointment2> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<DoctorProvider>(context, listen: false);
    provider.getDoctorCategory(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: value.isLoading4
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
                      // this widget is for showing top of Appointment 2 page
                      const Appointment2Top(),
                      SizedBox(height: 21.5.h),
                      // this is for rest of Appointment 2 page.
                      const Appointment2Body()
                    ],
                  ),
                ),
        );
      },
    );
  }
}
