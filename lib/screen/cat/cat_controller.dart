import 'package:get/get.dart';
import 'package:luckywheel/model/cat_response.dart';
import 'package:luckywheel/repository/cat_repository.dart';

class CatController extends GetxController{
  CatRepository _catRepository = CatRepository();
  List<CatResponse> listCat = [];
  bool isLoading = false;
  String selected = "";
  String url = "";
  @override
  void onInit() {
    
    super.onInit();
    getAllCat();
  }
  ///
  /// change select
  ///
  void changeSelect(List<CatResponse> data,String value){
    selected  =  value;
    findId(data, value);
    filterCat(data,value);
    update();
  }
 ///
 /// get all cat
 ///
  Future<void> getAllCat() async {
      _catRepository.getAllCat(onSucess: (data) {
       listCat   = data;
       selected  = listCat.first.name!;
       url  = findId(data, selected);
       filterCat(data, selected);
       isLoading = true;
       print(listCat.length.toString());
       print(url);
       update();
     }, onError: (e) {
       print(e);
     },);
  }
  
  ///
  /// findIdByName
  ///
  String findId(List<CatResponse> data,String name){
     String str  = '';
     for(final i in data){
      if(i.name==name){
        str = i.id!;
        break;
      }
     }
     return str;
  }

  ///
  /// filter cat
  ///
  Future<void> filterCat(List<CatResponse> data,String name) async {
    _catRepository.filterCat(filter: findId(data, name), onSucess: (data) {
      url = data;
      print(url);
      update();
    }, onError: (e) {
      print(e);
    },);
  }

}