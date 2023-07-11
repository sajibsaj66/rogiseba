// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/Auth%20Screen/Widgets/AuthTop.dart';
import 'package:rogisheba/Pages/Auth%20Screen/Widgets/LoginPage.dart';
import 'package:rogisheba/Pages/Auth%20Screen/Widgets/RegisterPage.dart';
import 'package:rogisheba/Pages/Auth%20Screen/Widgets/TermsAuth.dart';
import 'package:rogisheba/Providers/AuthProvider.dart';

// starting of Authentication Page.
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // setting background color for whole authentication page.
        backgroundColor: const Color(0xffFFFFFF),
        // declare consumer widget for connect Auth Provider with this page.
        body: Consumer<AuthProvider>(
          builder: (context, value, child) {
            // declare SingleChildScrollView for scrolling feature.
            return SingleChildScrollView(
              child: Column(
                children: [
                  // calling authentication top widget, which includes logo and login or register buttons.
                  const AuthTop(),
                  // checking isLogin value through provider for check its login feature or register feature.
                  value.isLogin ? const LoginPage() : const RegisterPage(),
                  // define sizedbox according to isLogin value.
                  value.isLogin
                      ? SizedBox(height: 40.h)
                      : SizedBox(height: 30.h),
                  // this is for terms and conditions agreement text.
                  const TermsAuth(),
                  SizedBox(height: 50.h),
                  value.isLogin
                      ? SizedBox(
                          height: 100.h,
                        )
                      : SizedBox(height: 140.h)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
