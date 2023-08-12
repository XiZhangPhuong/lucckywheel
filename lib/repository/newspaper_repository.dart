import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:luckywheel/model/newspaper_response.dart';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

class NewSpaperRepository {
 
  Dio dio = Dio();


 Future<void> getDataVnPress({
  required String filter,
  required Function(List<RssItem> data) onSuccess,
  required Function(dynamic e) onError,
}) async {
  Dio dio = Dio();
  Xml2Json xml2json = Xml2Json(); 

  try {
    final response = await dio.get('https://vnexpress.net/rss/${filter}');
    if (response.statusCode == 200) {
       final xmlData = response.data;
        final document = XmlDocument.parse(xmlData);

        List<RssItem> newsList = [];

        final items = document.findAllElements('item');
        for (var item in items) {
          RssItem rssItem = RssItem.fromXmlElement(item);
          newsList.add(rssItem);
        }

        onSuccess(newsList);
    }
  } catch (e) {
    onError(e);
  }
}

}




