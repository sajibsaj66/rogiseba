// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Auth%20Screen/Widgets/AuthCustomButton.dart';
import 'package:rogisheba/Providers/AuthProvider.dart';


// creating Login page with specific login features.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // declare some TextEditingController to control login fields.
  late TextEditingController emailController;
  late TextEditingController passController;

  // initialize these controller via init state.
  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

// dispose these controller.
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 41.w,
      ),
      // declare consumer widget for connect Auth Provider with this page.
      child: Consumer<AuthProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              SizedBox(
                height: 63.h,
              ),
              customField(
                "Phone",
                Icons.mail,
                emailController,
                false,
              ),
              SizedBox(
                height: 30.h,
              ),
              customField(
                "Password",
                Icons.lock,
                passController,
                true,
              ),
              SizedBox(
                height: 9.h,
              ),
              GestureDetector(
                child: forgotPass(),
              ),
              value.isLogin
                  ? SizedBox(height: 33.54.h)
                  : SizedBox(height: 26.h),
              GestureDetector(
                onTap: () {
                  value.getLogin(emailController.text.toString(),
                      passController.text.toString(), context);
                },
                child: const AuthCustomButton(),
              )
            ],
          );
        },
      ),
    );
  }

  Widget customField(String hintText, IconData icon,
      TextEditingController controller, bool obsecure) {
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
        controller: controller,
        onChanged: (value) {
          debugPrint(controller.text);
        },
        style: TextStyle(
          fontSize: 15.sp,
          fontFamily: 'custom',
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        obscureText: obsecure,
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 13.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xffCACACA),
          ),
          prefixIcon: Icon(
            icon,
            color: const Color(0xffCACACA),
          ),
        ),
      ),
    );
  }

  Widget forgotPass() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Forgot password?",
          style: TextStyle(
            fontSize: 13.sp,
            fontFamily: 'custom',
            fontWeight: FontWeight.w400,
            color: const Color(0xff0D99FF),
          ),
        ),
      ],
    );
  }
}
