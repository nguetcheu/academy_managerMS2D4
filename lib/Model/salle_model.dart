class Salle {
  int? id;
  String? numero;
  int? nombrePlace;

  Salle({this.id, this.numero, this.nombrePlace});

  factory Salle.fromJson(Map<String, dynamic>? json) {
    return switch (json) {
      {
        "id": int? id,
        "numero": String? numero,
        "nombrePlace": int? nombrePlace,
      } =>
        Salle(
          id: id,
          numero: numero,
          nombrePlace: nombrePlace,
        ),
      _ => throw const FormatException("Impossible de charger la salle")
    };
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "numero": numero,
      "nombrePlace": nombrePlace,
    };
  }
}
