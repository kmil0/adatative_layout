import 'package:adatative_layouts/core/config/app_constants.dart';
import 'package:adatative_layouts/core/config/theme.dart';
import 'package:adatative_layouts/core/helpers/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingThemeScreen extends StatefulWidget {
  const SettingThemeScreen({Key? key}) : super(key: key);

  @override
  _SettingThemeState createState() => _SettingThemeState();
}

class _SettingThemeState extends State<SettingThemeScreen> {
  late ThemeChanger themeNotifier;
  late bool isDarkTheme;
  List themes = AppConstants.themes;
  int _selectedPosition = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _getSavedTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    themeNotifier = Provider.of<ThemeChanger>(context);
    isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.SETTING)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return _createList(context, themes[position], position);
          },
          itemCount: themes.length,
        ),
      ),
    );
  }

  _createList(context, item, position) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        _changeState(position);
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Radio(
            value: _selectedPosition,
            groupValue: position,
            activeColor: isDarkTheme
                ? ColorConstantsDark.textBodyColor
                : ColorConstants.cyan,
            onChanged: (_) {
              _changeState(position);
            },
          ),
          Text(item),
        ],
      ),
    );
  }

  _changeState(int position) {
    setState(() {
      _selectedPosition = position;
    });
    _onThemeChanged(themes[position]);
  }

  void _onThemeChanged(String value) async {
    ThemeMode selectedTheme = ThemeMode.dark;
    if (value == AppConstants.SYSTEM_DEFAULT) {
      selectedTheme = ThemeMode.system;
    } else if (value == AppConstants.LIGHT) {
      selectedTheme = ThemeMode.light;
    }

    themeNotifier.setTheme(selectedTheme);
    SharedPreferences themeConfig = await SharedPreferences.getInstance();
    themeConfig.setString(AppConstants.APP_THEME, value);
  }

  _getSavedTheme() async {
    SharedPreferences themeConfig = await SharedPreferences.getInstance();
    setState(() {
      String theme = themeConfig.getString(AppConstants.APP_THEME) ??
          AppConstants.SYSTEM_DEFAULT;
      _selectedPosition = themes.indexOf(theme);
    });
  }
}
