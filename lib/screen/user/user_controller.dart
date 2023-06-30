import 'package:get/get.dart';
import 'package:luckywheel/model/user_response.dart';
import 'package:luckywheel/repository/user_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  List<UserResponse> listUser = [];
  bool isLoading = false;
  RefreshController refreshController  = RefreshController();
  @override
  void onInit() {
    super.onInit();
    getAllUser();
  }

  ///
  /// getUser
  ///
  Future<void> getAllUser() async {
    _userRepository.getUser(
      onSucess: (data) {
        listUser = data;
        isLoading = true;
        update();
        print(data.length.toString());
      },
      onError: (e) {
        print(e);
      },
    );
  }

  void onReFresh() {
     Future.delayed(Duration(microseconds: 1000));
    getAllUser();
    print('vanvanphuong');
    refreshController.refreshCompleted();
  }

  void onLoading() { 
     Future.delayed(Duration(microseconds: 1000));
     print('le thi thu phuong');
      refreshController.loadComplete();
  }
} 
