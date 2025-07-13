// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsModel _$MealsModelFromJson(Map<String, dynamic> json) => MealsModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      image: json['image'] as String?,
      type: json['type'] as String?,
      date: json['date'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$MealsModelToJson(MealsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'type': instance.type,
      'date': instance.date,
      'description': instance.description,
    };
