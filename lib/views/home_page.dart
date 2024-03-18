import 'package:academy_manager/const/colors.dart';
import 'package:academy_manager/views/navbar.dart';
import 'package:flutter/material.dart';

import '../utils/helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text('Academy Manager'),
          backgroundColor: AppColor.primary,
        ),
        body: SizedBox(
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
                    style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                  ),
                ),
                const Center(
                  child: Text("La référence en gestion d'établissement"),
                )
              ],
            ),
          ),
        ));
  }
}
