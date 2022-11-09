import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/local_data/shared_preference.dart';
import 'package:todo_app/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  StorageRepository.getInstance();
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale("en", "US"),
        Locale("ru", "RU"),
        Locale("uz", "UZ")
      ],
      startLocale: const Locale('en', 'US'),
      saveLocale: true,
      path: 'assets/translations',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 800),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: child);
      },
      child: const SplashScreen(),
    );
  }
}
