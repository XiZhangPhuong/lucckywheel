import 'package:dio/dio.dart';
import 'package:luckywheel/model/football/cacgiaidau_response.dart';
import 'package:luckywheel/model/football/competitions_response.dart';
import 'package:luckywheel/model/football/match_detail_response.dart';
import 'package:luckywheel/model/football/stading_response.dart';
import 'package:luckywheel/model/football/team_responsee.dart';
import 'package:luckywheel/model/football/top_score_response.dart';
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
    int? season,
    required Function(CompetitionsResponse data) onSuccess,
    required Function(dynamic e) onError,
  }) async {
    try {
      final response = await dio.get(
          'https://api.football-data.org/v4/competitions/${code}/matches?&season=${season}',
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
    int? season,
    String? code,
    required Function(StadingResponse data) onSuccess,
    required Function(dynamic e) onError,
  }) async {
    try {
      final response = await dio.get(
        'https://api.football-data.org/v4/competitions/${code}/standings?season=${season}',
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
      if (response.statusCode == 200) {
        final resuilt = response.data['competitions'] as List<dynamic>;
        onSuccess(resuilt.map((e) => CacGiaiDauResponse.fromMap(e)).toList());
      }
    } catch (e) {
      print(e);
    }
  }

  ///
  /// top bàn thắng ngoại hạng Anh theo mùa
  ///
  Future<void> getTopScore({
    int? season,
    int? limit,
    required Function(List<TopScoreResponse> data) onSuccess,
    required Function(dynamic e) onError,
  }) async {
    try{
      final response = await dio.get('http://api.football-data.org/v4/competitions/PL/scorers?season=${season}&limit=${limit}',
      options:  options
      );
      if(response.statusCode==200){
        final resuilt = response.data['scorers'] as List<dynamic>;
        print(resuilt);
        onSuccess(resuilt.map((e) => TopScoreResponse.fromMap(e)).toList());
      }
    }catch(e){
      onError(e);
    }
  }

  ///
  /// chi tiet doi hinh
  ///
  Future<void> detailtTeam({
    required int id,
    required Function(TeamResponse data) onSuccess,
    required Function(dynamic e) onError, 
  }) async {
     try{
       final response = await dio.get('http://api.football-data.org/v4/teams/${id}',options: options);
       if(response.statusCode==200){
        final resuilt = response.data as dynamic;
         onSuccess(TeamResponse.fromMap(resuilt));
       }
     }catch(e){
       onError(e);
     }
  }

  ///
  /// get chi tiết trận đấu by id
  ///
  Future<void> getMatchDetail({
    required int id,
    required Function(MatchDetailResponse data) onSuccess,
    required Function(dynamic e) onError
  }) async {
    try{
       final response = await dio.get('https://api.football-data.org/v4/matches/${id}',options: options);
       if(response.statusCode==200){
         final resuilt = response.data as dynamic;
         onSuccess(MatchDetailResponse.fromMap(resuilt));
       }
    }catch(e){
      onError(e);
    }
  }

  ///
  /// get những trận đấu 2 đội từng gặp nhau
  ///
  Future<void> getH2H({
    required int id,
    required Function(dynamic data) onSuccess,
    required Function(dynamic e) onError,
    
  }) async {
    try{
      final response = await dio.get('http://api.football-data.org/v4/matches/${id}/head2head',options: options);
      if(response.statusCode==200){
        onSuccess(response.data);
      }
    }catch(e){
      onError(e);
    }
  }
}
