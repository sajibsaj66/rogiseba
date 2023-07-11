// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Blood%20Donor/Widgets/BloodDonorList.dart';
import 'package:rogisheba/Pages/Blood%20Donor/Widgets/BloodDonorTop.dart';
import 'package:rogisheba/Providers/BloodProvider.dart';

// Starting OF Blood Donor Page.
class BloodDonor extends StatefulWidget {
  final String title;
  final int bloodGroupID;
  final int bloodID;
  const BloodDonor(
      {super.key,
      required this.title,
      required this.bloodGroupID,
      required this.bloodID});

  @override
  State<BloodDonor> createState() => _BloodDonorState();
}

class _BloodDonorState extends State<BloodDonor> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<BloodProvider>(context, listen: false);
    provider.getAllDonator(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<BloodProvider>(
        builder: (context, value, child) {
          return value.isLoading3
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
                      SizedBox(height: 10.h),
                      // top of blood Donor page.
                      BloodDonorTop(title: widget.title),
                      SizedBox(height: 21.5.h),
                      // rest of Blood Donor Page.
                      BloodDonorList(
                        bloodGroupID: widget.bloodGroupID,
                        bloodID: widget.bloodID,
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
