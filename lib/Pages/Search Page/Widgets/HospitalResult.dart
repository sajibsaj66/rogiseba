// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Hospital%20Details/HospitalDetails.dart';
import 'package:rogisheba/Providers/HospitalProvider.dart';
import 'package:url_launcher/url_launcher_string.dart';

// starting of hospital search result page.
class HospitalResult extends StatefulWidget {
  const HospitalResult({super.key});

  @override
  State<HospitalResult> createState() => _HospitalResultState();
}

class _HospitalResultState extends State<HospitalResult> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<HospitalProvider>(context, listen: false);
    provider.getAllHospital(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HospitalProvider>(
      builder: (context, value, child) {
        return value.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: value.allHospital.data!.length,
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
                                      return HospitalDetails(
                                        hospitalID: value.allHospital
                                            .data![index].hospitalId!
                                            .toInt(),
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  imageBox(value
                                      .allHospital.data![index].hospitalPicUrl
                                      .toString()),
                                  SizedBox(width: 15.w),
                                  details(
                                    value.allHospital.data![index].hospitalName
                                        .toString(),
                                    value.allHospital.data![index].name
                                        .toString(),
                                    "${value.allHospital.data![index].districtName}, ${value.allHospital.data![index].divisionName}",
                                  ),
                                ],
                              ),
                            ),
                            options(value
                                .allHospital.data![index].hospitalContactNo
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
          fit: BoxFit.fill,
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
            "assets/images/hospital_logo.png",
            height: 25.h,
            width: 32.93.w,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
