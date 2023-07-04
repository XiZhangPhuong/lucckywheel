import 'package:dio/dio.dart';
import 'package:luckywheel/model/techtransfer_response.dart';
import 'package:luckywheel/temp.dart';

class TechTranferRespository{
  final dio = Dio();

  ///
  /// getTranfer
  ///
  Future<void> getTranFer({
    required Function(TechTransFerResponse data) onSucess,
    required Function(dynamic e) onError,
  }) async {
     try{
       final response = await dio.get('https://api.nasa.gov/techtransfer/patent/?engine&api_key=${Temp.APIKEY}');
       if(response.statusCode==200){
          dynamic resuilt  =  response.data;
          onSucess(TechTransFerResponse.fromMap(resuilt));
       }
     }catch(e){
       onError(e);
     }
  }
}