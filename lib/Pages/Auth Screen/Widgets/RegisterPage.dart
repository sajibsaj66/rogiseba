// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Auth%20Screen/Widgets/AuthCustomButton.dart';
import 'package:rogisheba/Providers/AuthProvider.dart';
import 'package:intl/intl.dart';
import 'package:rogisheba/Utils/BottomBar.dart';

import '../../HomePage/HomeRoot.dart';

// creating Register page with specific Register features.
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // declare some TextEditingController to control Register fields.
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController dateOfBirthController;
  late TextEditingController referCodeController;
  late TextEditingController passController;

  // initialize these controller via init state.
  @override
  void initState() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    dateOfBirthController = TextEditingController();
    referCodeController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  // dispose these controller.

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    dateOfBirthController.dispose();
    referCodeController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 41.w,
      ),
      child: Consumer<AuthProvider>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 48.h,
              ),
              nameField(),
              SizedBox(
                height: 30.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  emailField(),
                  SizedBox(width: 17.w),
                  referCodeField(),
                ],
              ),
              SizedBox(
                height: 27.5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  dateOfBirthField(),
                  SizedBox(width: 17.w),
                  passField()
                ],
              ),
              value.isLogin
                  ? SizedBox(height: 33.54.h)
                  : SizedBox(height: 26.h),
              GestureDetector(
                onTap: () {
                  debugPrint("hello");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (referCodeController.text.isNotEmpty) {
                          if (phoneController.text.length < 11) {
                            BottomBar bottomBar = BottomBar();
                            bottomBar.showSnackBarRed(context,
                                "Phone number must be 11 digit long");
                          } else {
                            if (referCodeController.text.length < 11) {
                              BottomBar bottomBar = BottomBar();
                              bottomBar.showSnackBarRed(context,
                                  "Refer Code must be 11 digit long");
                            } else {
                              value.getRegister(
                                nameController.text,
                                phoneController.text,
                                referCodeController.text,
                                dateOfBirthController.text,
                                passController.text,
                                context,
                              );
                            }
                          }
                        } else {
                          if (phoneController.text.length < 11) {
                            BottomBar bottomBar = BottomBar();
                            bottomBar.showSnackBarRed(
                                context, "Phone number must be 11 digit long");
                          } else {
                            value.getRegister(
                              nameController.text,
                              phoneController.text,
                              "0",
                              dateOfBirthController.text,
                              passController.text,
                              context,
                            );
                          }
                        }
                      },
                      child: const AuthCustomButton(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget nameField() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xffCACACA),
            width: 1.h,
          ),
        ),
      ),
      child: TextField(
        controller: nameController,
        onChanged: (value) {
          debugPrint(nameController.text);
        },
        style: TextStyle(
          fontSize: 15.sp,
          fontFamily: 'custom',
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Name",
          hintStyle: TextStyle(
            fontSize: 13.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xffCACACA),
          ),
          prefixIcon: const Icon(
            Icons.person,
            color: Color(0xffCACACA),
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return Container(
      width: 168.w,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xffCACACA),
            width: 1.h,
          ),
        ),
      ),
      child: TextField(
        controller: phoneController,
        onChanged: (value) {
          debugPrint(phoneController.text);
        },
        style: TextStyle(
          fontSize: 15.sp,
          fontFamily: 'custom',
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Phone",
          hintStyle: TextStyle(
            fontSize: 13.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xffCACACA),
          ),
          prefixIcon: const Icon(
            Icons.mail,
            color: Color(0xffCACACA),
          ),
        ),
      ),
    );
  }

  Widget referCodeField() {
    return Container(
      height: 30.h,
      width: 93.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffCACACA),
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        controller: referCodeController,
        onChanged: (value) {
          debugPrint(referCodeController.text);
        },
        style: TextStyle(
          fontSize: 13.sp,
          fontFamily: 'custom',
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        decoration: InputDecoration(
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Refer code",
            hintStyle: TextStyle(
              fontSize: 13.sp,
              fontFamily: 'custom',
              fontWeight: FontWeight.w400,
              color: const Color(0xffCACACA),
            ),
            contentPadding: EdgeInsets.only(bottom: 13.h)),
      ),
    );
  }

  Widget dateOfBirthField() {
    return Container(
      width: 122.w,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xffCACACA),
            width: 1.h,
          ),
        ),
      ),
      child: TextField(
        controller: dateOfBirthController,
        onTap: () {
          showDate();
        },
        readOnly: true,
        onChanged: (value) {
          debugPrint(dateOfBirthController.text);
        },
        style: TextStyle(
          fontSize: 15.sp,
          fontFamily: 'custom',
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Date of Birth",
          hintStyle: TextStyle(
            fontSize: 13.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xffCACACA),
          ),
          prefixIcon: const Icon(
            Icons.calendar_month,
            color: Color(0xffCACACA),
          ),
        ),
      ),
    );
  }

  Widget passField() {
    return Container(
      width: 139.w,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xffCACACA),
            width: 1.h,
          ),
        ),
      ),
      child: TextField(
        controller: passController,
        onChanged: (value) {
          debugPrint(passController.text);
        },
        style: TextStyle(
          fontSize: 15.sp,
          fontFamily: 'custom',
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Password",
          hintStyle: TextStyle(
            fontSize: 13.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xffCACACA),
          ),
          prefixIcon: const Icon(
            Icons.lock,
            color: Color(0xffCACACA),
          ),
        ),
      ),
    );
  }

  void showDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime(2040),
    ).then(
      (value) => {
        dateOfBirthController.text =
            DateFormat("dd-MM-yyyy").format(value!).toString(),
      },
    );
  }
}
