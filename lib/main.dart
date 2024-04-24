import 'package:academy_manager/Model/enseignant_model.dart';
import 'package:academy_manager/theme/light_theme.dart';
import 'package:academy_manager/views/page.addenseignant.dart';
import 'package:academy_manager/views/page.enseignant.dart';
import 'package:academy_manager/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting("fr_FR", null).then((_) => runApp(const MyApp()));
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
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      // home: AddEnseignantForm(),
      // home: PageEnseignant(enseignantModel: EnseignantModel(id: 62))
    );
  }
}
