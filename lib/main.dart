import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:luckywheel/helper/validate.dart';
import 'package:luckywheel/muti_language/locale_string.dart';
import 'package:luckywheel/routes/app_routes.dart';
import 'package:luckywheel/routes/routes_path/home_routes.dart';
import 'package:luckywheel/shares/shared_preference_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget  {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)  {
    final Locale? deviceLocale = getDeviceLocale();
    return GetMaterialApp (
      title: 'LucKy Wheel',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.list,
      initialRoute: HomeRoutes.DASHBOARD,
      supportedLocales: const [
        Locale('vi', 'VN'),
        Locale('en', 'US'),
        Locale('zh', 'CN'),
        Locale('ko', 'KR'),
        Locale('es', 'ES'),
        Locale('en', 'IN'),
        Locale('ja', 'JP'),
        Locale('it', 'IT'),
        Locale('ru', 'RU'),
      ],
      locale: Locale('vi','VN'),
      localizationsDelegates: localizationsDelegates,
      translations: LocaleString(),
    );
  }
}

///
///
///
List<LocalizationsDelegate> localizationsDelegates = [
  // AppLocalizations.delegate,// Load dư liệu trước
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate
];

///
/// Tự động set theo ngôn ngữ máy
///
Locale? getDeviceLocale() {
  final locales = WidgetsBinding.instance.window.locales;
  if (locales.isNotEmpty) {
    return locales.first;
  }
  return null;
}

///
/// get language , nếu chưa lưu ngôn ngữ thì lấy ngôn ngữ máy
///
Future<Locale> getLanguage() async {
  Locale? locale;
  String? language =  SharedPreferenceHelper.getString('key') as String?;
  if (Validate.nullOrEmpty(language)) {
    locale = getDeviceLocale()!;
  } else {
    switch (language) {
      case 'vi':
        locale = Locale('vi', 'VN');
        break;
      case 'en':
        locale = Locale('en', 'US');
        break;
      case 'ko':
        locale = Locale('zh', 'CN');
        break;
      case 'zh':
        locale = Locale('ko', 'KR');
        break;
      case 'jp':
        locale = Locale('es', 'ES');
        break;
      case 'in':
        locale = Locale('en', 'IN');
        break;
      case 'es':
        locale = Locale('ja', 'JP');
        break;
      case 'it':
        locale = Locale('it', 'IT');
        break;
      case 'ru':
        locale = Locale('ru', 'RU');
        break;
    }
  }
  return locale!;
}
