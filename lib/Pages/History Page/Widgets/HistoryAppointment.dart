// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/History%20Page/HistoryDetails.dart';
import 'package:rogisheba/Providers/HistoryProvider.dart';

// starting of History body.
class HistoryAppointment extends StatelessWidget {
  const HistoryAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(
      builder: (context, value, child) {
        return value.history.appoinment!.isEmpty
            ? const Center(
                child: Text("No appointment history available"),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: value.history.appoinment!.isEmpty
                      ? 1
                      : value.history.appoinment!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        bottom: 12.h,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          if (value.history.appoinment!.isEmpty) {
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HistoryDetails(
                                      patientname: value.history
                                          .appoinment![index].patientName
                                          .toString(),
                                      patientNumber: value.history
                                          .appoinment![index].patientNumber
                                          .toString(),
                                      appointMentDate: value.history
                                          .appoinment![index].appointmentDate
                                          .toString(),
                                      hospitalName: value.history
                                          .appoinment![index].hospitalName
                                          .toString(),
                                      doctorName: value
                                          .history.appoinment![index].doctorName
                                          .toString());
                                },
                              ),
                            );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  value.history.appoinment!.isEmpty
                                      ? "0"
                                      : value
                                          .history.appoinment![index].serialId
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'custom',
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffABABAB),
                                  ),
                                ),
                                SizedBox(width: 21.w),
                                Text(
                                  value.history.appoinment!.isEmpty
                                      ? "Empty"
                                      : value.history.appoinment![index]
                                          .appointmentDate
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'custom',
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffABABAB),
                                  ),
                                ),
                                SizedBox(width: 31.w),
                                Text(
                                  value.history.appoinment!.isEmpty
                                      ? "Empty"
                                      : value
                                          .history.appoinment![index].doctorName
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'custom',
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff343434),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "More",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'custom',
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffABABAB),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
