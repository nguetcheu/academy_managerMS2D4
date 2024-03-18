import 'package:academy_manager/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:academy_manager/views/navbar.dart';

import 'utils/helper.dart';

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: const NavBar(),
          appBar: AppBar(
            title: const Text('Academy Manager'),
            backgroundColor: AppColor.primary,
          ),
          body: Container(
            width: Helper.getScreenWidth(context),
            height: Helper.getScreenHeight(context),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    Helper.getAssetName("logo.png"),
                    height: Helper.getScreenHeight(context) / 2,
                    width: Helper.getScreenWidth(context) / 2,
                  ),
                  const Center(
                    child: Text(
                      "Bienvenue sur Academy Manager",
                      style:
                          TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                    ),
                  ),
                  const Center(
                    child: Text("La référence en gestion d'établissement"),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
