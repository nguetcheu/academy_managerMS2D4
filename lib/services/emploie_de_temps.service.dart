import 'package:academy_manager/Model/EmploiDeTemps_model.dart';
import 'package:academy_manager/const/connexion.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

class EmploiDeTempsService {
  Future<List<EmploiDeTempsModel>> getEmploisDeTemps(int idEnseignant) async {
    final response = await http.get(
      Uri.parse(
        Connection.listEmploisDetempEnseignantUrl(idEnseignant),
      ),
    );
    if (response.statusCode == 200) {
      List emploisDeTempsJson = jsonDecode(response.body) as List;
      return emploisDeTempsJson
          .map((elt) => EmploiDeTempsModel.fromJson(elt))
          .toList();
    } else {
      throw Exception("La récupération des données a echouée");
    }
  }

  Future<List<EmploiDeTempsModel>> getEmploisDeTempsSemaine(
      int idEnseignant, int numeroSemaine) async {
    final response = await http.get(
      Uri.parse(
        Connection.getEmploisDetempEnseignantParSemaineUrl(
            idEnseignant, numeroSemaine),
      ),
    );
    if (response.statusCode == 200) {
      List emploisDeTempsJson = jsonDecode(response.body) as List;
      return emploisDeTempsJson
          .map((elt) => EmploiDeTempsModel.fromJson(elt))
          .toList();
    } else {
      throw Exception("La récupération des données a echouée");
    }
  }
}
