import 'package:get/get.dart';
import 'package:luckywheel/repository/service_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ServiceController extends GetxController {
  final ServiceRepository _serviceRepository = ServiceRepository();
  // get all service
  List<dynamic> listStore = [];
  int page = 1;
  int limit = 10;
  bool isLoading = false;
  RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
    _getAllSevice();
  }

  ///
  /// get all service
  ///
  Future<void> _getAllSevice() async {
    await _serviceRepository.getAllStore(
      page: page,
      limit: limit,
      onSuccess: (listData) {
        listStore  =  listData;
        isLoading = true;
        update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// onLoadingStore
  ///
  void onLoadingStore(){

  }

  ///
  /// onRefreshingStore
  ///
  void onRefreshingStore(){
    
  }
}
