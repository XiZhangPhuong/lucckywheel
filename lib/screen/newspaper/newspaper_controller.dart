import 'package:get/get.dart';
import 'package:luckywheel/model/newspaper_response.dart';
import 'package:luckywheel/repository/newspaper_respository.dart';

class NewSpaperController extends GetxController {
  final NewSpaperResposiory newSpaperRespository = NewSpaperResposiory();
  List<String> listCategory = [
    'Tin mới nhất',
    'Thế giới',
    'Sức khỏe',
    'Đời sống',
    'Kinh doanh',
    'Khoa học',
    'Thời sự',
    'Thể thao',
  ];
  int currenIndex = 0;
  NewSpaperResponse newSpaperResponse = new NewSpaperResponse();
  bool isLoading  = false;
  @override
  void onInit() {
    super.onInit();
    // get data
    getDataNewSpaper();
  }

  ///
  /// get dâta
  ///
  Future<void> getDataNewSpaper() async {
    newSpaperRespository.getData(
      onSuccess: (data) {
         newSpaperResponse = data;
         isLoading = true;
         update();
      },
      onError: (e) {
        print(e);
      },
    );
  }

  ///
  /// onClickCategory
  ///
  void onClickCategory(int index){
    currenIndex = index;
    update();
  }
}
