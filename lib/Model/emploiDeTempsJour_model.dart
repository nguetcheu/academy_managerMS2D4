import 'package:academy_manager/Model/cours_model.dart';
import 'package:intl/intl.dart';

class EmploiDeTempsJourModel {
  DateTime? dateJour;
  Cours? cours1;
  Cours? cours2;
  Cours? cours3;
  Cours? cours4;
  Cours? cours5;
  Cours? cours6;
  Cours? cours7;
  Cours? cours8;

  EmploiDeTempsJourModel(
      {this.dateJour,
      this.cours1,
      this.cours2,
      this.cours3,
      this.cours4,
      this.cours5,
      this.cours6,
      this.cours7,
      this.cours8});

  factory EmploiDeTempsJourModel.fromJson(Map<String, dynamic>? json) {
    return switch (json) {
      {
        "dateJour": String? dateJour,
        "cours1": Map<String, dynamic>? jsonCours1,
        "cours2": Map<String, dynamic>? jsonCours2,
        "cours3": Map<String, dynamic>? jsonCours3,
        "cours4": Map<String, dynamic>? jsonCours4,
        "cours5": Map<String, dynamic>? jsonCours5,
        "cours6": Map<String, dynamic>? jsonCours6,
        "cours7": Map<String, dynamic>? jsonCours7,
        "cours8": Map<String, dynamic>? jsonCours8,
      } =>
        EmploiDeTempsJourModel(
          dateJour: DateFormat("dd-MM-yyyy").parse(dateJour!),
          cours1: Cours.fromJson(jsonCours1),
          cours2: Cours.fromJson(jsonCours2),
          cours3: Cours.fromJson(jsonCours3),
          cours4: Cours.fromJson(jsonCours4),
          cours5: Cours.fromJson(jsonCours5),
          cours6: Cours.fromJson(jsonCours6),
          cours7: Cours.fromJson(jsonCours7),
          cours8: Cours.fromJson(jsonCours8),
        ),
      _ => throw const FormatException(
          "Impossible de charger l'emploi de temps du jour")
    };
  }
}
