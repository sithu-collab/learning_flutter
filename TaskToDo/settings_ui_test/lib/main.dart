import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui_test/app_state/app_state.dart';
import 'package:settings_ui_test/page/settings_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => AppState(),
      child: MyApp(),
    )
//    DevicePreview(
//      enabled: kIsWeb ? false : !kReleaseMode,
//      builder: (BuildContext context) => MyApp(),
  );


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
          builder: (_, appState, child) {
            return MaterialApp(
//              locale: DevicePreview.of(context).locale,
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              title: 'Settings UI',
              theme: ThemeData(
                  primarySwatch: Colors.blueGrey,
                  brightness: Brightness.light
              ),
              darkTheme: ThemeData(
                  primarySwatch: Colors.deepPurple,
                  accentColor: Colors.deepPurple,
                  brightness: Brightness.dark
              ),
              themeMode: Provider.of<AppState>(context).isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
              home: SettingPage(),
            );
          },
        );
  }
}

