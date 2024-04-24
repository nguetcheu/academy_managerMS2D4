import 'package:academy_manager/Model/matiere_model.dart';
import 'package:academy_manager/Model/salle_model.dart';

class Cours {
  int? id;
  Matiere? matiere;
  Salle? salle;

  Cours({this.id, this.matiere, this.salle});

  factory Cours.fromJson(Map<String, dynamic>? json) {
    return switch (json) {
      {
        "id": int? id,
        "matiere": Map<String, dynamic>? jsonMatiere,
        "salle": Map<String, dynamic>? jsonSalle,
      } =>
        Cours(
          id: id,
          matiere: Matiere.fromJson(jsonMatiere),
          salle: Salle.fromJson(jsonSalle),
        ),
      null => Cours(),
      _ => throw const FormatException("Impossible de charger la matiere")
    };
  }
}
