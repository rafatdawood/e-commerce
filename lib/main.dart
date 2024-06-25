import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/favorites/manager/favorites_cubit.dart';
import 'package:e_commerce/main/page/main_screen.dart';
import 'package:e_commerce/start/page/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/sheard.dart';
import 'core/store_app_dio.dart';

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
    return ResponsiveSizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return BlocProvider(
          create: (context) => FavoritesCubit(),
          child: MaterialApp(
            title: 'Flutter Demo',
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
              useMaterial3: true,
            ),
            home: PreferenceUtils.getBool(PrefKeys.loggedIn)
                ? MainScreen()
                : StartScreen(),
          ),
        );
      },
    );
  }
}
