import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CompetitionsResponse {
  Competition? competition;
  List<Matches>? matches;
  CompetitionsResponse({
    this.competition,
    this.matches,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'competition': competition?.toMap(),
      'matches': matches!.map((x) => x.toMap()).toList(),
    };
  }

  factory CompetitionsResponse.fromMap(Map<String, dynamic> map) {
    return CompetitionsResponse(
      competition: map['competition'] != null
          ? Competition.fromMap(map['competition'] as Map<String, dynamic>)
          : null,
      matches: map['matches'] != null
          ? List<Matches>.from(
              (map['matches'] as List<dynamic>).map<Matches?>(
                (x) => Matches.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompetitionsResponse.fromJson(String source) =>
      CompetitionsResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

 class Competition {
  int? id;
  String? name;
  String? code;
  String? type;
  String? emblem;
  Competition({ 
    this.id,
    this.name,
    this.code,
    this.type,
    this.emblem,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'type': type,
      'emblem': emblem,
    };
  }

  factory Competition.fromMap(Map<String, dynamic> map) {
    return Competition(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      emblem: map['emblem'] != null ? map['emblem'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Competition.fromJson(String source) =>
      Competition.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Matches {
  Area? area;
  Competition? competition;
  int? id;
  String? utcDate;
  String? status;
  int? matchday;
  String? stage;
  String? lastUpdated;
  HomeTeam? homeTeam;
  HomeTeam? awayTeam;
  Score? score;
  Odds? odds;

  Matches({
    this.area,
    this.competition,
    this.id,
    this.utcDate,
    this.status,
    this.matchday,
    this.stage,
    this.lastUpdated,
    this.homeTeam,
    this.awayTeam,
    this.score,
    this.odds,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'area': area?.toMap(),
      'competition': competition?.toMap(),
      'id': id,
      'utcDate': utcDate,
      'status': status,
      'matchday': matchday,
      'stage': stage,
      'lastUpdated': lastUpdated,
      'homeTeam': homeTeam?.toMap(),
      'awayTeam': awayTeam?.toMap(),
      'score': score?.toMap(),
      'odds': odds?.toMap(),
    };
  }

  factory Matches.fromMap(Map<String, dynamic> map) {
    return Matches(
      area: map['area'] != null
          ? Area.fromMap(map['area'] as Map<String, dynamic>)
          : null,
      competition: map['competition'] != null
          ? Competition.fromMap(map['competition'] as Map<String, dynamic>)
          : null,
      id: map['id'] != null ? map['id'] as int : null,
      utcDate: map['utcDate'] != null ? map['utcDate'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      matchday: map['matchday'] != null ? map['matchday'] as int : null,
      stage: map['stage'] != null ? map['stage'] as String : null,
      lastUpdated:
          map['lastUpdated'] != null ? map['lastUpdated'] as String : null,
      homeTeam: map['homeTeam'] != null
          ? HomeTeam.fromMap(map['homeTeam'] as Map<String, dynamic>)
          : null,
      awayTeam: map['awayTeam'] != null
          ? HomeTeam.fromMap(map['awayTeam'] as Map<String, dynamic>)
          : null,
      score: map['score'] != null
          ? Score.fromMap(map['score'] as Map<String, dynamic>)
          : null,
      odds: map['odds'] != null
          ? Odds.fromMap(map['odds'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Matches.fromJson(String source) =>
      Matches.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Area {
  int? id;
  String? name;
  String? code;
  String? flag;
  Area({
    this.id,
    this.name,
    this.code,
    this.flag,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'flag': flag,
    };
  }

  factory Area.fromMap(Map<String, dynamic> map) {
    return Area(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
      flag: map['flag'] != null ? map['flag'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Area.fromJson(String source) =>
      Area.fromMap(json.decode(source) as Map<String, dynamic>);
}



class HomeTeam {
  int? id;
  String? name;
  String? shortName;
  String? tla;
  String? crest;
  HomeTeam({
    this.id,
    this.name,
    this.shortName,
    this.tla,
    this.crest,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'shortName': shortName,
      'tla': tla,
      'crest': crest,
    };
  }

  factory HomeTeam.fromMap(Map<String, dynamic> map) {
    return HomeTeam(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      shortName: map['shortName'] != null ? map['shortName'] as String : null,
      tla: map['tla'] != null ? map['tla'] as String : null,
      crest: map['crest'] != null ? map['crest'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeTeam.fromJson(String source) =>
      HomeTeam.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Score {
  String? winner;
  String? duration;
  FullTime? fullTime;
  FullTime? halfTime;
  Score({
    this.winner,
    this.duration,
    this.fullTime,
    this.halfTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'winner': winner,
      'duration': duration,
      'fullTime': fullTime?.toMap(),
      'halfTime': halfTime?.toMap(),
    };
  }

  factory Score.fromMap(Map<String, dynamic> map) {
    return Score(
      winner: map['winner'] != null ? map['winner'] as String : null,
      duration: map['duration'] != null ? map['duration'] as String : null,
      fullTime: map['fullTime'] != null
          ? FullTime.fromMap(map['fullTime'] as Map<String, dynamic>)
          : null,
      halfTime: map['halfTime'] != null
          ? FullTime.fromMap(map['halfTime'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Score.fromJson(String source) =>
      Score.fromMap(json.decode(source) as Map<String, dynamic>);
}

class FullTime {
  int? home;
  int? away;
  FullTime({
    this.home,
    this.away,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'home': home,
      'away': away,
    };
  }

  factory FullTime.fromMap(Map<String, dynamic> map) {
    return FullTime(
      home: map['home'] != null ? map['home'] as int : null,
      away: map['away'] != null ? map['away'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FullTime.fromJson(String source) =>
      FullTime.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Odds {
  String? msg;
  Odds({
    this.msg,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'msg': msg,
    };
  }

  factory Odds.fromMap(Map<String, dynamic> map) {
    return Odds(
      msg: map['msg'] != null ? map['msg'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Odds.fromJson(String source) =>
      Odds.fromMap(json.decode(source) as Map<String, dynamic>);
}
