part of 'enseignant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnseignantModel _$EnseignantFromJson(Map<String, dynamic> json) {
  return EnseignantModel(
      id: json['id'] as int,
      nom: json['nom'] as String,
      prenom: json['prenom'] as String,
      phone: json['phone'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
      annee: json['annee'] as int);
}

Map<String, dynamic> _$EnseignantToJson(EnseignantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'annee': instance.annee
    };


