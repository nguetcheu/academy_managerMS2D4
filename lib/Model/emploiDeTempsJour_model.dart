import 'package:academy_manager/Model/ProgrammationCours_model.dart';

class EmploiDeTempsJourModel {
  DateTime? dateJour;
  List<ProgrammationCours>? programmationsCours;
  EmploiDeTempsJourModel({this.dateJour, this.programmationsCours});

  factory EmploiDeTempsJourModel.fromJson(Map<String, dynamic> json) {
    List<ProgrammationCours> programmationsCours = [];
    try {
      for (int i = 0; i < json["programmationsCours"].length; i++) {
        programmationsCours
            .add(ProgrammationCours.fromJson(json["programmationsCours"][i]));
      }
      EmploiDeTempsJourModel emploiDeTempsJour = EmploiDeTempsJourModel(
        dateJour: json["dateJour"] as DateTime?,
        programmationsCours: programmationsCours,
      );
      return emploiDeTempsJour;
    } catch (e) {
      throw const FormatException(
          "Impossible de charger l'emploi de temps de journeé");
    }
  }
}
