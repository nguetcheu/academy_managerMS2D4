import 'package:academy_manager/const/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [AppColor.primary, AppColor.secondary],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Academy manager",
              style: TextStyle(color: AppColor.primary, fontSize: 35),
            )
          ],
        ),
      ),
    );
  }
}
