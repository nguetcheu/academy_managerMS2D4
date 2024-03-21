import 'package:academy_manager/Model/enseignant_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final response = await http.post(
      Uri.parse('YOUR_LOGIN_API_ENDPOINT'),
      body: {
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final enseignantData = EnseignantModel.fromJson(response.body as Map<String, dynamic>);
      if (enseignantData.role == 'admin') {
        // L'utilisateur est un administrateur, naviguer vers le widget admin
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminWidget(enseignant: enseignantData)),
        );
      } else {
        // L'utilisateur n'est pas un administrateur, naviguer vers le widget utilisateur normal
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => UserWidget(enseignant: enseignantData)),
        );
      }
    } else {
      // Erreur lors de la connexion
      print('Login failed');
      // Affichage d'un message d'erreur à l'utilisateur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed. Please check your credentials.')),
      );
    }
  }

  Future<void> _register() async {
    final response = await http.post(
      Uri.parse('YOUR_REGISTER_API_ENDPOINT'),
      body: {
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final enseignantData = EnseignantModel.fromJson(response.body as Map<String, dynamic>);
      // Inscription réussie, naviguer vers le widget utilisateur normal
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserWidget(enseignant: enseignantData)),
      );
    } else {
      // Erreur lors de l'inscription
      print('Registration failed');
      // Affichage d'un message d'erreur à l'utilisateur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: _register,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
