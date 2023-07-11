// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoogleMapImage extends StatelessWidget {
  const GoogleMapImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 29.w,
        right: 25.w,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/google_map.jpg",
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
