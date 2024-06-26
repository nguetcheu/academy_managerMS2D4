import 'dart:convert';
import 'package:academy_manager/Model/enseignant_model.dart';
import 'package:academy_manager/const/colors.dart';
import 'package:academy_manager/const/connexion.dart';
import 'package:academy_manager/views/EditEnseignantPage%20.dart';
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
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _refreshEnseignants(); // Chargement initial des enseignants
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
      enseignant.phone = e["phone"];
      enseignant.email = e["email"];
      enseignant.annee = e["annee"];
      enseignants.add(enseignant);
    }

    // Filtrer les enseignants en fonction du texte saisi dans le champ de recherche
    String searchTerm = _searchController.text.toLowerCase();
    if (searchTerm.isNotEmpty) {
      enseignants = enseignants.where((enseignant) {
        return (enseignant.nom ?? '').toLowerCase().contains(searchTerm) ||
            (enseignant.prenom ?? '').toLowerCase().contains(searchTerm);
      }).toList();
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Recherche par nom',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (_) {
                _refreshEnseignants(); // Actualise la liste des enseignants lors de la saisie dans le champ de recherche
              },
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshEnseignants,
              child: FutureBuilder<List<EnseignantModel>>(
                future: _futureEnseignants,
                builder: (BuildContext context,
                    AsyncSnapshot<List<EnseignantModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('Aucune donnée disponible'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final enseignant = snapshot.data![index];
                        return ListTile(
                          leading: const CircleAvatar(
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${enseignant.nom} son email est ${enseignant.email}',
                                ),
                              ),
                            );
                          },
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  _editerEnseignant(enseignant);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  _supprimerEnseignant(context, enseignant.id);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEnseignantForm()),
          ).then((_) {
            _refreshEnseignants();
          });
        },
        backgroundColor: AppColor.primary,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Future<void> _supprimerEnseignant(
      BuildContext context, int? idEnseignant) async {
    var response = await http.delete(
        Uri.parse('${Connection.APP_SERVER}/enseignant/delete/$idEnseignant'));
    if (response.statusCode == 200) {
      _refreshEnseignants();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Échec de la suppression de l\'enseignant'),
        ),
      );
    }
  }

  Future<void> _editerEnseignant(EnseignantModel enseignant) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditEnseignantPage(enseignant: enseignant)),
    );

    if (result == true) {
      _refreshEnseignants();
    }
  }
}
