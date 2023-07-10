import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (context, child){

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter BMI',
            theme: ThemeData(

             primaryColor: const Color(0xFF0D2B7A),
              useMaterial3: true,
            ),
            home:  const HomeScreen(),
          );


    });
  }
}
