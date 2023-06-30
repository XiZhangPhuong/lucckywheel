import 'package:dio/dio.dart';
import 'package:luckywheel/model/user_response.dart';

class UserRepository{
  final dio =  Dio();

  ///
  /// get User
  ///

  void getUser({
    required Function(List<UserResponse> data) onSucess,
    required Function(dynamic e) onError,
  }) async{
     try{
       final response = await dio.get('https://jsonplaceholder.typicode.com/users');
       if(response.statusCode==200){
         List<UserResponse> list = (response.data as List).map((e) => UserResponse.fromMap(e as Map<String,dynamic>)).toList();
         onSucess(list);
       }else{
         onError(response.statusCode);
       }
     }catch(e){
       onError(e);
     }
  }
}