// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      author: json['author'] as String?,
      cover: json['cover'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      description: json['description'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      sales: json['sales'] as int?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'cover': instance.cover,
      'createdAt': instance.createdAt?.toIso8601String(),
      'description': instance.description,
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'sales': instance.sales,
      'slug': instance.slug,
    };
