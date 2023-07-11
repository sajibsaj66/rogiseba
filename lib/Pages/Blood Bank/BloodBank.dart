// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Blood%20Bank/Widgets/BloodBankBody.dart';
import 'package:rogisheba/Pages/Blood%20Bank/Widgets/BloodBankTop.dart';
import 'package:rogisheba/Providers/BloodProvider.dart';

// starting of blood bank Page.
class BloodBank extends StatefulWidget {
  const BloodBank({super.key});

  @override
  State<BloodBank> createState() => _BloodBankState();
}

class _BloodBankState extends State<BloodBank> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<BloodProvider>(context, listen: false);
    provider.getAllDonationGroup(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<BloodProvider>(
        builder: (context, value, child) {
          return value.isLoading
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
                      // this widget is for view top part of blood bank page.
                      const BloodBankTop(),
                      SizedBox(height: 21.5.h),
                      // this is for rest of the part.
                      const BloodBankBody()
                    ],
                  ),
                );
        },
      ),
    );
  }
}
