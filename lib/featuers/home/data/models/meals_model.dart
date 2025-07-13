import 'package:json_annotation/json_annotation.dart';

part 'meals_model.g.dart';

@JsonSerializable()
class MealsModel {
  final int? id;
  final String title;
  final String? image;
  final double? raite;
  final String? date;
  final String? description;

  MealsModel({
    this.id,
    required this.title,
    this.image,
    this.raite,
    this.date,
    this.description,
  });

  factory MealsModel.fromJson(Map<String, dynamic> json) =>
      _$MealsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealsModelToJson(this);

  Map<String, dynamic> toMap() {
    final map = {
      'title': title,
      'image': image,
      'raite': raite,
      'date': date,
      'description': description,
    };

    return map;
  }

  factory MealsModel.fromMap(Map<String, dynamic> map) {
    return MealsModel(
      id: map['id'],
      title: map['title'],
      image: map['image'],
      raite: map['raite'] != null ? map['raite'] * 1.0 : null,
      date: map['date'],
      description: map['description'],
    );
  }
}
