// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
    )
      ..localId = json['localId'] as int?
      ..isFavorite = json['isFavorite'] as bool?;

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'isFavorite': instance.isFavorite,
      'message': instance.message,
      'token': instance.token,
    };
