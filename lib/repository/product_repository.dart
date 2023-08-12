import 'package:dio/dio.dart';

class ProductRepository{
   Dio dio = Dio();

   ///
   /// get all Product
   ///
   Future<void> getAllProduct({
     required Function(List<dynamic> data) onSuccess,
     required Function(dynamic e) onError,
   }) async {
      try{
         final response  = await dio.get('https://hiring-test.stag.tekoapis.net/api/products');
         if(response.statusCode==200){
           onSuccess(response.data);
         }
      }catch(e){
        onError(e);
      }
   }

   ///
   /// get all color
   ///
   
   Future<void> getAllColor({
     required Function(List<dynamic> data) onSuccess,
     required Function(dynamic e) onError,
   }) async {
      try{
         final response  = await dio.get('https://hiring-test.stag.tekoapis.net/api/colors');
         if(response.statusCode==200){
           onSuccess(response.data);
         }
      }catch(e){
        onError(e);
      }
   }
}