import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewSpaperResponse {
   String? version;
  Channel? channel;
  NewSpaperResponse({
    this.version,
    this.channel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'version': version,
      'channel': channel?.toMap(),
    };
  }

  factory NewSpaperResponse.fromMap(Map<String, dynamic> map) {
    return NewSpaperResponse(
      version: map['version'] != null ? map['version'] as String : null,
      channel: map['channel'] != null ? Channel.fromMap(map['channel'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewSpaperResponse.fromJson(String source) => NewSpaperResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Channel {
   String? title;
  String? description;
  Image? image;
  String? pubDate;
  String? generator;
  String? link;
  List<Item>? item;
  Channel({
    this.title,
    this.description,
    this.image,
    this.pubDate,
    this.generator,
    this.link,
    this.item,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'image': image?.toMap(),
      'pubDate': pubDate,
      'generator': generator,
      'link': link,
      'item': item!.map((x) => x.toMap()).toList(),
    };
  }

  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel(
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      image: map['image'] != null ? Image.fromMap(map['image'] as Map<String,dynamic>) : null,
      pubDate: map['pubDate'] != null ? map['pubDate'] as String : null,
      generator: map['generator'] != null ? map['generator'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
      item: map['item'] != null ? List<Item>.from((map['item'] as List<int>).map<Item?>((x) => Item.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Channel.fromJson(String source) => Channel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Image {
  String? url;
  String? title;
  String? link; 
  Image({
    this.url,
    this.title,
    this.link,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'title': title,
      'link': link,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      url: map['url'] != null ? map['url'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Item {
   String? title;
  String? description;
  String? pubDate;
  String? link;
  String? guid;
  String? comments;
  Item({
    this.title,
    this.description,
    this.pubDate,
    this.link,
    this.guid,
    this.comments,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'pubDate': pubDate,
      'link': link,
      'guid': guid,
      'comments': comments,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      pubDate: map['pubDate'] != null ? map['pubDate'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
      guid: map['guid'] != null ? map['guid'] as String : null,
      comments: map['comments'] != null ? map['comments'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
