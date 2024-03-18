import 'package:academy_manager/const/colors.dart';
import 'package:academy_manager/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.secondary)),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
