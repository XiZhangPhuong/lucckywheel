import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/model/nasa_response.dart';
import 'package:luckywheel/temp.dart';

class NasaRepository {
  Dio dio = Dio();

  ///
  /// get nasa response
  ///
  void getNasaResponse({
    String? date,
    required Function(NasaResponse data) onSucess,
    required Function(dynamic e) onError,
  }) async {
    try {
      String url =
          'https://api.nasa.gov/planetary/apod?api_key=${Temp.APIKEY}';
      if (!Validate.nullOrEmpty(date)) {
        url =
            'https://api.nasa.gov/planetary/apod?api_key=${Temp.APIKEY}&date=${date}';
      }
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final data = NasaResponse.fromMap(response.data);
        onSucess(data);
      }
    } catch (e) {
      onError(e);
    }
  }

  ///
  /// get all name nation
  ///
  void getAllNameNation(
      {required Function(List<String> data) onSucess,
      required Function(dynamic e) onError}) async {
    try {
      final reponse = await dio.get('https://restcountries.com/v3.1/all');
      if (reponse.statusCode == 200) {
        List<dynamic> listRes = reponse.data;
        List<String> list = [];
        for (final i in listRes) {
          list.add(i['name']['common']);
        }
        onSucess(list);
      }
    } catch (e) {
      onError(e);
    }
  }
}
