import 'package:flutter/material.dart';
import 'package:mad_year4_s1_version2/app/routes/route.dart';
import 'package:mad_year4_s1_version2/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAD Year 4 S1 Version 2',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialRoute: AppRoute.splashScreen,
      onGenerateRoute: AppRoute.onGenerateRoute,
      navigatorKey: AppRoute.key,
    );
  }
}
