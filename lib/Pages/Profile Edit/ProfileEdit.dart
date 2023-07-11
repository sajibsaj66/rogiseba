// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Profile%20Edit/Widgets/ProfileGenderSelector.dart';
import 'package:rogisheba/Providers/AddDonatorProvider.dart';
import 'package:rogisheba/Providers/ProfileProvider.dart';

import 'Widgets/ProfileBloodGroupSelector.dart';
import 'Widgets/ProfileEditTop.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  TextEditingController ageController = TextEditingController();
  TextEditingController pointController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  File? image;
  final picker = ImagePicker();
  bool showSpinner = false;
  @override
  void initState() {
    super.initState();
    // final provider = Provider.of<AddDonatorProvider>(context, listen: false);
    // provider.getAllBloodGroup(context);
    // setValues();
  }

  Future getImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      debugPrint('no image selected');
    }
  }

  void setValues() {
    final provider = Provider.of<ProfileProvider>(context, listen: false);
    if (provider.profile.user![0].userEmail != null) {
      emailController.text = provider.profile.user![0].userEmail!;
    }
    if (provider.profile.user![0].userAge != null) {
      ageController.text = provider.profile.user![0].userAge.toString();
    }
    if (provider.profile.user![0].point != null) {
      pointController.text = provider.profile.user![0].point.toString();
    }
    if (provider.profile.user![0].bloodGroupName != null) {
      final provider2 = Provider.of<AddDonatorProvider>(context, listen: false);
      provider2.hint1 = provider.profile.user![0].bloodGroupName!;
    }
    if (provider.profile.user![0].gender != null) {
      provider.genderText = provider.profile.user![0].gender!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AddDonatorProvider>(
        builder: (context, value, child) {
          return value.isLoading
              ? const Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  backgroundColor: const Color(0xffFFFFFF),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        const ProfileEditTop(),
                        SizedBox(height: 15.h),
                        imageBox(),
                        SizedBox(height: 10.h),
                        setImageButton(),
                        SizedBox(height: 15.h),
                        customText("বয়স লিখুন"),
                        SizedBox(height: 15.h),
                        customTField("বয়স লিখুন", ageController),
                        SizedBox(height: 15.h),
                        customText("ব্লাড গ্রুপ নির্বাচন করুন"),
                        SizedBox(height: 15.h),
                        bloodSelector(),
                        SizedBox(height: 15.h),
                        customText("লিঙ্গ নির্বাচন করুন"),
                        SizedBox(height: 15.h),
                        genderSelector(),
                        SizedBox(height: 15.h),
                        customText("পয়েন্ট লিখুন"),
                        SizedBox(height: 15.h),
                        customTField(
                          "পয়েন্ট লিখুন",
                          pointController,
                        ),
                        SizedBox(height: 15.h),
                        customText("ইমেইল লিখুন"),
                        SizedBox(height: 15.h),
                        customTField(
                          "ইমেইল লিখুন",
                          emailController,
                        ),
                        SizedBox(height: 30.h),
                        editButton(context),
                        SizedBox(
                          height: 350.h,
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  Widget imageBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image != null
            ? Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xffD9D9D9),
                  image: DecorationImage(
                    image: FileImage(
                      File(image!.path).absolute,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Consumer<ProfileProvider>(
                builder: (context, value, child) {
                  return Container(
                    height: 80.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffD9D9D9),
                      image: value.profile.user![0].userProfilePhotoUrl != null
                          ? DecorationImage(
                              image: NetworkImage(
                                value.profile.user![0].userProfilePhotoUrl
                                    .toString(),
                              ),
                            )
                          : const DecorationImage(
                              image: NetworkImage(""),
                            ),
                    ),
                  );
                },
              ),
      ],
    );
  }

  Widget setImageButton() {
    return TextButton(
      onPressed: () {
        getImage();
      },
      child: Text(
        "Upload Image",
        style: GoogleFonts.openSans(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),
      ),
    );
  }

  Widget customText(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w600,
              color: const Color(0xff343434),
            ),
          )
        ],
      ),
    );
  }

  Widget customTField(String title, TextEditingController controller) {
    return Container(
      height: 36.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: const Color(0xffABABAB),
          width: 1.w,
        ),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 14.sp,
          fontFamily: 'custom',
          fontWeight: FontWeight.w600,
          color: const Color(0xff343434),
        ),
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          hintText: title,
          hintStyle: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xffCACACA),
          ),
          contentPadding: EdgeInsets.only(
            left: 18.w,
            bottom: 10.h,
          ),
        ),
      ),
    );
  }

  Widget bloodSelector() {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 36.h,
            width: 300.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                color: const Color(0xffABABAB),
                width: 1.w,
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: ProfileBloodGroupSelector(),
                ),
                Container(
                  height: 35.56.h,
                  width: 35.w,
                  alignment: Alignment.center,
                  color: const Color(0xffABABAB),
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 17.sp,
                    color: const Color(0xff343434),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget genderSelector() {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 36.h,
            width: 300.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                color: const Color(0xffABABAB),
                width: 1.w,
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: ProfileGenderSelector(),
                ),
                Container(
                  height: 35.56.h,
                  width: 35.w,
                  alignment: Alignment.center,
                  color: const Color(0xffABABAB),
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 17.sp,
                    color: const Color(0xff343434),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget editButton(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            value.setProfile(
              image!,
              ageController.text,
              pointController.text,
              emailController.text,
              context,
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
                child: value.isSet
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "Set Profile",
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
      },
    );
  }
}
