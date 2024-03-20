import 'dart:convert';
import 'package:academy_manager/Model/enseignant_model.dart';
import 'package:academy_manager/const/colors.dart';
import 'package:academy_manager/const/connexion.dart';
import 'package:academy_manager/views/home_page.dart';
import 'package:academy_manager/views/page.addenseignant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetEnseignants extends StatefulWidget {
  const GetEnseignants({Key? key}) : super(key: key);

  @override
  State<GetEnseignants> createState() => _GetEnseignantsState();
}

class _GetEnseignantsState extends State<GetEnseignants> {
  late Future<List<EnseignantModel>> _futureEnseignants;

  @override
  void initState() {
    super.initState();
    _refreshEnseignants(); // Charge initiale des enseignants
  }

  Future<void> _refreshEnseignants() async {
    setState(() {
      _futureEnseignants = _getEnseignants();
    });
  }

  Future<List<EnseignantModel>> _getEnseignants() async {
    var data = await http.get(Uri.parse(Connection.LIST_ENSEIGNANT));
    var jsonData = json.decode(data.body);

    List<EnseignantModel> enseignants = [];
    for (var e in jsonData) {
      EnseignantModel enseignant = EnseignantModel();
      enseignant.id = e["id"];
      enseignant.nom = e["nom"];
      enseignant.prenom = e["prenom"];
      enseignant.tel = e["tel"];
      enseignant.email = e["email"];
      enseignant.annee = e["annee"];
      enseignants.add(enseignant);
    }
    return enseignants;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des enseignants"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshEnseignants,
        child: FutureBuilder<List<EnseignantModel>>(
          future: _futureEnseignants,
          builder: (BuildContext context,
              AsyncSnapshot<List<EnseignantModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.data == null) {
              return const Center(child: Text('Aucune donées disponible'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final enseignant = snapshot.data![index];
                  return ListTile(
                    leading: const CircleAvatar(
                      // Utilise une icône ou une image représentative si possible
                      child: Icon(Icons.person),
                    ),
                    title: Text(
                      '${enseignant.nom} ${enseignant.prenom}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Ajoute d'autres informations si nécessaire, comme l'adresse e-mail ou le numéro de téléphone
                        Text(
                          'Email: ${enseignant.email}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Année de début: ${enseignant.annee}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // Implémente une action lorsque l'utilisateur appuie sur un enseignant
                      print(
                          "Détails de ${enseignant.nom} ${enseignant.prenom}");
                    },
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEnseignantForm()),
          );
          _refreshEnseignants();
        },
        backgroundColor: AppColor.primary,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
