class Filiere {
  int? id;
  String? nom;

  Filiere({this.id, this.nom});
  factory Filiere.fromJson(Map<String, dynamic>? json) {
    return switch (json) {
      {
        "id": int? id,
        "nom": String? nom,
      } =>
        Filiere(
          id: id,
          nom: nom,
        ),
      _ => throw const FormatException("Impossible de charger la filiere")
    };
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "nom": nom,
    };
  }
}
