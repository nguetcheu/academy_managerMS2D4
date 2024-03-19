part of 'enseignant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnseignantModel _$EnseignantFromJson(Map<String, dynamic> json) {
  return EnseignantModel(
      id: json['id'] as int,
      nom: json['nom'] as String,
      prenom: json['prenom'] as String,
      tel: json['tel'] as int,
      email: json['email'] as String,
      annee: json['annee'] as int);
}

Map<String, dynamic> _$EnseignantToJson(EnseignantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'tel': instance.tel,
      'email': instance.email,
      'annee': instance.annee
    };
