import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nav_test/app_state/app_state.dart';
import 'package:nav_test/app_state/app_theme.dart';
import 'package:nav_test/nav_drawer/nav_drawer.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppState(),
      child: MyApp()));

  ///Just testing device preview
//  DevicePreview(
//    enabled: kIsWeb ? false : !kReleaseMode,
//    builder: (BuildContext context) => MyApp(),
//
//  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (_, appState, child) {
        return MaterialApp(
         // locale: DevicePreview.of(context).locale,
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: Provider.of<AppState>(context).isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          home: Container(
              child: NavDrawerPage()),
        );
      },
    );
  }
}

