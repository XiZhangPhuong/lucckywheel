import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NationResponse {
  Name? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  String? status;
  bool? unMember;
  Currencies? currencies;
  Idd? idd;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  Languages? languages;
  Translations? translations;
  List<double>? latlng;
  bool? landlocked;
  List<String>? borders;
  double? area;
  Demonyms? demonyms;
  String? flag;
  Maps? maps;
  int? population;
  Gini? gini;
  String? fifa;
  Car? car;
  List<String>? timezones;
  List<String>? continents;
  Flags? flags;
  CoatOfArms? coatOfArms;
  String? startOfWeek;
  CapitalInfo? capitalInfo;
  PostalCode? postalCode;
  NationResponse({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.cioc,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.languages,
    this.translations,
    this.latlng,
    this.landlocked,
    this.borders,
    this.area,
    this.demonyms,
    this.flag,
    this.maps,
    this.population,
    this.gini,
    this.fifa,
    this.car,
    this.timezones,
    this.continents,
    this.flags,
    this.coatOfArms,
    this.startOfWeek,
    this.capitalInfo,
    this.postalCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name?.toMap(),
      'tld': tld,
      'cca2': cca2,
      'ccn3': ccn3,
      'cca3': cca3,
      'cioc': cioc,
      'independent': independent,
      'status': status,
      'unMember': unMember,
      'currencies': currencies?.toMap(),
      'idd': idd?.toMap(),
      'capital': capital,
      'altSpellings': altSpellings,
      'region': region,
      'subregion': subregion,
      'languages': languages?.toMap(),
      'translations': translations?.toMap(),
      'latlng': latlng,
      'landlocked': landlocked,
      'borders': borders,
      'area': area,
      'demonyms': demonyms?.toMap(),
      'flag': flag,
      'maps': maps?.toMap(),
      'population': population,
      'gini': gini?.toMap(),
      'fifa': fifa,
      'car': car?.toMap(),
      'timezones': timezones,
      'continents': continents,
      'flags': flags?.toMap(),
      'coatOfArms': coatOfArms?.toMap(),
      'startOfWeek': startOfWeek,
      'capitalInfo': capitalInfo?.toMap(),
      'postalCode': postalCode?.toMap(),
    };
  }

  factory NationResponse.fromMap(Map<String, dynamic> map) {
    return NationResponse(
      name: map['name'] != null ? Name.fromMap(map['name'] as Map<String,dynamic>) : null,
      tld: map['tld'] != null ? List<String>.from((map['tld'] as List<dynamic>)) : null,
      cca2: map['cca2'] != null ? map['cca2'] as String : null,
      ccn3: map['ccn3'] != null ? map['ccn3'] as String : null,
      cca3: map['cca3'] != null ? map['cca3'] as String : null,
      cioc: map['cioc'] != null ? map['cioc'] as String : null,
      independent: map['independent'] != null ? map['independent'] as bool : null,
      status: map['status'] != null ? map['status'] as String : null,
      unMember: map['unMember'] != null ? map['unMember'] as bool : null,
      currencies: map['currencies'] != null ? Currencies.fromMap(map['currencies'] as Map<String,dynamic>) : null,
      idd: map['idd'] != null ? Idd.fromMap(map['idd'] as Map<String,dynamic>) : null,
      capital: map['capital'] != null ? List<String>.from((map['capital'] as List<dynamic>)) : null,
      altSpellings: map['altSpellings'] != null ? List<String>.from((map['altSpellings'] as List<dynamic>)) : null,
      region: map['region'] != null ? map['region'] as String : null,
      subregion: map['subregion'] != null ? map['subregion'] as String : null,
      languages: map['languages'] != null ? Languages.fromMap(map['languages'] as Map<String,dynamic>) : null,
      translations: map['translations'] != null ? Translations.fromMap(map['translations'] as Map<String,dynamic>) : null,
      latlng: map['latlng'] != null ? List<double>.from((map['latlng'] as List<dynamic>)) : null,
      landlocked: map['landlocked'] != null ? map['landlocked'] as bool : null,
      borders: map['borders'] != null ? List<String>.from((map['borders'] as List<dynamic>)) : null,
      area: map['area'] != null ? map['area'] as double : null,
      demonyms: map['demonyms'] != null ? Demonyms.fromMap(map['demonyms'] as Map<String,dynamic>) : null,
      flag: map['flag'] != null ? map['flag'] as String : null,
      maps: map['maps'] != null ? Maps.fromMap(map['maps'] as Map<String,dynamic>) : null,
      population: map['population'] != null ? map['population'] as int : null,
      gini: map['gini'] != null ? Gini.fromMap(map['gini'] as Map<String,dynamic>) : null,
      fifa: map['fifa'] != null ? map['fifa'] as String : null,
      car: map['car'] != null ? Car.fromMap(map['car'] as Map<String,dynamic>) : null,
      timezones: map['timezones'] != null ? List<String>.from((map['timezones'] as List<dynamic>)) : null,
      continents: map['continents'] != null ? List<String>.from((map['continents'] as List<dynamic>)) : null,
      flags: map['flags'] != null ? Flags.fromMap(map['flags'] as Map<String,dynamic>) : null,
      coatOfArms: map['coatOfArms'] != null ? CoatOfArms.fromMap(map['coatOfArms'] as Map<String,dynamic>) : null,
      startOfWeek: map['startOfWeek'] != null ? map['startOfWeek'] as String : null,
      capitalInfo: map['capitalInfo'] != null ? CapitalInfo.fromMap(map['capitalInfo'] as Map<String,dynamic>) : null,
      postalCode: map['postalCode'] != null ? PostalCode.fromMap(map['postalCode'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NationResponse.fromJson(String source) => NationResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}


class Gini {
  double? d2010;
  Gini({
    this.d2010,
  });
  
 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'd2010': d2010,
    };
  }

  factory Gini.fromMap(Map<String, dynamic> map) {
    return Gini(
      d2010: map['d2010'] != null ? map['d2010'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Gini.fromJson(String source) => Gini.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;
  Name({
    this.common,
    this.official,
    this.nativeName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'common': common,
      'official': official,
      'nativeName': nativeName?.toMap(),
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      common: map['common'] != null ? map['common'] as String : null,
      official: map['official'] != null ? map['official'] as String : null,
      nativeName: map['nativeName'] != null
          ? NativeName.fromMap(map['nativeName'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Name.fromJson(String source) =>
      Name.fromMap(json.decode(source) as Map<String, dynamic>);
}

class NativeName {
  Ara? ara;
  NativeName({
    this.ara,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ara': ara?.toMap(),
    };
  }

  factory NativeName.fromMap(Map<String, dynamic> map) {
    return NativeName(
      ara: map['ara'] != null
          ? Ara.fromMap(map['ara'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NativeName.fromJson(String source) =>
      NativeName.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Translations {
  Ara? ara;
  Ara? bre;
  Ara? ces;
  Ara? cym;
  Ara? deu;
  Ara? est;
  Ara? fin;
  Eng? fra;
  Ara? hrv;
  Ara? hun;
  Ara? ita;
  Ara? jpn;
  Ara? kor;
  Ara? nld;
  Ara? per;
  Ara? pol;
  Ara? por;
  Ara? rus;
  Ara? slk;
  Ara? spa;
  Ara? srp;
  Ara? swe;
  Ara? tur;
  Ara? urd;
  Ara? zho;
  Translations({
    this.ara,
    this.bre,
    this.ces,
    this.cym,
    this.deu,
    this.est,
    this.fin,
    this.fra,
    this.hrv,
    this.hun,
    this.ita,
    this.jpn,
    this.kor,
    this.nld,
    this.per,
    this.pol,
    this.por,
    this.rus,
    this.slk,
    this.spa,
    this.srp,
    this.swe,
    this.tur,
    this.urd,
    this.zho,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ara': ara?.toMap(),
      'bre': bre?.toMap(),
      'ces': ces?.toMap(),
      'cym': cym?.toMap(),
      'deu': deu?.toMap(),
      'est': est?.toMap(),
      'fin': fin?.toMap(),
      'fra': fra?.toMap(),
      'hrv': hrv?.toMap(),
      'hun': hun?.toMap(),
      'ita': ita?.toMap(),
      'jpn': jpn?.toMap(),
      'kor': kor?.toMap(),
      'nld': nld?.toMap(),
      'per': per?.toMap(),
      'pol': pol?.toMap(),
      'por': por?.toMap(),
      'rus': rus?.toMap(),
      'slk': slk?.toMap(),
      'spa': spa?.toMap(),
      'srp': srp?.toMap(),
      'swe': swe?.toMap(),
      'tur': tur?.toMap(),
      'urd': urd?.toMap(),
      'zho': zho?.toMap(),
    };
  }

  factory Translations.fromMap(Map<String, dynamic> map) {
    return Translations(
      ara: map['ara'] != null
          ? Ara.fromMap(map['ara'] as Map<String, dynamic>)
          : null,
      bre: map['bre'] != null
          ? Ara.fromMap(map['bre'] as Map<String, dynamic>)
          : null,
      ces: map['ces'] != null
          ? Ara.fromMap(map['ces'] as Map<String, dynamic>)
          : null,
      cym: map['cym'] != null
          ? Ara.fromMap(map['cym'] as Map<String, dynamic>)
          : null,
      deu: map['deu'] != null
          ? Ara.fromMap(map['deu'] as Map<String, dynamic>)
          : null,
      est: map['est'] != null
          ? Ara.fromMap(map['est'] as Map<String, dynamic>)
          : null,
      fin: map['fin'] != null
          ? Ara.fromMap(map['fin'] as Map<String, dynamic>)
          : null,
      fra: map['fra'] != null
          ? Eng.fromMap(map['fra'] as Map<String, dynamic>)
          : null,
      hrv: map['hrv'] != null
          ? Ara.fromMap(map['hrv'] as Map<String, dynamic>)
          : null,
      hun: map['hun'] != null
          ? Ara.fromMap(map['hun'] as Map<String, dynamic>)
          : null,
      ita: map['ita'] != null
          ? Ara.fromMap(map['ita'] as Map<String, dynamic>)
          : null,
      jpn: map['jpn'] != null
          ? Ara.fromMap(map['jpn'] as Map<String, dynamic>)
          : null,
      kor: map['kor'] != null
          ? Ara.fromMap(map['kor'] as Map<String, dynamic>)
          : null,
      nld: map['nld'] != null
          ? Ara.fromMap(map['nld'] as Map<String, dynamic>)
          : null,
      per: map['per'] != null
          ? Ara.fromMap(map['per'] as Map<String, dynamic>)
          : null,
      pol: map['pol'] != null
          ? Ara.fromMap(map['pol'] as Map<String, dynamic>)
          : null,
      por: map['por'] != null
          ? Ara.fromMap(map['por'] as Map<String, dynamic>)
          : null,
      rus: map['rus'] != null
          ? Ara.fromMap(map['rus'] as Map<String, dynamic>)
          : null,
      slk: map['slk'] != null
          ? Ara.fromMap(map['slk'] as Map<String, dynamic>)
          : null,
      spa: map['spa'] != null
          ? Ara.fromMap(map['spa'] as Map<String, dynamic>)
          : null,
      srp: map['srp'] != null
          ? Ara.fromMap(map['srp'] as Map<String, dynamic>)
          : null,
      swe: map['swe'] != null
          ? Ara.fromMap(map['swe'] as Map<String, dynamic>)
          : null,
      tur: map['tur'] != null
          ? Ara.fromMap(map['tur'] as Map<String, dynamic>)
          : null,
      urd: map['urd'] != null
          ? Ara.fromMap(map['urd'] as Map<String, dynamic>)
          : null,
      zho: map['zho'] != null
          ? Ara.fromMap(map['zho'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Translations.fromJson(String source) =>
      Translations.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Ara {
  String? official;
  String? common;
  Ara({
    this.official,
    this.common,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'official': official,
      'common': common,
    };
  }

  factory Ara.fromMap(Map<String, dynamic> map) {
    return Ara(
      official: map['official'] != null ? map['official'] as String : null,
      common: map['common'] != null ? map['common'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ara.fromJson(String source) =>
      Ara.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Currencies {
  JOD? jOD;
  Currencies({
    this.jOD,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jOD': jOD?.toMap(),
    };
  }

  factory Currencies.fromMap(Map<String, dynamic> map) {
    return Currencies(
      jOD: map['jOD'] != null
          ? JOD.fromMap(map['jOD'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Currencies.fromJson(String source) =>
      Currencies.fromMap(json.decode(source) as Map<String, dynamic>);
}

class JOD {
  String? name;
  String? symbol;
  JOD({
    this.name,
    this.symbol,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'symbol': symbol,
    };
  }

  factory JOD.fromMap(Map<String, dynamic> map) {
    return JOD(
      name: map['name'] != null ? map['name'] as String : null,
      symbol: map['symbol'] != null ? map['symbol'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory JOD.fromJson(String source) =>
      JOD.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Idd {
  String? root;
  List<String>? suffixes;
  Idd({
    this.root,
    this.suffixes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'root': root,
      'suffixes': suffixes,
    };
  }

  factory Idd.fromMap(Map<String, dynamic> map) {
    return Idd(
      root: map['root'] != null ? map['root'] as String : null,
      suffixes: map['suffixes'] != null
          ? List<String>.from((map['suffixes'] as List<dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Idd.fromJson(String source) =>
      Idd.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Languages {
  String? ara;
  Languages({
    this.ara,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ara': ara,
    };
  }

  factory Languages.fromMap(Map<String, dynamic> map) {
    return Languages(
      ara: map['ara'] != null ? map['ara'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Languages.fromJson(String source) =>
      Languages.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Demonyms {
  Eng? eng;
  Eng? fra;
  Demonyms({
    this.eng,
    this.fra,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'eng': eng?.toMap(),
      'fra': fra?.toMap(),
    };
  }

  factory Demonyms.fromMap(Map<String, dynamic> map) {
    return Demonyms(
      eng: map['eng'] != null
          ? Eng.fromMap(map['eng'] as Map<String, dynamic>)
          : null,
      fra: map['fra'] != null
          ? Eng.fromMap(map['fra'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Demonyms.fromJson(String source) =>
      Demonyms.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Eng {
  String? f;
  String? m;
  Eng({
    this.f,
    this.m,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'f': f,
      'm': m,
    };
  }

  factory Eng.fromMap(Map<String, dynamic> map) {
    return Eng(
      f: map['f'] != null ? map['f'] as String : null,
      m: map['m'] != null ? map['m'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Eng.fromJson(String source) =>
      Eng.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Maps {
  String? googleMaps;
  String? openStreetMaps;
  Maps({
    this.googleMaps,
    this.openStreetMaps,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'googleMaps': googleMaps,
      'openStreetMaps': openStreetMaps,
    };
  }

  factory Maps.fromMap(Map<String, dynamic> map) {
    return Maps(
      googleMaps:
          map['googleMaps'] != null ? map['googleMaps'] as String : null,
      openStreetMaps: map['openStreetMaps'] != null
          ? map['openStreetMaps'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Maps.fromJson(String source) =>
      Maps.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Car {
  List<String>? signs;
  String? side;
  Car({
    this.signs,
    this.side,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'signs': signs,
      'side': side,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      signs: map['signs'] != null
          ? List<String>.from((map['signs'] as List<dynamic>))
          : null,
      side: map['side'] != null ? map['side'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) =>
      Car.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Flags {
  String? png;
  String? svg;
  String? alt;
  Flags({
    this.png,
    this.svg,
    this.alt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'png': png,
      'svg': svg,
      'alt': alt,
    };
  }

  factory Flags.fromMap(Map<String, dynamic> map) {
    return Flags(
      png: map['png'] != null ? map['png'] as String : null,
      svg: map['svg'] != null ? map['svg'] as String : null,
      alt: map['alt'] != null ? map['alt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Flags.fromJson(String source) =>
      Flags.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CoatOfArms {
  String? png;
  String? svg;
  CoatOfArms({
    this.png,
    this.svg,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'png': png,
      'svg': svg,
    };
  }

  factory CoatOfArms.fromMap(Map<String, dynamic> map) {
    return CoatOfArms(
      png: map['png'] != null ? map['png'] as String : null,
      svg: map['svg'] != null ? map['svg'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoatOfArms.fromJson(String source) =>
      CoatOfArms.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CapitalInfo {
  List<double>? latlng;
  CapitalInfo({
    this.latlng,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latlng': latlng,
    };
  }

  factory CapitalInfo.fromMap(Map<String, dynamic> map) {
    return CapitalInfo(
      latlng: map['latlng'] != null
          ? List<double>.from((map['latlng'] as List<dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CapitalInfo.fromJson(String source) =>
      CapitalInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PostalCode {
  String? format;
  String? regex;
  PostalCode({
    this.format,
    this.regex,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'format': format,
      'regex': regex,
    };
  }

  factory PostalCode.fromMap(Map<String, dynamic> map) {
    return PostalCode(
      format: map['format'] != null ? map['format'] as String : null,
      regex: map['regex'] != null ? map['regex'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostalCode.fromJson(String source) =>
      PostalCode.fromMap(json.decode(source) as Map<String, dynamic>);
}
