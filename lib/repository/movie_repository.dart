import 'package:dio/dio.dart';
import 'package:luckywheel/temp.dart';

class MovieRepository{
  final dio = Dio();
  final option = Options(
    headers: {
      'X-RapidAPI-Key' : '${Temp.getRandomApiKey(Temp.apiKEY_ANIME)}',
      'X-RapidAPI-Host' : 'anime-db.p.rapidapi.com'
    }
  );

  ///
  /// get all anime page = 1 , size = 10,
  ///
  Future<void> getAllAnime({
    required int page,
    required int size,
    required Function(List<dynamic> resuilt) onSuccess,
    required Function(dynamic e) onError,
  }) async {
     try{
       final response = await dio.get('https://anime-db.p.rapidapi.com/anime?page=${page}&size=${size}',options: option);
       if(response.statusCode==200){
         onSuccess(response.data['data']);
       }
     }catch(e){
       onError(e);
     }
  }

///
/// get all genres
///
Future<void> getAllGenres({
  required Function(List<dynamic> resuilt) onSuccess,
  required Function(dynamic e) onError,
}) async {
  try{
    final response = await dio.get('https://anime-db.p.rapidapi.com/genre',options: option);
    if(response.statusCode==200){
    List<dynamic> data = response.data;
    List<String> listResuit = data.map((e) => e['_id'] as String).toList();
    onSuccess(data);
    }
  }catch(e){
     onError(e);
  }
}  
 
}

