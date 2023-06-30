import 'package:dio/dio.dart';
import 'package:luckywheel/model/cat_response.dart';

class CatRepository{
  final dio = Dio();
  ///
  /// get all cat
  ///
  void getAllCat ({
    required Function(List<CatResponse> data) onSucess,
    required Function(dynamic e) onError,
  }) async{
    
     try{
        final response  =  await dio.get('https://api.thecatapi.com/v1/breeds');
        if(response.statusCode==200){
          List<CatResponse> list = (response.data as List).map((e) => CatResponse.fromMap(e as Map<String,dynamic>)).toList();
          onSucess(list); 
        }
     }catch(e){
       onError(e);
     }
  }

  ///
  /// filter cat
  ///
  void filterCat({
    required String filter,
    required Function(String data) onSucess,
    required Function(dynamic e) onError,
  }) async{
     try{
       final response = await dio.get('https://api.thecatapi.com/v1/images/search?breed_ids=${filter}');
       if(response.statusCode==200){
         onSucess(response.data['url'] as String );
       }
     }catch(e){
      onError(e);
     }
  }
}