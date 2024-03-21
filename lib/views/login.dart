// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:academy_manager/Model/enseignant_model.dart';
import 'package:academy_manager/const/connexion.dart';
import 'package:academy_manager/views/home_page.dart';
import 'package:academy_manager/views/page.enseignant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final Map<String, dynamic> requestBody = {
      'email': _emailController.text,
      'password': _passwordController.text,
    };

    final response = await http.post(Uri.parse(Connection.CONNEXION_ENSEIGNANT),
        headers: Connection.headers, body: jsonEncode(requestBody));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final enseignantData = EnseignantModel.fromJson(responseData);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (enseignantData.role == 'admin') {
        // L'utilisateur est un administrateur, naviguer vers le widget HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        // L'utilisateur n'est pas un administrateur, naviguer vers le widget PageEnseignant normal
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  PageEnseignant(enseignantModel: enseignantData)),
        );
      }
    } else {
      // Erreur lors de la connexion
      print('Connexion échoue');
      // Affichage d'un message d'erreur à l'utilisateur
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Connexion échoué. Pardon vérifier vos identifiants.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Mot de passe'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Connexion'),
            ),
          ],
        ),
      ),
    );
  }
}
