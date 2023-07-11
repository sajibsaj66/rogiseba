// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Search%20Page/Widgets/DoctorResult.dart';
import 'package:rogisheba/Pages/Search%20Page/Widgets/HospitalResult.dart';
import 'package:rogisheba/Providers/SearchProvider.dart';

// starting of search page.
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Consumer<SearchProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),

                // calling search field method for search page top view.
                searchField(context),
                SizedBox(
                  height: 15.h,
                ),

                // calling option button method for deciding its Doctor related search or hospital related search.
                optionButtons(context),
                SizedBox(height: 22.h),

                // showing result of dotor or hospital according to bool value which cames from search provider.
                value.isDoctor ? const DoctorResult() : const HospitalResult()
              ],
            );
          },
        ),
      ),
    );
  }

  Widget searchField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: const Color(0xff343434),
              size: 20.sp,
            ),
          ),
          Expanded(
            child: Consumer<SearchProvider>(
              builder: (context, value, child) {
                return TextField(
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff343434),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText:
                        value.isDoctor ? "ডাক্তার খুঁজুন" : "হাসপাতাল খুঁজুন",
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'custom',
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffCACACA),
                    ),
                  ),
                );
              },
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 18.sp,
              color: const Color(0xff343434),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              const AssetImage(
                "assets/images/search_filter.png",
              ),
              size: 18.sp,
            ),
          )
        ],
      ),
    );
  }

  Widget optionButtons(BuildContext context) {
    return Consumer<SearchProvider>(
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
                  color: value.isDoctor
                      ? const Color(0xffF0787E)
                      : const Color(0xffD9D9D9),
                ),
                child: Text(
                  "ডাক্তার",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w400,
                    color: value.isDoctor
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
                  color: value.isDoctor
                      ? const Color(0xffD9D9D9)
                      : const Color(0xffF0787E),
                ),
                child: Text(
                  "হাসপাতাল",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'custom',
                    fontWeight: FontWeight.w400,
                    color: value.isDoctor
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
