import 'package:xml/xml.dart';

class RssItem {
  final String title;
  final String pubDate;
  final String link;
  final String guid;

  RssItem({
    required this.title,
    required this.pubDate,
    required this.link,
    required this.guid,
  });

  factory RssItem.fromXmlElement(XmlElement element) {
    return RssItem(
      title: element.findElements('title').first.text,
      pubDate: element.findElements('pubDate').first.text,
      link: element.findElements('link').first.text,
      guid: element.findElements('guid').first.text,
    );
  }
}
