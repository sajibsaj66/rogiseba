// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Doctor%20Category/Widgets/DoctorCategoryTop.dart';
import 'package:rogisheba/Providers/DoctorProvider.dart';

import 'Widgets/DoctorCategoryBody.dart';

// starting of blood bank Page.
class DoctorCategory extends StatefulWidget {
  const DoctorCategory({super.key});

  @override
  State<DoctorCategory> createState() => _DoctorCategoryState();
}

class _DoctorCategoryState extends State<DoctorCategory> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<DoctorProvider>(context, listen: false);
    provider.getDoctorCategory(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<DoctorProvider>(
        builder: (context, value, child) {
          return value.isLoading4
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
                      const DoctorCategoryTop(),
                      SizedBox(height: 21.5.h),
                      // this is for rest of the part.
                      const DoctorCategoryBody()
                    ],
                  ),
                );
        },
      ),
    );
  }
}
