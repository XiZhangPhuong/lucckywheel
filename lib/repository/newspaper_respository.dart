import 'package:dio/dio.dart';
import 'package:luckywheel/model/newspaper_response.dart';
import 'package:luckywheel/temp.dart';

class NewSpaperResposiory{
  Dio dio  =  Dio();

  ///
  /// 
  ///
  Future<void> getData({
    String? category,
    required Function(NewSpaperResponse data) onSuccess,
    required Function(dynamic e) onError,
  }) async {
    String url = 'https://vnexpress.net/rss/the-thao.rss';
    try{
      final response = await dio.get(url);
     // final resuilt = Temp.convertXmlToJson(response.data);
      print('vanvanphuong');
     print(response.data);
      
    }catch(e){
      onError(e);
    }
  }
}