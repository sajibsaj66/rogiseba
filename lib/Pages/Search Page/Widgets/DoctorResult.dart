// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Doctor%20Details/DoctorDetails.dart';
import 'package:rogisheba/Providers/DoctorProvider.dart';
import 'package:url_launcher/url_launcher_string.dart';

// starting of doctor search result page.
class DoctorResult extends StatefulWidget {
  const DoctorResult({super.key});

  @override
  State<DoctorResult> createState() => _DoctorResultState();
}

class _DoctorResultState extends State<DoctorResult> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<DoctorProvider>(context, listen: false);
    provider.getAllDoctor(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorProvider>(
      builder: (context, value, child) {
        return value.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: value.allDoctor.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: 30.w,
                        right: 30.w,
                        bottom: 21.h,
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return DoctorDetails(
                                        doctorID: value
                                            .allDoctor.data![index].doctorId!
                                            .toInt(),
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  imageBox(
                                    value.allDoctor.data![index].doctorPicUrl
                                        .toString(),
                                  ),
                                  SizedBox(width: 15.w),
                                  details(
                                    value.allDoctor.data![index].doctorName
                                        .toString(),
                                    value.allDoctor.data![index].name
                                        .toString(),
                                    "${value.allDoctor.data![index].districtName}, ${value.allDoctor.data![index].divisionName}",
                                  ),
                                ],
                              ),
                            ),
                            options(value.allDoctor.data![index].doctorContactNo
                                .toString())
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

  Widget imageBox(String imageUrl) {
    return Container(
      height: 54.h,
      width: 54.w,
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget details(String doctorName, String category, String location) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          doctorName,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xff000000),
          ),
        ),
        Text(
          category,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xffF0787E),
          ),
        ),
        Text(
          location,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xffCACACA),
          ),
        ),
      ],
    );
  }

  Widget options(String number) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            launchUrlString('tel:$number');
          },
          child: Image.asset(
            "assets/images/contact.png",
            height: 20.h,
            width: 20.w,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(width: 21.w),
        GestureDetector(
          child: Image.asset(
            "assets/images/doctor_logo.png",
            height: 25.h,
            width: 21.15.w,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
