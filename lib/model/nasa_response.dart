import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NasaResponse {
  String? date;
  String? explanation;
  String? hdurl;
  String? mediaType;
  String? serviceVersion;
  String? title;
  String? url;
  NasaResponse({
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'explanation': explanation,
      'hdurl': hdurl,
      'mediaType': mediaType,
      'serviceVersion': serviceVersion,
      'title': title,
      'url': url,
    };
  }

  factory NasaResponse.fromMap(Map<String, dynamic> map) {
    return NasaResponse(
      date: map['date'] != null ? map['date'] as String : null,
      explanation:
          map['explanation'] != null ? map['explanation'] as String : null,
      hdurl: map['hdurl'] != null ? map['hdurl'] as String : null,
      mediaType: map['mediaType'] != null ? map['mediaType'] as String : null,
      serviceVersion: map['serviceVersion'] != null
          ? map['serviceVersion'] as String
          : null,
      title: map['title'] != null ? map['title'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NasaResponse.fromJson(String source) =>
      NasaResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
