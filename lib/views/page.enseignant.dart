import 'package:academy_manager/Model/EmploiDeTemps_model.dart';
import 'package:academy_manager/components/Calendar.dart';
import 'package:academy_manager/services/emploie_de_temps.service.dart';
import 'package:academy_manager/views/login.dart';
import 'package:flutter/material.dart';

import '../Model/enseignant_model.dart';
import 'navbar.dart';

class PageEnseignant extends StatefulWidget {
  final EnseignantModel enseignantModel;

  const PageEnseignant({super.key, required this.enseignantModel});

  @override
  State<StatefulWidget> createState() => _PageEnseignantState();
}

class _PageEnseignantState extends State<PageEnseignant> {
  List<EmploiDeTempsModel> _emploisDeTemps = [];
  EmploiDeTempsService emploiDeTempsService = EmploiDeTempsService();

  @override
  void initState() {
    super.initState();
    _emploisDeTemps = emploiDeTempsService.getEmploisDeTemps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Enseignant Dashboard'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthPage()),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: ListView.builder(
              itemCount: _emploisDeTemps.length,
              itemBuilder: (item, index) {
                return Calendar(emploiDeTemps: _emploisDeTemps[index]);
              }),
        ));
  }
}
