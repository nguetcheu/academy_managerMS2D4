import 'package:academy_manager/Model/emploiDeTempsJour_model.dart';

class EmploiDeTempsModel {
  DateTime? dateDebutSemaine;
  DateTime? dateFinSemaine;
  List<EmploiDeTempsJourModel>? emploisDeTempsJour;

  EmploiDeTempsModel({
    this.dateDebutSemaine,
    this.dateFinSemaine,
    this.emploisDeTempsJour,
  });
  factory EmploiDeTempsModel.fromJson(Map<String, dynamic> json) {
    List<EmploiDeTempsJourModel> emploisDeTempsJour = [];
    try {
      for (int i = 0; i < json["emploisDeTempsJour"].length; i++) {
        emploisDeTempsJour.add(
            EmploiDeTempsJourModel.fromJson(json["emploisDeTempsJour"][i]));
      }
      EmploiDeTempsModel emploiDeTempsModel = EmploiDeTempsModel(
        dateDebutSemaine: json["dateDebutSemaine"] as DateTime?,
        dateFinSemaine: json["dateFinSemaine"] as DateTime?,
        emploisDeTempsJour: emploisDeTempsJour,
      );
      return emploiDeTempsModel;
    } catch (e) {
      throw const FormatException("Impossible de charger l'emploi de temps");
    }
  }
}
