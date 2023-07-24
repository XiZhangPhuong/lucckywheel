import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TeamResponse {
   Area? area;
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
  List<RunningCompetitions>? runningCompetitions;
  Coach? coach;
  List<Squad>? squad;
  String? lastUpdated;
  TeamResponse({
    this.area,
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
    this.runningCompetitions,
    this.coach,
    this.squad,
    this.lastUpdated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'area': area?.toMap(),
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
      'runningCompetitions': runningCompetitions!.map((x) => x.toMap()).toList(),
      'coach': coach?.toMap(),
      'squad': squad!.map((x) => x.toMap()).toList(),
      'lastUpdated': lastUpdated,
    };
  }

  factory TeamResponse.fromMap(Map<String, dynamic> map) {
    return TeamResponse(
      area: map['area'] != null ? Area.fromMap(map['area'] as Map<String,dynamic>) : null,
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
      runningCompetitions: map['runningCompetitions'] != null ? List<RunningCompetitions>.from((map['runningCompetitions'] as List<dynamic>).map<RunningCompetitions?>((x) => RunningCompetitions.fromMap(x as Map<String,dynamic>),),) : null,
      coach: map['coach'] != null ? Coach.fromMap(map['coach'] as Map<String,dynamic>) : null,
      squad: map['squad'] != null ? List<Squad>.from((map['squad'] as List<dynamic>).map<Squad?>((x) => Squad.fromMap(x as Map<String,dynamic>),),) : null,
      lastUpdated: map['lastUpdated'] != null ? map['lastUpdated'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamResponse.fromJson(String source) => TeamResponse.fromMap(json.decode(source) as Map<String, dynamic>);
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

class RunningCompetitions {
    int? id;
  String? name;
  String? code;
  String? type;
  String? emblem;
  RunningCompetitions({
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

  factory RunningCompetitions.fromMap(Map<String, dynamic> map) {
    return RunningCompetitions(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      emblem: map['emblem'] != null ? map['emblem'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RunningCompetitions.fromJson(String source) => RunningCompetitions.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Coach {
    int? id;
  String? firstName;
  String? lastName;
  String? name;
  String? dateOfBirth;
  String? nationality;
  Contract? contract;
  Coach({
    this.id,
    this.firstName,
    this.lastName,
    this.name,
    this.dateOfBirth,
    this.nationality,
    this.contract,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'nationality': nationality,
      'contract': contract?.toMap(),
    };
  }

  factory Coach.fromMap(Map<String, dynamic> map) {
    return Coach(
      id: map['id'] != null ? map['id'] as int : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      dateOfBirth: map['dateOfBirth'] != null ? map['dateOfBirth'] as String : null,
      nationality: map['nationality'] != null ? map['nationality'] as String : null,
      contract: map['contract'] != null ? Contract.fromMap(map['contract'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coach.fromJson(String source) => Coach.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Contract {
    String? start;
  String? until;
  Contract({
    this.start,
    this.until,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'start': start,
      'until': until,
    };
  }

  factory Contract.fromMap(Map<String, dynamic> map) {
    return Contract(
      start: map['start'] != null ? map['start'] as String : null,
      until: map['until'] != null ? map['until'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contract.fromJson(String source) => Contract.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Squad {
    int? id;
  String? name;
  String? position;
  String? dateOfBirth;
  String? nationality;
  Squad({
    this.id,
    this.name,
    this.position,
    this.dateOfBirth,
    this.nationality,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'position': position,
      'dateOfBirth': dateOfBirth,
      'nationality': nationality,
    };
  }

  factory Squad.fromMap(Map<String, dynamic> map) {
    return Squad(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      position: map['position'] != null ? map['position'] as String : null,
      dateOfBirth: map['dateOfBirth'] != null ? map['dateOfBirth'] as String : null,
      nationality: map['nationality'] != null ? map['nationality'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Squad.fromJson(String source) => Squad.fromMap(json.decode(source) as Map<String, dynamic>);
}
