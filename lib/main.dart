import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/core/sheard.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:e_commerce/pages/create_account/page/create_account_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:e_commerce/pages/main/page/main_screen.dart';
import 'package:e_commerce/pages/start/page/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PreferenceUtils.init();
  AppDio.init();

  runApp(const MyApp());
  // runApp(
  //   DevicePreview(
  //     builder: (context) => MyApp(), // Wrap your app
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => MaterialApp(
        locale: Locale(PreferenceUtils.getString(PrefKeys.language, 'en')),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: 'Flutter Demo',
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          // useMaterial3: true,
        ),
        home: StartScreen(),
        // home: PreferenceUtils.getBool(PrefKeys.loggedIn)
        //     ? s()
        //     : CreateAccountScreen(),
      ),
    );
  }
}
