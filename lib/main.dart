import 'package:adatative_layouts/core/config/app_constants.dart';
import 'package:adatative_layouts/core/config/theme.dart';
import 'package:adatative_layouts/core/helpers/theme_notifier.dart';
import 'package:adatative_layouts/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  prefs.then((value) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
          create: (BuildContext context) {
            String? theme = value.getString(AppConstants.APP_THEME);
            if (theme == null ||
                theme == "" ||
                theme == AppConstants.SYSTEM_DEFAULT) {
              value.setString(
                  AppConstants.APP_THEME, AppConstants.SYSTEM_DEFAULT);
              return ThemeChanger(ThemeMode.system);
            }
            return ThemeChanger(
                theme == AppConstants.DARK ? ThemeMode.dark : ThemeMode.light);
          },
        ),
      ],
      child: const MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeDataApp.lightTheme,
      darkTheme: ThemeDataApp.darkTheme,
      themeMode: themeNotifier.themeMode(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
