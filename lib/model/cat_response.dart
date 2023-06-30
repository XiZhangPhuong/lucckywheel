import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CatResponse {
  String? id;
  String? name;
  CatResponse({
    this.id,
    this.name,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory CatResponse.fromMap(Map<String, dynamic> map) {
    return CatResponse(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatResponse.fromJson(String source) => CatResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
