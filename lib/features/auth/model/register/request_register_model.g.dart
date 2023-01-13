// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestRegisterModel _$RequestRegisterModelFromJson(
        Map<String, dynamic> json) =>
    RequestRegisterModel(
      email: json['email'] as String?,
      name: json['name'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$RequestRegisterModelToJson(
        RequestRegisterModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'password': instance.password,
    };
