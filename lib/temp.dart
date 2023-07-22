import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:xml2json/xml2json.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class Temp {
  static const String APIKEY = 'AdxWlOA2vYhQgmLcgEL0Ob19F6FhdDEoOriYcvAM';
  static const String TOKEN_FOOTBALL = '7a8a48dd83a74abd98e5e0a27f2914f8';

////
  /// convertUtcToVietnamTime
  ///
  static String convertUtcToVietnamTime(String utcDateTime) {
    final utc = DateTime.parse(utcDateTime).toUtc();
    final vietnamTime = utc.add(Duration(hours: 7));

    final format = DateFormat('HH:mm-dd/MM');
    final vietnamTimeFormatted = format.format(vietnamTime);
    return vietnamTimeFormatted;
  }

  ///
  /// convert XML to JSON
  ///
  static convertXmlToJson(String xmlString) {
    final Xml2Json xml2Json = Xml2Json();
    // Load chuỗi XML
    xml2Json.parse(xmlString);
    // Chuyển đổi thành JSON
    final jsonString = xml2Json.toParker();
    return jsonString;
  }

  ///
  /// xử lí hình ảnh
  ///
  static Widget processImage1(
      {required imageUrl, double? height, double? widght, Widget? onLoading}) {
    final String extension = imageUrl.substring(imageUrl.length - 3);

    if (extension.toLowerCase() == 'png') {
      // String svgUrl = imageUrl.replaceAll('.png', '.svg');
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SvgPicture.network(
          imageUrl,
          height: height ?? 80,
          width: widght ?? 150,
          placeholderBuilder: (BuildContext context) =>
              onLoading ?? LoadingIndicator(),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SvgPicture.network(
          imageUrl,
          height: height ?? 80,
          width: widght ?? 150,
          placeholderBuilder: (BuildContext context) =>
              onLoading ?? LoadingIndicator(),
        ),
      );
    }
  }

  static String extractHttpsUrlFromHtml(String html) {
    Document document = parse(html);
    var elements = document.getElementsByTagName('iframe');
    if (elements.isNotEmpty) {
      var iframeElement = elements.first;
      String src = iframeElement.attributes['src'] ?? '';
      if (src.startsWith('https')) {
        return src;
      }
    }
    return '';
  }

///
/// kiểm tra cùng ngày tháng
///
  static bool isToday({required String timeString}) {
    List<String> listConvert = timeString.split("-");
    String time = listConvert[1];
    if(time=='12/08'){
      return true;
    }
   return false;
}
}