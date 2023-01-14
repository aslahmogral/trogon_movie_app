import 'dart:convert';

List<ShowModel> showModelFromJson(String str) =>
    List<ShowModel>.from(json.decode(str).map((x) => ShowModel.fromJson(x)));

class ShowModel {
  String? name;
  String? summary;
  Map? image;
  Map? rating;

  ShowModel({required this.name, required this.image,required this.rating,required this.summary});

  ShowModel.create({this.name, this.image});

  factory ShowModel.fromJson(Map<String, dynamic> json) {
    return ShowModel(name: json['name'], image: json['image'], rating: json['rating'],summary: json['summary']);
  }

  // factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  // Map<String, dynamic> toJson() => _$MenuToJson(this);
}
