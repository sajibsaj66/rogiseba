// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Blood%20Group/Widgets/BloodGroupBody.dart';
import 'package:rogisheba/Pages/Blood%20Group/Widgets/BloodGroupTop.dart';
import 'package:rogisheba/Providers/BloodProvider.dart';

// starting of Blood Group Page
class BloodGroup extends StatefulWidget {
  final int bloodGroupID;
  const BloodGroup({
    super.key,
    required this.bloodGroupID,
  });

  @override
  State<BloodGroup> createState() => _BloodGroupState();
}

class _BloodGroupState extends State<BloodGroup> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<BloodProvider>(context, listen: false);
    provider.getAllBloodGroup(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<BloodProvider>(
        builder: (context, value, child) {
          return value.isLoading2
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
                      // top of blood group page.
                      const BloodGroupTop(),
                      SizedBox(height: 19.5.h),
                      // rest of the blood group page.
                      BloodGroupBody(
                        bloodGroupID: widget.bloodGroupID,
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
