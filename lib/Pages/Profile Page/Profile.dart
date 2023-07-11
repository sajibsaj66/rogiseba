// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Models/ProfileModel.dart';
import 'package:rogisheba/Pages/Profile%20Page/Widgets/ProfileTop.dart';
import 'package:rogisheba/Providers/ProfileProvider.dart';

import '../Profile Edit/ProfileEdit.dart';

// starting Of Profile Page
class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Consumer<ProfileProvider>(
            builder: (context, value, child) {
              ProfileModel profile = value.profile;
              return Column(
                children: [
                  SizedBox(height: 10.h),
                  // this widget is for top view of Profile page.
                  const ProfileTop(),
                  SizedBox(height: 15.h),
                  // this is the rest of profile page.
                  profile.user!.isNotEmpty
                      ? profilePictureRow(
                          "প্রোফাইল ফটো",
                          profile.user![0].userProfilePhotoUrl.toString(),
                        )
                      : profilePictureRow(
                          "Profile Photo Not Given",
                          "Empty",
                        ),
                  SizedBox(height: 21.h),
                  profile.user!.isNotEmpty
                      ? infoRow("নাম", profile.user![0].name.toString(), true)
                      : infoRow("নাম", value.userData[0], true),
                  SizedBox(height: 21.h),
                  profile.user!.isNotEmpty
                      ? infoRow(
                          "বয়স", profile.user![0].userAge.toString(), true)
                      : infoRow("Age Not Given", "Empty", true),
                  SizedBox(height: 21.h),
                  profile.user!.isNotEmpty
                      ? infoRow("ব্লাড গ্রুপ",
                          profile.user![0].bloodGroupName.toString(), true)
                      : infoRow("Blood Group Not Given", "Empty", true),
                  SizedBox(height: 21.h),
                  profile.user!.isNotEmpty
                      ? infoRow(
                          "লিঙ্গ", profile.user![0].gender.toString(), true)
                      : infoRow("Gender Not Given", "Empty", true),
                  SizedBox(height: 21.h),
                  profile.user!.isNotEmpty
                      ? infoRow(
                          "পয়েন্ট", profile.user![0].point.toString(), true)
                      : infoRow("পয়েন্ট", "0", true),
                  SizedBox(height: 21.h),
                  profile.user!.isNotEmpty
                      ? infoRow(
                          "ইমেইল", profile.user![0].userEmail.toString(), true)
                      : infoRow("Email Not Given", "Empty", true),
                  SizedBox(height: 21.h),
                  profile.user!.isNotEmpty
                      ? infoRow("মোবাইল নং",
                          profile.user![0].phoneNumber.toString(), true)
                      : infoRow("মোবাইল নং", value.userData[1], true),
                  SizedBox(height: 30.h),
                  editButton(context)
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget profilePictureRow(String title, String imageUrl) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 34.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff343434),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 38.h,
                    width: 38.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffD9D9D9),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: const Color(0xffD8D8D8),
                    size: 15.sp,
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            height: 1.h,
            color: const Color(0xffD8D8D8),
          ),
        ],
      ),
    );
  }

  Widget infoRow(String title, String title2, bool isArrow) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 34.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: 'custom',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff343434),
                ),
              ),
              Row(
                children: [
                  Text(
                    title2,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'custom',
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffABABAB),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  isArrow
                      ? Icon(
                          Icons.arrow_forward_ios,
                          color: const Color(0xffD8D8D8),
                          size: 15.sp,
                        )
                      : Container(),
                ],
              )
            ],
          ),
          SizedBox(height: 21.h),
          Container(
            width: double.infinity,
            height: 1.h,
            color: const Color(0xffD8D8D8),
          ),
        ],
      ),
    );
  }

  Widget editButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const ProfileEdit();
            },
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 41.h,
            width: 143.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: const Color(0xff0B9444),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.25),
                  offset: const Offset(0, 0),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Text(
              "Edit Profile",
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'custom',
                fontWeight: FontWeight.w600,
                color: const Color(0xffFFFFFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
