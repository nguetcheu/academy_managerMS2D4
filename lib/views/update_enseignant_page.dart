import 'package:flutter/material.dart';
import 'package:academy_manager/Model/enseignant_model.dart';

class UpdateEnseignantPage extends StatefulWidget {
  final EnseignantModel enseignant;

  const UpdateEnseignantPage({Key? key, required this.enseignant})
      : super(key: key);

  @override
  State<UpdateEnseignantPage> createState() => _UpdateEnseignantPageState();
}

class _UpdateEnseignantPageState extends State<UpdateEnseignantPage> {
  late TextEditingController _nomController;
  late TextEditingController _prenomController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _anneeController;

  @override
  void initState() {
    super.initState();
    _nomController = TextEditingController(text: widget.enseignant.nom);
    _prenomController = TextEditingController(text: widget.enseignant.prenom);
    _emailController = TextEditingController(text: widget.enseignant.email);
    _phoneController = TextEditingController(text: widget.enseignant.phone.toString());
    _anneeController = TextEditingController(text: widget.enseignant.annee.toString());
  }

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _anneeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mise à jour de ${widget.enseignant.nom} ${widget.enseignant.prenom}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _nomController,
              decoration: const InputDecoration(labelText: 'Nom'),
            ),
            TextFormField(
              controller: _prenomController,
              decoration: const InputDecoration(labelText: 'Prénom'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Téléphone'),
            ),
            TextFormField(
              controller: _anneeController,
              decoration: const InputDecoration(labelText: 'Année de début'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Mettez ici la logique pour mettre à jour l'enseignant
                // Utilisez les valeurs dans les contrôleurs de texte (_nomController.text, _prenomController.text, etc.)
                // Appelez une fonction pour effectuer la mise à jour
              },
              child: const Text('Mettre à jour'),
            ),
          ],
        ),
      ),
    );
  }
}
