// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      url: json['url'] as String?,
    )
      ..localId = json['localId'] as int?
      ..isFavorite = json['isFavorite'] as bool?;

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'isFavorite': instance.isFavorite,
      'url': instance.url,
    };
