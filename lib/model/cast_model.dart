import 'dart:convert';

List<CastModel> castModelFromJson(String str) =>
    List<CastModel>.from(json.decode(str).map((x) => CastModel.fromJson(x)));

class CastModel {
  Map? person;

  CastModel({required this.person, });

  CastModel.create({ this.person});

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(person: json['person'],);
  }

  // factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  // Map<String, dynamic> toJson() => _$MenuToJson(this);
}
