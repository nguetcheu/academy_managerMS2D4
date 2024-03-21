import 'package:flutter/material.dart';

import '../Model/enseignant_model.dart';

class PageEnseignant extends StatelessWidget {
  final EnseignantModel enseignantModel;

  const PageEnseignant({super.key, required this.enseignantModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enseignant Dashboard'),
      ),
      body: Center(
        child: Text(
            'Bienvenue, ${enseignantModel.email}! Vous etes un enseignant.'),
      ),
    );
  }
}
