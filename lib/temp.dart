import 'dart:math';

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
  static const String APIKEY_BLOGGER = 'AIzaSyClkPA7IDNuoQHM27nTbEJyPIm0AIrcFFM';
  static const String BLOGGER_ID = '5346074296323457457';
  static const String API_KEY_MOVIE = 'c00bdea57d0592fe97feeaace5870900';
  static const List<String> apiKEY_ANIME = [
    '90b9abf2c2msh7458b846d8c0c50p1cf765jsnd38d8ef684d7',
    '11f98101ddmsh90e65654913c333p1fe701jsnebad49b84417',
    'ea8e5d37b4mshb730f6ed3473d21p1d713fjsn874567460efc',
    '78044fe373msh16d923203b1b126p13ac57jsna27e7e74a932',
  ];

  ///
  ///
  ///
  static  int randomIndex({required List<dynamic> data}){
    return Random().nextInt(data.length-1);
  }

  ///
  ///
  ///
  static int indexMovieTrailer({required List<dynamic> data}){
     int index  = 0 ;
     index = data.indexWhere((element) => element['type']=='Trailer');
     return index == -1 ? 0 : index;  
  }

 static String getRandomApiKey(List<String> apiKeyList) {
  if (apiKeyList.isEmpty) {
    throw Exception("Danh sách API key là rỗng.");
  }
  int randomIndex = Random().nextInt(apiKeyList.length);
  return apiKeyList[randomIndex];
}

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
/// image movie db
///
static List<String> imageMovieDB({required String url}){
  List<String> list = [];
  String image1 = 'https://image.tmdb.org/t/p/original/${url}';
  String image2 = 'https://image.tmdb.org/t/p/original/${url}';
  String image3 = 'https://image.tmdb.org/t/p/w500/${url}';
  list.add(image1);
  list.add(image2);
  list.add(image3);
  return list;
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

  ///
  /// convert Vote
  ///
  static String convertVote(dynamic number) {
    return number.toStringAsFixed(1);
  }

}