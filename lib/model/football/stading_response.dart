import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StadingResponse {
  Filters? filters;
  Area? area;
  Competition? competition;
  Season? season;
  List<Standings>? standings;
  StadingResponse({
    this.filters,
    this.area,
    this.competition,
    this.season,
    this.standings,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'filters': filters?.toMap(),
      'area': area?.toMap(),
      'competition': competition?.toMap(),
      'season': season?.toMap(),
      'standings': standings!.map((x) => x.toMap()).toList(),
    };
  }

  factory StadingResponse.fromMap(Map<String, dynamic> map) {
    return StadingResponse(
      filters: map['filters'] != null
          ? Filters.fromMap(map['filters'] as Map<String, dynamic>)
          : null,
      area: map['area'] != null
          ? Area.fromMap(map['area'] as Map<String, dynamic>)
          : null,
      competition: map['competition'] != null
          ? Competition.fromMap(map['competition'] as Map<String, dynamic>)
          : null,
      season: map['season'] != null
          ? Season.fromMap(map['season'] as Map<String, dynamic>)
          : null,
      standings: map['standings'] != null
          ? List<Standings>.from(
              (map['standings'] as List<dynamic>).map<Standings?>(
                (x) => Standings.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StadingResponse.fromJson(String source) =>
      StadingResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Filters {
  String? season;
  Filters({
    this.season,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'season': season,
    };
  }

  factory Filters.fromMap(Map<String, dynamic> map) {
    return Filters(
      season: map['season'] != null ? map['season'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Filters.fromJson(String source) =>
      Filters.fromMap(json.decode(source) as Map<String, dynamic>);
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

class Season {
  int? id;
  String? startDate;
  String? endDate;
  int? currentMatchday;
  Winner? winner;
  Season({
    this.id,
    this.startDate,
    this.endDate,
    this.currentMatchday,
    this.winner,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'startDate': startDate,
      'endDate': endDate,
      'currentMatchday': currentMatchday,
      'winner': winner?.toMap(),
    };
  }

  factory Season.fromMap(Map<String, dynamic> map) {
    return Season(
      id: map['id'] != null ? map['id'] as int : null,
      startDate: map['startDate'] != null ? map['startDate'] as String : null,
      endDate: map['endDate'] != null ? map['endDate'] as String : null,
      currentMatchday: map['currentMatchday'] != null ? map['currentMatchday'] as int : null,
      winner: map['winner'] != null ? Winner.fromMap(map['winner'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Season.fromJson(String source) => Season.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Winner {
  int? id;
  String? name;
  String? shortName;
  String? tla;
  String? crest;
  String? address;
  String? website;
  int? founded;
  String? clubColors;
  String? venue;
  String? lastUpdated;
  Winner({
    this.id,
    this.name,
    this.shortName,
    this.tla,
    this.crest,
    this.address,
    this.website,
    this.founded,
    this.clubColors,
    this.venue,
    this.lastUpdated,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'shortName': shortName,
      'tla': tla,
      'crest': crest,
      'address': address,
      'website': website,
      'founded': founded,
      'clubColors': clubColors,
      'venue': venue,
      'lastUpdated': lastUpdated,
    };
  }

  factory Winner.fromMap(Map<String, dynamic> map) {
    return Winner(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      shortName: map['shortName'] != null ? map['shortName'] as String : null,
      tla: map['tla'] != null ? map['tla'] as String : null,
      crest: map['crest'] != null ? map['crest'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      website: map['website'] != null ? map['website'] as String : null,
      founded: map['founded'] != null ? map['founded'] as int : null,
      clubColors: map['clubColors'] != null ? map['clubColors'] as String : null,
      venue: map['venue'] != null ? map['venue'] as String : null,
      lastUpdated: map['lastUpdated'] != null ? map['lastUpdated'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Winner.fromJson(String source) => Winner.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Standings {
  String? stage;
  String? type;
  dynamic? group;
  List<Table>? table;
  Standings({
    this.stage,
    this.type,
    this.group,
    this.table,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stage': stage,
      'type': type,
      'group': group,
      'table': table!.map((x) => x.toMap()).toList(),
    };
  }

  factory Standings.fromMap(Map<String, dynamic> map) {
    return Standings(
      stage: map['stage'] != null ? map['stage'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      group: map['group'] != null ? map['group'] as dynamic : null,
      table: map['table'] != null
          ? List<Table>.from(
              (map['table'] as List<dynamic>).map<Table?>(
                (x) => Table.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Standings.fromJson(String source) =>
      Standings.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Table {
  int? position;
  Team? team;
  int? playedGames;
  String? form;
  int? won;
  int? draw;
  int? lost;
  int? points;
  int? goalsFor;
  int? goalsAgainst;
  int? goalDifference;
  Table({
    this.position,
    this.team,
    this.playedGames,
    this.form,
    this.won,
    this.draw,
    this.lost,
    this.points,
    this.goalsFor,
    this.goalsAgainst,
    this.goalDifference,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'position': position,
      'team': team?.toMap(),
      'playedGames': playedGames,
      'form': form,
      'won': won,
      'draw': draw,
      'lost': lost,
      'points': points,
      'goalsFor': goalsFor,
      'goalsAgainst': goalsAgainst,
      'goalDifference': goalDifference,
    };
  }

  factory Table.fromMap(Map<String, dynamic> map) {
    return Table(
      position: map['position'] != null ? map['position'] as int : null,
      team: map['team'] != null
          ? Team.fromMap(map['team'] as Map<String, dynamic>)
          : null,
      playedGames:
          map['playedGames'] != null ? map['playedGames'] as int : null,
      form: map['form'] != null ? map['form'] as String : null,
      won: map['won'] != null ? map['won'] as int : null,
      draw: map['draw'] != null ? map['draw'] as int : null,
      lost: map['lost'] != null ? map['lost'] as int : null,
      points: map['points'] != null ? map['points'] as int : null,
      goalsFor: map['goalsFor'] != null ? map['goalsFor'] as int : null,
      goalsAgainst:
          map['goalsAgainst'] != null ? map['goalsAgainst'] as int : null,
      goalDifference:
          map['goalDifference'] != null ? map['goalDifference'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Table.fromJson(String source) =>
      Table.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Team {
  int? id;
  String? name;
  String? shortName;
  String? tla;
  String? crest;
  Team({
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

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      shortName: map['shortName'] != null ? map['shortName'] as String : null,
      tla: map['tla'] != null ? map['tla'] as String : null,
      crest: map['crest'] != null ? map['crest'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) =>
      Team.fromMap(json.decode(source) as Map<String, dynamic>);
}
