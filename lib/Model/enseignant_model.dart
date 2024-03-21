import "dart:core";
import 'package:json_annotation/json_annotation.dart';

part 'enseignant_model.g.dart';

@JsonSerializable()
class EnseignantModel {
  EnseignantModel(
      {this.id,
      this.nom,
      this.prenom,
      this.phone,
      this.email,
      this.password,
      this.role,
      this.annee});
  int? id;
  String? nom;
  String? prenom;
  int? phone;
  String? email;
  String? role;
  String? password;
  int? annee;

  factory EnseignantModel.fromJson(Map<String, dynamic> json) =>
      _$EnseignantFromJson(json);
  Map<String, dynamic> toJson() => _$EnseignantToJson(this);
}
