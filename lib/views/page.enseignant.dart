import 'package:flutter/material.dart';

import '../Model/enseignant_model.dart';
import 'navbar.dart';

class PageEnseignant extends StatelessWidget {
  final EnseignantModel enseignantModel;

  const PageEnseignant({super.key, required this.enseignantModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Enseignant Dashboard'),
      ),
      body: Center(
        child: Text(
            'Bienvenue, Monsieur ${enseignantModel.nom}, Vous etes un enseignant.'),
      ),
    );
  }
}
