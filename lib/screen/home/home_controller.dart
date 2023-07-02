import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luckywheel/shares/shared_preference_helper.dart';

class HomeController extends GetxController {
  
  List<Map<String, dynamic>> dataList = [
    {
      'url': 'https://flagcdn.com/w320/vn.png',
      'title': 'VietNam',
    },
    {
      'url': 'https://flagcdn.com/w320/us.png',
      'title': 'USA',
    },
    {
      'url': 'https://flagcdn.com/w320/kr.png',
      'title': 'Korea',
    },
    {
      'url': 'https://flagcdn.com/w320/cn.png',
      'title': 'China',
    },
    {
      'url': 'https://flagcdn.com/w320/jp.png',
      'title': 'Japan',
    },
    {
      'url': 'https://flagcdn.com/w320/in.png',
      'title': 'India',
    },
    {
      'url': 'https://flagcdn.com/w320/es.png',
      'title': 'Spain',
    },
    {
      'url': 'https://flagcdn.com/w320/it.png',
      'title': 'Italy',
    },
    {
      'url': 'https://flagcdn.com/w320/ru.png',
      'title': 'Russia',
    },
   
  ];
   int selectTed = 0;
  @override
  void onInit() {
    super.onInit();
  }

  ///
  /// change language
  ///
  void changeLanguage(int index){
     selectTed = index;
     setStringLanguage(index);
     print(selectTed);
     update();
     Get.back();
  }

///
/// set String language
///
  void setStringLanguage(int index){
     switch(index){
       case 0 : 
       SharedPreferenceHelper.setString('key', 'vi');
       Get.updateLocale(const Locale('vi_VN'));
       break;
       case 1 : 
       SharedPreferenceHelper.setString('key', 'en');
       Get.updateLocale(Locale('en', 'US'));
       break;
       case 2 : 
       SharedPreferenceHelper.setString('key', 'ko');
       Get.updateLocale(const Locale('ko_KR'));
       break;
       case 3 : 
       SharedPreferenceHelper.setString('key', 'zh');
       Get.updateLocale(const Locale('zh_CN'));
       break;
       case 4 : 
       SharedPreferenceHelper.setString('key', 'jp');
       Get.updateLocale(const Locale('ja_JP'));
       break;
        case 5 : 
       SharedPreferenceHelper.setString('key', 'in');
       Get.updateLocale(const Locale('en_IN'));
       break;
       case 6 : 
       SharedPreferenceHelper.setString('key', 'es');
       Get.updateLocale(const Locale('es_ES'));
       break;
       case 7 : 
       SharedPreferenceHelper.setString('key', 'it');
       Get.updateLocale(const Locale('it_IT'));
       break;
       case 8 : 
       SharedPreferenceHelper.setString('key', 'ru');
       Get.updateLocale(const Locale('ru_RU'));
       break;
     }
  }
}
