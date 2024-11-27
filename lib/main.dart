import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/core/services/setting_service.dart';
import 'package:project/core/theme/app_theme.dart';
import 'package:project/features/home/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await initServices();
  runApp(const MyApp());
}

Future initServices() async {
  Get.put(SettingsService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: Get.find<SettingsService>(),
        builder: (settingsService) {
          return GetMaterialApp(
            defaultTransition: Transition.downToUp,
            title: 'Scanfy',
            theme: MyAppTheme.lightTheme,
            darkTheme: MyAppTheme.darkTheme,
            themeMode: settingsService.themeMode.value,
            home: const HomeView(),
          );
        });
  }
}
