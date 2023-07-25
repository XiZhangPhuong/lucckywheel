import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class MatchDetailResponse {
  Area? area;
  Competition? competition;
  int? id;
  String? utcDate;
  String? status;
  String? venue;
  int? matchday;
  String? stage;
  String? lastUpdated;
  HomeTeam? homeTeam;
  HomeTeam? awayTeam;
  Score? score;
  Odds? odds;
  List<Referees>? referees;
  MatchDetailResponse({
    this.area,
    this.competition,
    this.id,
    this.utcDate,
    this.status,
    this.venue,
    this.matchday,
    this.stage,
    this.lastUpdated,
    this.homeTeam,
    this.awayTeam,
    this.score,
    this.odds,
    this.referees,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'area': area?.toMap(),
      'competition': competition?.toMap(),
      'id': id,
      'utcDate': utcDate,
      'status': status,
      'venue': venue,
      'matchday': matchday,
      'stage': stage,
      'lastUpdated': lastUpdated,
      'homeTeam': homeTeam?.toMap(),
      'awayTeam': awayTeam?.toMap(),
      'score': score?.toMap(),
      'odds': odds?.toMap(),
      'referees': referees!.map((x) => x.toMap()).toList(),
    };
  }

  factory MatchDetailResponse.fromMap(Map<String, dynamic> map) {
    return MatchDetailResponse(
      area: map['area'] != null ? Area.fromMap(map['area'] as Map<String,dynamic>) : null,
      competition: map['competition'] != null ? Competition.fromMap(map['competition'] as Map<String,dynamic>) : null,
      id: map['id'] != null ? map['id'] as int : null,
      utcDate: map['utcDate'] != null ? map['utcDate'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      venue: map['venue'] != null ? map['venue'] as String : null,
      matchday: map['matchday'] != null ? map['matchday'] as int : null,
      stage: map['stage'] != null ? map['stage'] as String : null,
      lastUpdated: map['lastUpdated'] != null ? map['lastUpdated'] as String : null,
      homeTeam: map['homeTeam'] != null ? HomeTeam.fromMap(map['homeTeam'] as Map<String,dynamic>) : null,
      awayTeam: map['awayTeam'] != null ? HomeTeam.fromMap(map['awayTeam'] as Map<String,dynamic>) : null,
      score: map['score'] != null ? Score.fromMap(map['score'] as Map<String,dynamic>) : null,
      odds: map['odds'] != null ? Odds.fromMap(map['odds'] as Map<String,dynamic>) : null,
      referees: map['referees'] != null ? List<Referees>.from((map['referees'] as List<dynamic>).map<Referees?>((x) => Referees.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MatchDetailResponse.fromJson(String source) => MatchDetailResponse.fromMap(json.decode(source) as Map<String, dynamic>);
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

  factory Area.fromJson(String source) => Area.fromMap(json.decode(source) as Map<String, dynamic>);
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

  factory Competition.fromJson(String source) => Competition.fromMap(json.decode(source) as Map<String, dynamic>);
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

  factory HomeTeam.fromJson(String source) => HomeTeam.fromMap(json.decode(source) as Map<String, dynamic>);
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
      fullTime: map['fullTime'] != null ? FullTime.fromMap(map['fullTime'] as Map<String,dynamic>) : null,
      halfTime: map['halfTime'] != null ? FullTime.fromMap(map['halfTime'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Score.fromJson(String source) => Score.fromMap(json.decode(source) as Map<String, dynamic>);

  Score copyWith({
    String? winner,
    String? duration,
    FullTime? fullTime,
    FullTime? halfTime,
  }) {
    return Score(
      winner: winner ?? this.winner,
      duration: duration ?? this.duration,
      fullTime: fullTime ?? this.fullTime,
      halfTime: halfTime ?? this.halfTime,
    );
  }

  @override
  String toString() {
    return 'Score(winner: $winner, duration: $duration, fullTime: $fullTime, halfTime: $halfTime)';
  }

  @override
  bool operator ==(covariant Score other) {
    if (identical(this, other)) return true;
  
    return 
      other.winner == winner &&
      other.duration == duration &&
      other.fullTime == fullTime &&
      other.halfTime == halfTime;
  }

  @override
  int get hashCode {
    return winner.hashCode ^
      duration.hashCode ^
      fullTime.hashCode ^
      halfTime.hashCode;
  }
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

  factory FullTime.fromJson(String source) => FullTime.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Odds {
   double? homeWin;
  double? draw;
  double? awayWin;
  Odds({
    this.homeWin,
    this.draw,
    this.awayWin,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'homeWin': homeWin,
      'draw': draw,
      'awayWin': awayWin,
    };
  }

  factory Odds.fromMap(Map<String, dynamic> map) {
    return Odds(
      homeWin: map['homeWin'] != null ? map['homeWin'] as double : null,
      draw: map['draw'] != null ? map['draw'] as double : null,
      awayWin: map['awayWin'] != null ? map['awayWin'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Odds.fromJson(String source) => Odds.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Referees {
   int? id;
  String? name;
  String? type;
  String? nationality;
  Referees({
    this.id,
    this.name,
    this.type,
    this.nationality,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'nationality': nationality,
    };
  }

  factory Referees.fromMap(Map<String, dynamic> map) {
    return Referees(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      nationality: map['nationality'] != null ? map['nationality'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Referees.fromJson(String source) => Referees.fromMap(json.decode(source) as Map<String, dynamic>);
}
