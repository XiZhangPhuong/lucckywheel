
import 'package:dio/dio.dart';
import 'package:luckywheel/model/football/cacgiaidau_response.dart';
import 'package:luckywheel/model/football/competitions_response.dart';
import 'package:luckywheel/model/football/stading_response.dart';
import 'package:luckywheel/temp.dart';

class FoodBallRespository {
  Dio dio = Dio();

  final options = Options(headers: {
    'X-Auth-Token': Temp.TOKEN_FOOTBALL,
  });

  ///
  /// Gọi tất cả các trận đấu sắp diễn ra ở Ngoại Hạng Anh
  ///
  Future<void> getAllScheDuledPL({
     String? code,
     String? season,
    required Function(CompetitionsResponse data) onSuccess,
    required Function(dynamic e) onError,
  }) async {
    try {
      final response = await dio.get(
          'https://api.football-data.org/v4/competitions/${code}/matches',
          options: options);
      if (response.statusCode == 200) {
        dynamic resuilt = response.data;
        onSuccess(CompetitionsResponse.fromMap(resuilt));
      }
    } catch (e) {
      onError(e);
    }
  }

  ///
  /// Thống kê bảng xếp hạng mùa giải 2023-2024 Ngoại Hạng Anh
  ///
  Future<void> getStanding({
    String? season,
    String? code,
    required Function(StadingResponse data) onSuccess,
    required Function(dynamic e) onError,
  }) async {
    try {
      final response = await dio.get(
        'https://api.football-data.org/v4/competitions/${code}/standings',
        options: options,
      );
      if (response.statusCode == 200) {
        dynamic resuilt = response.data;
        onSuccess(StadingResponse.fromMap(resuilt));
      }
    } catch (e) {
      onError(e);
    }
  }

  ////
  /// gọi các giải đấu lớn trên thế giới
  ///
  Future<void> getCompetition({
    required Function(List<CacGiaiDauResponse> data) onSuccess,
    required Function(dynamic e) onError,
  }) async {
    try {
      final response = await dio.get(
          'https://api.football-data.org/v4/competitions/',
          options: options);
          if(response.statusCode==200){
            final resuilt = response.data['competitions'] as List<dynamic>;
            onSuccess(resuilt.map((e) => CacGiaiDauResponse.fromMap(e)).toList());
          }
    } catch (e) 
    {
      print(e);
    }
  }
}
