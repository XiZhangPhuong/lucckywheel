import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class VideoResponse {
  List<Response>? response;
  VideoResponse({
    this.response,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'response': response!.map((x) => x.toMap()).toList(),
    };
  }

  factory VideoResponse.fromMap(Map<String, dynamic> map) {
    return VideoResponse(
      response: map['response'] != null
          ? List<Response>.from(
              (map['response'] as List<dynamic>).map<Response?>(
                (x) => Response.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoResponse.fromJson(String source) =>
      VideoResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Response {
  String? title;
  String? competition;
  String? matchviewUrl;
  String? competitionUrl;
  String? thumbnail;
  String? date;
  List<Videos>? videos;
  Response({
    this.title,
    this.competition,
    this.matchviewUrl,
    this.competitionUrl,
    this.thumbnail,
    this.date,
    this.videos,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'competition': competition,
      'matchviewUrl': matchviewUrl,
      'competitionUrl': competitionUrl,
      'thumbnail': thumbnail,
      'date': date,
      'videos': videos!.map((x) => x.toMap()).toList(),
    };
  }

  factory Response.fromMap(Map<String, dynamic> map) {
    return Response(
      title: map['title'] != null ? map['title'] as String : null,
      competition:
          map['competition'] != null ? map['competition'] as String : null,
      matchviewUrl:
          map['matchviewUrl'] != null ? map['matchviewUrl'] as String : null,
      competitionUrl: map['competitionUrl'] != null
          ? map['competitionUrl'] as String
          : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      videos: map['videos'] != null
          ? List<Videos>.from(
              (map['videos'] as List<dynamic>).map<Videos?>(
                (x) => Videos.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Response.fromJson(String source) =>
      Response.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Videos {
  String? id;
  String? title;
  String? embed;
  Videos({
    this.id,
    this.title,
    this.embed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'embed': embed,
    };
  }

  factory Videos.fromMap(Map<String, dynamic> map) {
    return Videos(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      embed: map['embed'] != null ? map['embed'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Videos.fromJson(String source) =>
      Videos.fromMap(json.decode(source) as Map<String, dynamic>);
}
