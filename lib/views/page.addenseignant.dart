import 'dart:convert';

import 'package:academy_manager/Model/departement_model.dart';
import 'package:academy_manager/const/connexion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddEnseignantForm extends StatefulWidget {
  @override
  _AddEnseignantFormState createState() => _AddEnseignantFormState();
}

class _AddEnseignantFormState extends State<AddEnseignantForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  late List<DepartementModel> _departments;
  late DepartementModel _selectedDepartment;

  @override
  void initState() {
    super.initState();
    _selectedDepartment = DepartementModel(
        id: -1, nom: ''); // Initialisation avec un departement vide
    _departments = []; // Initialisation de la liste de départements
    _fetchDepartments();
  }

  Future<void> _fetchDepartments() async {
    final response = await http.get(Uri.parse(Connection.LIST_DEPARTEMENT));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      setState(() {
        _departments = jsonData
            .map((item) => DepartementModel(id: item['id'], nom: item['nom']))
            .toList();
        _selectedDepartment = _departments.isNotEmpty
            ? _departments[0]
            : DepartementModel(id: -1, nom: '');
      });
    } else {
      // Handle error
      print('Impossible de récuperer un département');
    }
  }

  Future<void> _addEnseignant(BuildContext context) async {
    if (_departments.isEmpty) {
      print('Liste de départements non initialisée');
      return;
    }

    final Map<String, dynamic> requestBody = {
      'nom': _nomController.text,
      'prenom': _prenomController.text,
      'password': _passwordController.text,
      'phone': _phoneController.text,
      'email': _emailController.text,
      'annee': _dateController.text,
      'departmentId': _selectedDepartment.id,
    };

    final response = await http.post(
      Uri.parse(Connection.SAVE_ENSEIGNANT),
      headers: Connection.headers,
      body: jsonEncode(requestBody),
    );

    // Vérifie la réponse de l'API
    if (response.statusCode == 200) {
      // Affiche un message de succès ou effectue une autre action
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enseignant ajouté avec succès')),
      );
    } else {
      // Affiche un message d'erreur si l'ajout a échoué
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Erreur lors de l\'ajout de l\'enseignant')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajout d\'un enseignant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
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
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(labelText: 'Mot de passe'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le mot de passe';
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
              const SizedBox(height: 16),
              DropdownButtonFormField<DepartementModel>(
                value: _selectedDepartment,
                onChanged: (DepartementModel? value) {
                  setState(() {
                    _selectedDepartment = value!;
                  });
                },
                items: _departments.map((DepartementModel departement) {
                  return DropdownMenuItem<DepartementModel>(
                    value: departement,
                    child: Text(departement.nom),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Département',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.id == -1) {
                    return 'Veuillez sélectionner un département';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _addEnseignant(context);
                  }
                },
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose les contrôleurs de texte
    _nomController.dispose();
    _prenomController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _dateController.dispose();
    super.dispose();
  }
}
