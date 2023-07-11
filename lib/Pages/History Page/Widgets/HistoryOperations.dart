// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Providers/HistoryProvider.dart';

import '../HistoryDetails.dart';

// starting of History body.
class HistoryOperations extends StatelessWidget {
  const HistoryOperations({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(
      builder: (context, value, child) {
        return value.history.operation!.isEmpty
            ? const Center(
                child: Text("No operation history available"),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: value.history.operation!.isEmpty
                      ? 1
                      : value.history.operation!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        bottom: 12.h,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          if (value.history.operation!.isEmpty) {
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HistoryDetails(
                                      patientname: value
                                          .history.operation![index].patientName
                                          .toString(),
                                      patientNumber: value.history
                                          .operation![index].patientNumber
                                          .toString(),
                                      appointMentDate: value.history
                                          .operation![index].operationDate
                                          .toString(),
                                      hospitalName: value.history
                                          .operation![index].hospitalName
                                          .toString(),
                                      doctorName: value
                                          .history.operation![index].doctorName
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
                                  "${index + 1}",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'custom',
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffABABAB),
                                  ),
                                ),
                                SizedBox(width: 21.w),
                                Text(
                                  value.history.operation!.isEmpty
                                      ? "Empty"
                                      : value.history.operation![index]
                                          .operationDate
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
                                  value.history.operation!.isEmpty
                                      ? "Empty"
                                      : value.history.operation![index]
                                          .hospitalName
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
