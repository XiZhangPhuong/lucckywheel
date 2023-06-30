import 'package:dio/dio.dart';
import 'package:luckywheel/model/nation_response.dart';

class NationRespository{
    Dio dio = Dio();
  //
  /// get all name nation
  ///
  void getAllNameNation(
      {required Function(List<NationResponse> data) onSucess, 
      required Function(dynamic e) onError}) async {
    try {
      final reponse = await dio.get('https://restcountries.com/v3.1/all');
      if(reponse.statusCode==200){
        List<dynamic> listNation = reponse.data as List ;
        onSucess(listNation.map((e) => NationResponse.fromMap(e)).toList());
      }
    } catch (e) {
      onError(e);
    }
  }
}