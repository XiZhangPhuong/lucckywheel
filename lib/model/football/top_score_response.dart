import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TopScoreResponse {
  Player? player;
  Team? team;
  int? playedMatches;
  int? goals;
  int? assists;
  int? penalties;
  TopScoreResponse({
    this.player,
    this.team,
    this.playedMatches,
    this.goals,
    this.assists,
    this.penalties,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'player': player?.toMap(),
      'team': team?.toMap(),
      'playedMatches': playedMatches,
      'goals': goals,
      'assists': assists,
      'penalties': penalties,
    };
  }

  factory TopScoreResponse.fromMap(Map<String, dynamic> map) {
    return TopScoreResponse(
      player: map['player'] != null ? Player.fromMap(map['player'] as Map<String,dynamic>) : null,
      team: map['team'] != null ? Team.fromMap(map['team'] as Map<String,dynamic>) : null,
      playedMatches: map['playedMatches'] != null ? map['playedMatches'] as int : null,
      goals: map['goals'] != null ? map['goals'] as int : null,
      assists: map['assists'] != null ? map['assists'] as int : null,
      penalties: map['penalties'] != null ? map['penalties'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TopScoreResponse.fromJson(String source) => TopScoreResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Team {
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
  Team({
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

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      shortName: map['shortName'] != null ? map['shortName'] as String : null,
      tla: map['tla'] != null ? map['tla'] as String : null,
      crest: map['crest'] != null ? map['crest'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      website: map['website'] != null ? map['website'] as String : null,
      founded: map['founded'] != null ? map['founded'] as int : null,
      clubColors:
          map['clubColors'] != null ? map['clubColors'] as String : null,
      venue: map['venue'] != null ? map['venue'] as String : null,
      lastUpdated:
          map['lastUpdated'] != null ? map['lastUpdated'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) =>
      Team.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Player {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? nationality;
  String? section;
  String? lastUpdated;
  Player({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.nationality,
    this.section,
    this.lastUpdated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'nationality': nationality,
      'section': section,
      'lastUpdated': lastUpdated,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      dateOfBirth:
          map['dateOfBirth'] != null ? map['dateOfBirth'] as String : null,
      nationality:
          map['nationality'] != null ? map['nationality'] as String : null,
      section: map['section'] != null ? map['section'] as String : null,
      lastUpdated:
          map['lastUpdated'] != null ? map['lastUpdated'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Player.fromJson(String source) =>
      Player.fromMap(json.decode(source) as Map<String, dynamic>);
}
