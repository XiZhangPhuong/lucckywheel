import 'package:dio/dio.dart';

class ServiceRepository{
  Dio dio = Dio();

  ///
  /// get all store
  ///
  Future<void> getAllStore({
    required int page,
    required int limit,
    required Function(List<dynamic> listData) onSuccess,
    required Function(dynamic e) onError,
  }) async {
    try{
      final response = await dio.get('https://p45bobe.izisoft.io/v1/stores/?page=${page}&limit=${limit}');
      if(response.statusCode==200){
        onSuccess(response.data);
      }
    }catch(e){
       onError(e);
    }
  }
}