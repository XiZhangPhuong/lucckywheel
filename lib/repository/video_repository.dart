import 'package:dio/dio.dart';
import 'package:luckywheel/model/football/video_response.dart';

class VideoRepository {
  Dio dio = Dio();

  ///
  /// get
  ///
  Future<void> getVideo({
    required Function(VideoResponse data) onSuccess,
    required Function(dynamic e) onError,
  }) async {
    try {
      final response = await dio.get(
          'https://www.scorebat.com/video-api/v3/feed/?token=OTQ5MTlfMTY4OTE4MjA2Nl9iMmI2MGQ0YzQwYWI0MmFhZmEyMmY1M2U0NzMyMTQ2ODk0ZjkzYWU5');
      if (response.statusCode == 200) {
        final result = response.data as dynamic;

        onSuccess(VideoResponse.fromMap(result));
      }
    } catch (e) {
      onError(e);
    }
  }
}
