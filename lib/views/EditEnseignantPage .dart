import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:academy_manager/Model/enseignant_model.dart';

import 'package:http/http.dart' as http;
import 'package:academy_manager/const/connexion.dart';

class EditEnseignantPage extends StatefulWidget {
  final EnseignantModel enseignant;

  const EditEnseignantPage({Key? key, required this.enseignant})
      : super(key: key);

  @override
  _EditEnseignantPageState createState() => _EditEnseignantPageState();
}

class _EditEnseignantPageState extends State<EditEnseignantPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nomController;
  late TextEditingController _prenomController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _nomController = TextEditingController(text: widget.enseignant.nom);
    _prenomController = TextEditingController(text: widget.enseignant.prenom);
    _emailController = TextEditingController(text: widget.enseignant.email);
    _phoneController =
        TextEditingController(text: widget.enseignant.phone.toString());
    _dateController =
        TextEditingController(text: widget.enseignant.annee.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Modifier ${widget.enseignant.nom} ${widget.enseignant.prenom}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            key: _formKey,
            children: [
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _prenomController,
                decoration: const InputDecoration(labelText: 'Prénom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le prénom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Téléphone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le numéro de téléphone';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer l\'adresse email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Date de prise de service'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la date de prise de service';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _enregistrerModifications(); // Appel de la fonction pour enregistrer les modifications
                },
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _enregistrerModifications() async {
    final nouveauNom = _nomController.text;
    final nouveauPrenom = _prenomController.text;
    final nouveauPhone = _phoneController.text;
    final nouveauEmail = _emailController.text;
    final nouvelDate = _dateController.text;

    final data = {
      'id': widget.enseignant.id.toString(), // Convertit l'ID en String
      'nom': nouveauNom,
      'prenom': nouveauPrenom,
      'phone': nouveauPhone,
      'email': nouveauEmail,
      'annee': nouvelDate,
    };

    final response = await http.put(
      Uri.parse(
          '${Connection.APP_SERVER}/enseignant/update/${widget.enseignant.id}'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Échec de la mise à jour de l\'enseignant'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _dateController.dispose();
    super.dispose();
  }
}
