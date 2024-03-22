part of 'departement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartementModel _$DepartementFromJson(Map<String, dynamic> json) {
  return DepartementModel(
    id: json['id'] as int,
    nom: json['nom'] as String,
  );
}

Map<String, dynamic> _$DepartementToJson(DepartementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
    };
