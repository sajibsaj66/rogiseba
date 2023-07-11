// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Providers/ProfileProvider.dart';

// starting of home ad banner widget.
class HomeAd extends StatelessWidget {
  const HomeAd({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, value, child) {
        return CarouselSlider.builder(
          itemCount: value.homeBanner.data!.length,
          options: CarouselOptions(
            height: 80.h,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            viewportFraction: 1
          ),
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return Container(
              height: 80.h,
              width: 318.w,
             margin: EdgeInsets.symmetric(horizontal: 21.w),
              decoration: const BoxDecoration(
                color: Color(0xffD9D9D9),
              ),
              child: Image.network(
                value.homeBanner.data![itemIndex].bannerImageUrl.toString(),
                fit: BoxFit.fill,
              ),
            );
          },
        );
      },
    );
  }
}
