import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TechTransFerResponse {
  List<List<dynamic>>? results;
  int? count;
  int? total;
  int? perpage;
  int? page;
  TechTransFerResponse({
    this.results,
    this.count,
    this.total,
    this.perpage,
    this.page,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'results': results,
      'count': count,
      'total': total,
      'perpage': perpage,
      'page': page,
    };
  }

  factory TechTransFerResponse.fromMap(Map<String, dynamic> map) {
    return TechTransFerResponse(
      results: map['results'] != null
          ? List<List<dynamic>>.from(
              (map['results'] as List<dynamic>).map<List<dynamic>?>((x) => x),
            )
          : null,
      count: map['count'] != null ? map['count'] as int : null,
      total: map['total'] != null ? map['total'] as int : null,
      perpage: map['perpage'] != null ? map['perpage'] as int : null,
      page: map['page'] != null ? map['page'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TechTransFerResponse.fromJson(String source) =>
      TechTransFerResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
