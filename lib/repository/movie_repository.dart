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

///
/// lấy danh phim phổ biến
///
Future<void> getPopularMovie({
  int? page,
  required Function(List<dynamic> data) onSuccess,
  required Function(dynamic e) onError,
}) async {
  try{
    final response  = await dio.get('https://api.themoviedb.org/3/movie/popular?api_key=${Temp.API_KEY_MOVIE}&language=vi-VN&page=${page}');
    if(response.statusCode==200){
      onSuccess(response.data['results']);
    }
  }catch(e){
     onError(e);
  }
}

///
/// lấy danh sách phim xếp hạng hàng đầu
///
Future<void> getTopRatedMovie({
  int? page,
  required Function(List<dynamic> data) onSuccess,
  required Function(dynamic e) onError,
}) async {
  try{
    final response  = await dio.get('https://api.themoviedb.org/3/movie/top_rated?api_key=${Temp.API_KEY_MOVIE}&language=vi-VN&page=${page}');
    if(response.statusCode==200){
      onSuccess(response.data['results']);
    }
  }catch(e){
     onError(e);
  }
}

///
/// lấy danh sách phim đang phát 
///
Future<void> getNowPlaying({
  int? page,
  required Function(List<dynamic> data) onSuccess,
  required Function(dynamic e) onError,
}) async {
  try{
    final response  = await dio.get('https://api.themoviedb.org/3/movie/upcoming?api_key=${Temp.API_KEY_MOVIE}&language=vi-VN&page=${page}');
    if(response.statusCode==200){
      onSuccess(response.data['results']);
    }
  }catch(e){
     onError(e);
  }
}

///
/// chi tiết phim
///
Future<void> getDetailMovie({
  required int id,
  required Function(dynamic data) onSuccess,
  required Function(dynamic e) onError,
}) async {
  try{
    final response = await dio.get('https://api.themoviedb.org/3/tv/${id}?api_key=${Temp.API_KEY_MOVIE}&append_to_response=videos&language=vi-VN');
    if(response.statusCode==200){
      onSuccess(response.data);
    }
  }catch(e){
    onError(e);
  }
}

///
/// lấy danh sách movie trending theo tuần
///
Future<void> getTrendingMovieByWeek({
   required int page,
   String? language,
   required Function(List<dynamic> data) onSuccess,
   required Function(dynamic e) onError,
}) async {

  try{
     final response = await dio.get('https://api.themoviedb.org/3/trending/movie/week?language=vi-VN&api_key=${Temp.API_KEY_MOVIE}&page=${page}');
     if(response.statusCode==200){
       onSuccess(response.data['results']);
     }
  }catch(e){
     onError(e);
  }
}

///
/// lấy danh sách tv show trending theo tuần
///
Future<void> getTrendingTVByWeek({
   required int page,
   String? language,
   required Function(List<dynamic> data) onSuccess,
   required Function(dynamic e) onError,
}) async {

  try{
     final response = await dio.get('https://api.themoviedb.org/3/trending/tv/week?language=vi-VN&api_key=${Temp.API_KEY_MOVIE}&page=${page}');
     if(response.statusCode==200){
       onSuccess(response.data['results']);
     }
  }catch(e){
     onError(e);
  }
}

///
/// lấy danh sách chương trình phat sóng hôm nay  
///
Future<void> getAiringToday({
   required int page,
   String? language,
   required Function(List<dynamic> data) onSuccess,
   required Function(dynamic e) onError,
}) async {

  try{
     final response = await dio.get('https://api.themoviedb.org/3/tv/airing_today?language=vi-VN&api_key=${Temp.API_KEY_MOVIE}&page=${page}');
     if(response.statusCode==200){
       onSuccess(response.data['results']);
     }
  }catch(e){
     onError(e);
  }
}

///
/// lấy danh sách tất cả các diễn viên của phim 
///
Future<void> getPoformerMovie({
  required int id,
  required Function(List<dynamic> data) onSuccess,
  required Function(dynamic e) onError,
}) async {
  try{
    final response = await dio.get('http://api.themoviedb.org/3/movie/${id}/casts?api_key=${Temp.API_KEY_MOVIE}');
    if(response.statusCode==200){
      onSuccess(response.data['cast']);
    }
  }catch(e){
    onError(e);
  }
}

///
/// lấy tấy cả video của phim
///
Future<void> getAllVideoMovie({
   required int id,
   required String media_type,
   required Function(List<dynamic> data) onSuccess,
   required Function(dynamic e) onError,
}) async {
   try{ 
      final response = await dio.get('https://api.themoviedb.org/3/${media_type}/${id}/videos?api_key=${Temp.API_KEY_MOVIE}');
      if(response.statusCode==200){
        onSuccess(response.data['results']);
      }
   }catch(e){
      onError(e);
   }
}

///
/// lấy danh sách tương tự của phim
///
 Future<void> getSimilarMovie({
  required int id,
  required Function(List<dynamic> data) onSuccess,
  required Function(dynamic e) onError,
 }) async {
   try{
     final response = await dio.get('https://api.themoviedb.org/3/movie/${id}/similar?api_key=${Temp.API_KEY_MOVIE}&language=vi-VN&page=1');
     if(response.statusCode==200){
      onSuccess(response.data['results']);
     }
   }catch(e){
     onError(e);
   }
 }
}

