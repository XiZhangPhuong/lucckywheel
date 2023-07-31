import 'package:dio/dio.dart';
import 'package:luckywheel/temp.dart';

class BloggerRepository{
  final dio = Dio();

  ///
  /// lấy tất cả các bài đăng theo blog của người dùng
  ///
  Future<void> getAllPost({
    String? id,
    required Function(List<dynamic> resuilt) onSuccess,
    required Function(dynamic e) onError,
  }) async {
     try{
       final response = await dio.get('https://www.googleapis.com/blogger/v3/blogs/${Temp.BLOGGER_ID}/posts?key=${Temp.APIKEY_BLOGGER}');
       if(response.statusCode==200){
         onSuccess(response.data['items']);
       }
     }catch(e){
        onError(e);
     }
  }

  ///
  /// chi tiết bài đăng
  ///
  Future<void> detailPost({
    required String id,
    required Function(dynamic resuilt) onSuccess,
    required Function(dynamic e) onError,
  }) async {
    try{
      final response = await dio.get('https://www.googleapis.com/blogger/v3/blogs/${Temp.BLOGGER_ID}/posts/${id}?key=${Temp.APIKEY_BLOGGER}');
      if(response.statusCode==200){
        onSuccess(response.data);
      }
    }catch(e){
      onError(e);
    }
  }
}