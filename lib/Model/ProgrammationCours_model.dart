class ProgrammationCours {
  DateTime? heureDebutCours;
  DateTime? heureFinCours;
  String? cours;
  String? filiere;
  String? salle;

  ProgrammationCours(
      {this.heureDebutCours,
      this.heureFinCours,
      this.cours,
      this.filiere,
      this.salle});

  factory ProgrammationCours.fromJson(Map<String, dynamic> json) {
    try {
      return ProgrammationCours(
        heureDebutCours: json["heureDebutCours"] as DateTime?,
        heureFinCours: json["heureFinCours"] as DateTime?,
        cours: json["cours"] as String?,
        filiere: json["filiere"] as String?,
        salle: json["salle"] as String?,
      );
    } catch (e) {
      throw const FormatException(
          "Impossible de charger la programmation de cours");
    }
  }
}
