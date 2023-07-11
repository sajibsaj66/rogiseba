// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Appointment%203/Widgets/Appointment3Body.dart';
import 'package:rogisheba/Pages/Appointment%203/Widgets/Appointment3Top.dart';

import '../../Providers/DoctorProvider.dart';

class Appointment3 extends StatefulWidget {
  final int categoryItem;
  const Appointment3({
    super.key,
    required this.categoryItem,
  });

  @override
  State<Appointment3> createState() => _Appointment3State();
}

class _Appointment3State extends State<Appointment3> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<DoctorProvider>(context, listen: false);
    provider.getDoctorWithCategory(widget.categoryItem.toString(), context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: value.isLoading5
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
                      // this widget is for showing top of Appointment 3 page
                      const Appointment3Top(),
                      SizedBox(height: 21.5.h),
                      // this is for rest of Appointment 3 page.
                      const Appointment3Body(
                        divisionName: "",
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
