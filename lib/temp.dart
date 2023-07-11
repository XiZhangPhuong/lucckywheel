import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:xml2json/xml2json.dart';
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
static Widget processImage1({ required  imageUrl,double? height,double? widght,Widget? onLoading}) {
  final String extension = imageUrl.substring(imageUrl.length - 3);

  if (extension.toLowerCase() == 'png') {
   // String svgUrl = imageUrl.replaceAll('.png', '.svg');
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: SvgPicture.network(
        imageUrl,
        height: height??80,
        width:widght?? 150,
        placeholderBuilder: (BuildContext context) =>onLoading?? LoadingIndicator(),
        
      ),
    );
  } else  {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: SvgPicture.network(
        imageUrl,
        height:height?? 80,
        width:widght?? 150,
        placeholderBuilder: (BuildContext context) =>onLoading?? LoadingIndicator(),
      ),
    );
  }
}

}
