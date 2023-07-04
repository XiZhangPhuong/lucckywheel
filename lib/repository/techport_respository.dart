
import 'package:dio/dio.dart';
import 'package:luckywheel/model/techport_response.dart';
import 'package:luckywheel/temp.dart';

class TechPortRepository{
  Dio dio = Dio();
  ///
  /// get
  ///
  Future<void> getTechPort({
    required Function(TechPortResponse data)onSucess,
    required Function(dynamic e) onError,
  }) async {
  
     try{
       final response = await dio.get('https://api.nasa.gov/techport/api/projects/17792?api_key=${Temp.APIKEY}');
       if(response.statusCode==200){
          final resuilt = TechPortResponse.fromMap(response.data);
        onSucess(resuilt);
       }
     }catch(e){
        onError(e);
     }
  }
}