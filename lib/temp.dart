import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:luckywheel/base/loading.dart';
import 'package:luckywheel/util/color_resources.dart';
import 'package:xml2json/xml2json.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class Temp {
  static const String APIKEY = 'AdxWlOA2vYhQgmLcgEL0Ob19F6FhdDEoOriYcvAM';
  static const String TOKEN_FOOTBALL = 'bf06f621ea86471ca38da14b906baaec';

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
      String svgUrl = imageUrl.replaceAll('.png', '.svg');
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SvgPicture.network(
          svgUrl,
          height: height ?? 50,
          width: widght ?? 50,
          placeholderBuilder: (BuildContext context) =>
              onLoading ?? CircularProgressIndicator(),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SvgPicture.network(imageUrl,
            height: height ?? 50,
            width: widght ?? 50,
            placeholderBuilder: (BuildContext context) =>
                onLoading ?? CircularProgressIndicator()),
      );
    }
  }

  ///
  /// kiểm tra cùng ngày tháng
  ///
  static bool isToday({required String timeString}) {
    List<String> listConvert = timeString.split("-");
    String time = listConvert[1];
    if (time == '12/08') {
      return true;
    }
    return false;
  }


 ///
/// custom ADS
///
static Widget _customADS({String? url}){
  return Container(
    child: CachedNetworkImage(
        imageUrl: url ?? 'https://i.imgur.com/NC96MeM.gif',     
        placeholder: (context, url) => Container(color: ColorResources.BACKGROUND,),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
  );
} 
}