// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/History%20Page/Widgets/HistoryAppointment.dart';
import 'package:rogisheba/Pages/History%20Page/Widgets/HistoryOperations.dart';
import 'package:rogisheba/Pages/History%20Page/Widgets/HistoryPageTop.dart';
import 'package:rogisheba/Providers/HistoryProvider.dart';

// starting of History Page.
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<HistoryProvider>(context, listen: false);
    provider.getAllHistory(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: const Color(0xffFFFFFF),
          body: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              // this widget is for showing top of history page
              const HistoryPageTop(),
              optionButtons(context),
              SizedBox(height: 15.h),
              value.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : value.isAppointment
                      ? const HistoryAppointment()
                      : const HistoryOperations(),
            ],
          ),
        );
      },
    );
  }

  Widget optionButtons(BuildContext context) {
    return Consumer<HistoryProvider>(
      builder: (context, value, child) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                value.changeOption(true);
              },
              child: Container(
                height: 36.h,
                width: MediaQuery.of(context).size.width * 0.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: value.isAppointment
                      ? const Color(0xffF0787E)
                      : const Color(0xffD9D9D9),
                ),
                child: Text(
                  "Appointment",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w400,
                    color: value.isAppointment
                        ? const Color(0xffFFFFFF)
                        : const Color(0xff343434),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                value.changeOption(false);
              },
              child: Container(
                height: 36.h,
                width: MediaQuery.of(context).size.width * 0.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: value.isAppointment
                      ? const Color(0xffD9D9D9)
                      : const Color(0xffF0787E),
                ),
                child: Text(
                  "Operation",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w400,
                    color: value.isAppointment
                        ? const Color(0xff343434)
                        : const Color(0xffFFFFFF),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
