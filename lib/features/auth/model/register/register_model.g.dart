// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      email: json['email'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    )
      ..localId = json['localId'] as int?
      ..isFavorite = json['isFavorite'] as bool?;

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'isFavorite': instance.isFavorite,
      'email': instance.email,
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
