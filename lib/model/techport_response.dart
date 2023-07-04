import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TechPortResponse {
  String? title; // tiêu đề
  String? benefits; // những lợi ích
  String? description; // sự miêu tả\
  int? startMonth;
  int? startYear;
  int? endMonth;
  int? endYear;
  TechPortResponse({
    this.title,
    this.benefits,
    this.description,
    this.startMonth,
    this.startYear,
    this.endMonth,
    this.endYear,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'benefits': benefits,
      'description': description,
      'startMonth': startMonth,
      'startYear': startYear,
      'endMonth': endMonth,
      'endYear': endYear,
    };
  }

  factory TechPortResponse.fromMap(Map<String, dynamic> map) {
    return TechPortResponse(
      title: map['project']['title'] != null ? map['project']['title'] as String : null,
      benefits: map['project']['benefits'] != null ? map['project']['benefits'] as String : null,
      description: map['project']['description'] != null ? map['project']['description'] as String : null,
      startMonth: map['project']['startMonth'] != null ? map['project']['startMonth'] as int : null,
      startYear: map['project']['startYear'] != null ? map['project']['startYear'] as int : null,
      endMonth: map['project']['endMonth'] != null ? map['project']['endMonth'] as int : null,
      endYear: map['project']['endYear'] != null ? map['project']['endYear'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TechPortResponse.fromJson(String source) => TechPortResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
