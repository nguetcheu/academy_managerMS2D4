import 'package:academy_manager/Model/emploiDeTempsJour_model.dart';

class EmploiDeTempsModel {
  EmploiDeTempsJourModel? lundi;
  EmploiDeTempsJourModel? mardi;
  EmploiDeTempsJourModel? mercredi;
  EmploiDeTempsJourModel? jeudi;
  EmploiDeTempsJourModel? vendredi;
  EmploiDeTempsJourModel? samedi;
  EmploiDeTempsJourModel? dimanche;

  EmploiDeTempsModel(
      {this.lundi,
      this.mardi,
      this.mercredi,
      this.jeudi,
      this.vendredi,
      this.samedi,
      this.dimanche});

  factory EmploiDeTempsModel.fromJson(Map<String, dynamic>? json) {
    return switch (json) {
      {
        "lundi": Map<String, dynamic>? lundi,
        "mardi": Map<String, dynamic>? mardi,
        "mercredi": Map<String, dynamic>? mercredi,
        "jeudi": Map<String, dynamic>? jeudi,
        "vendredi": Map<String, dynamic>? vendredi,
        "samedi": Map<String, dynamic>? samedi,
        "dimanche": Map<String, dynamic>? dimanche,
      } =>
        EmploiDeTempsModel(
            lundi: EmploiDeTempsJourModel.fromJson(lundi),
            mardi: EmploiDeTempsJourModel.fromJson(mardi),
            mercredi: EmploiDeTempsJourModel.fromJson(mercredi),
            jeudi: EmploiDeTempsJourModel.fromJson(jeudi),
            vendredi: EmploiDeTempsJourModel.fromJson(vendredi),
            samedi: EmploiDeTempsJourModel.fromJson(samedi),
            dimanche: EmploiDeTempsJourModel.fromJson(dimanche)),
      _ => throw const FormatException(
          "Impossible de charger l'emploi de temps de semaine"),
    };
  }
}
