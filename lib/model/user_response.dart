import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserResponse {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;
  
  UserResponse({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address?.toMap(),
      'phone': phone,
      'website': website,
      'company': company?.toMap(),
    };
  }

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      address: map['address'] != null ? Address.fromMap(map['address'] as Map<String,dynamic>) : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      website: map['website'] != null ? map['website'] as String : null,
      company: map['company'] != null ? Company.fromMap(map['company'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponse.fromJson(String source) => UserResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo?.toMap(),
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] != null ? map['street'] as String : null,
      suite: map['suite'] != null ? map['suite'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      zipcode: map['zipcode'] != null ? map['zipcode'] as String : null,
      geo: map['geo'] != null
          ? Geo.fromMap(map['geo'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Geo {
  String? lat;
  String? long;
  Geo({
    this.lat,
    this.long,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'long': long,
    };
  }

  factory Geo.fromMap(Map<String, dynamic> map) {
    return Geo(
      lat: map['lat'] != null ? map['lat'] as String : null,
      long: map['long'] != null ? map['long'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Geo.fromJson(String source) =>
      Geo.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'] != null ? map['name'] as String : null,
      catchPhrase:
          map['catchPhrase'] != null ? map['catchPhrase'] as String : null,
      bs: map['bs'] != null ? map['bs'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source) as Map<String, dynamic>);
}
