// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rogisheba/Pages/HomePage/HomeRoot.dart';
import 'package:rogisheba/Pages/Splash%20Screen/Splash.dart';
import 'package:rogisheba/Providers/AuthProvider.dart';
import 'package:rogisheba/Providers/BloodProvider.dart';
import 'package:rogisheba/Providers/ComplainProvider.dart';
import 'package:rogisheba/Providers/DoctorProvider.dart';
import 'package:rogisheba/Providers/HealthTipsProvider.dart';
import 'package:rogisheba/Providers/HistoryProvider.dart';
import 'package:rogisheba/Providers/HomeDrawerProvider.dart';
import 'package:rogisheba/Providers/HospitalProvider.dart';
import 'package:rogisheba/Providers/SearchProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Providers/AddDonatorProvider.dart';
import 'Providers/ProfileProvider.dart';

// Starting Of This Rogi Sheba App
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

// this is App's first class
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int userID = 0;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    // using screen Utils for responsive desing
    return ScreenUtilInit(
      builder: ((context, child) {
        // using provider for better state management.
        return MultiProvider(
          providers: [
            // this provider is for Authentication related state management.
            ChangeNotifierProvider(
              create: (_) => AuthProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => ProfileProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => HealthTipsProvider(),
            ),
            // this provider is for Homepage Drawer related state management.
            ChangeNotifierProvider(
              create: (_) => HomeDrawerProvider(),
            ),
            // this provider is for Search Page related state management.
            ChangeNotifierProvider(
              create: (_) => SearchProvider(),
            ),
            // this provider is for Complain Page related state management.
            ChangeNotifierProvider(
              create: (_) => ComplainProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => DoctorProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => HospitalProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => BloodProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => AddDonatorProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => HistoryProvider(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: isLoading
                ? Scaffold(
                    backgroundColor: Colors.white,
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : userID == 0
                    ? Splash()
                    : HomeRoot(),
          ),
        );
      }),
      // declaring ideal design size.
      designSize: Size(
        360,
        800,
      ),
    );
  }

  void getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getInt('user') == null) {
      userID = 0;
      setState(() {});
    } else {
      userID = prefs.getInt('user') as int;
      setState(() {});
    }
    isLoading = false;
    setState(() {});
  }
}
