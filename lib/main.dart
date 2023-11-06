import 'package:e_commerce_app/UI/HomeScreen.dart';
import 'package:e_commerce_app/UI/Login_Screen.dart';
import 'package:e_commerce_app/UI/Register_Screen.dart';
import 'package:e_commerce_app/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: HomeScreen.routeName,
            routes: {
              LoginScreen.routeName: (context) => LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              HomeScreen.routeName:(context) => HomeScreen()
            },
            theme: AppTheme.mainTheme,
          );
        }
    );
  }
}
