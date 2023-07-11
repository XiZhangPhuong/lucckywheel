import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CacGiaiDauResponse {
   String? name;
   String? code;
   String? emblem;
   String? type;
  CacGiaiDauResponse({
    this.name,
    this.code,
    this.emblem,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'code': code,
      'emblem': emblem,
      'type': type,
    };
  }

  factory CacGiaiDauResponse.fromMap(Map<String, dynamic> map) {
    return CacGiaiDauResponse(
      name: map['name'] != null ? map['name'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
      emblem: map['emblem'] != null ? map['emblem'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CacGiaiDauResponse.fromJson(String source) => CacGiaiDauResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
