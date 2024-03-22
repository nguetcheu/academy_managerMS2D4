import "dart:core";
import 'package:json_annotation/json_annotation.dart';

part 'departement_model.g.dart';

@JsonSerializable()
class DepartementModel {
  DepartementModel({this.id, this.nom});
  int? id;
  String? nom;

  factory DepartementModel.fromJson(Map<String, dynamic> json) =>
      _$DepartementFromJson(json);
  Map<String, dynamic> toJson() => _$DepartementToJson(this);
}
