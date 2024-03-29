import 'package:academy_manager/const/colors.dart';
import 'package:academy_manager/views/page.admin_enseignant.dart';
import 'package:flutter/material.dart';

import '../utils/helper.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          /*
          Image.asset(
            Helper.getAssetName("logo.png"),
            height: Helper.getScreenHeight(context) / 5,
            width: Helper.getScreenWidth(context) / 5,
          )*/
          UserAccountsDrawerHeader(
            accountName: const Text("Administrateur"),
            accountEmail: const Text("admin@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.asset(Helper.getAssetName("profile.png"))),
            ),
            decoration: const BoxDecoration(
              color: AppColor.primary,
            ),
          ),
          ListTile(
              leading: const Icon(Icons.face_4_sharp),
              title: const Text("Liste des Enseignants"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GetEnseignants()))),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("paramétres"),
            onTap: () => print("Paramétres"),
          )
        ],
      ),
    );
  }
}
