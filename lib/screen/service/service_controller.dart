import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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

  // get address
  String address = "Loading Address...";
  double lat = 0;
  double long  = 0;
  Position? position;
  bool isLoadingAddress = false;

  @override
  void onInit() {
    super.onInit();
    _getAllSevice();
    _getCurrentLocation();
  }

  ///
  /// get user location
  ///
  Future<void> _getCurrentLocation() async {
    try {
      // Lấy vị trí hiện tại của người dùng
       position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Lấy địa chỉ từ vị trí
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position!.latitude, position!.longitude);
      Placemark place = placemarks[0];
      String currentAddress =
          "${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
     
     address = currentAddress;
     isLoadingAddress = true;
     update();
      
    } catch (e) {
      print(e);
    }
  }

  ///
  /// get all service
  ///
  Future<void> _getAllSevice() async {
    await _serviceRepository.getAllStore(
      page: page,
      limit: limit,
      onSuccess: (listData) {
        listStore.addAll(listData);
        
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
    Future.delayed(Duration(seconds: 1),);
     page++;
     _getAllSevice();
     refreshController.loadComplete();
     update();
  }

  ///
  /// onRefreshingStore
  ///
  void onRefreshingStore(){
    listStore.clear();
    page = 1;
    _getAllSevice();
    refreshController.refreshCompleted();
    update();
  }
}
