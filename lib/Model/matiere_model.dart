import 'package:academy_manager/Model/filiere_model.dart';

class Matiere {
  int? id;
  String? intitule;
  int? nombreCredit;
  Filiere? filiere;

  Matiere({this.id, this.intitule, this.nombreCredit, this.filiere});

  factory Matiere.fromJson(Map<String, dynamic>? json) {
    return switch (json) {
      {
        "id": int? id,
        "intitule": String? intitutle,
        "nombreCredit": int? nombreCredit,
        "filiere": Map<String, dynamic>? jsonFiliere,
      } =>
        Matiere(
          id: id,
          intitule: intitutle,
          nombreCredit: nombreCredit,
          filiere: Filiere.fromJson(jsonFiliere),
        ),
      _ => throw const FormatException("Impossible de charger la matiere")
    };
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "intitule": intitule,
      "nombreCredit": nombreCredit,
      "filiere": filiere,
    };
  }
}
