import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeDataApp {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: ColorConstants.lightGrey,
      primarySwatch: Colors.grey,
      cardColor: ColorConstants.backgroundColor,
      canvasColor: ColorConstants.backgroundColor,
      backgroundColor: ColorConstants.backgroundColor,
      primaryColorBrightness: Brightness.light,
      primaryColor: ColorConstants.primaryColor,
      brightness: Brightness.light,
      errorColor: ColorConstants.red,
      focusColor: ColorConstants.accentColor,
      colorScheme: _getColorSchemeLight(),
      appBarTheme: _getAppBarThemeLight());

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: ColorConstantsDark.backgroundColor,
      cardColor: ColorConstantsDark.backgroundColor,
      canvasColor: ColorConstantsDark.backgroundColor,
      backgroundColor: ColorConstantsDark.backgroundColor,
      primaryColorBrightness: Brightness.dark,
      primaryColor: ColorConstantsDark.primaryColor,
      brightness: Brightness.dark,
      errorColor: ColorConstants.red,
      focusColor: ColorConstantsDark.accentColor,
      colorScheme: _getColorSchemeDark(),
      appBarTheme: _getAppBarThemeDark());

  static _getColorSchemeLight() {
    return const ColorScheme.light(
      primary: ColorConstants.primaryColor,
      primaryVariant: ColorConstants.accentColor,
      secondary: Color(0xff03dac6),
      secondaryVariant: Color(0xff018786),
      surface: Color(0xff03dac6),
      background: ColorConstants.backgroundColor,
      error: Color(0xffb00020),
      onPrimary: Color(0xff03dac6),
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    );
  }

  static _getColorSchemeDark() {
    return const ColorScheme.dark(
      primary: Colors.black,
      primaryVariant: Color(0xff3700B3),
      secondary: Color(0xff03dac6),
      secondaryVariant: Color(0xff03dac6),
      surface: Color(0xff121212),
      background: Color(0xff121212),
      error: Color(0xffcf6679),
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: ColorConstantsDark.textBodyLightColor,
      onBackground: ColorConstantsDark.backgroundColor,
      onError: Colors.black,
      brightness: Brightness.dark,
    );
  }

  static _getAppBarThemeLight() {
    return const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      color: ColorConstants.backgroundColor,
    );
  }

  static _getAppBarThemeDark() {
    return const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      color: ColorConstantsDark.backgroundColor,
    );
  }
}

class ColorConstants {
  ColorConstants._();

  static const Color primaryColor = Color(0xffbb86fc);
  static const Color accentColor = Color(0xff3700b3);

  static const Color backgroundColor = Color(0xFFF4F4F4);
  static const Color backgroundColorGrey = Color(0xFFFBFCFE);
  static const Color backgroundColorPill = Color(0xFFdbdbdb);

  static const Color textColor = Color(0xFF121C3B);
  static const Color textBodyColor = Color(0xFF97A4B4);
  static const Color textBodyLightColor = Color(0xFFA8B5C4);
  static const Color textColorDark = Color(0xFF1c1c1f);

  static const purple = Color(0xFF5117AC);
  static const purpleBerry = Color(0xFF4268D3);
  static const purpleLight = Color(0xFF584CD1);
  static const cyan = Color(0xFF20D0C4);
  static const lightGreen = Color(0xFF00C389);
  static const green = Color(0xFF03814A);
  static const yellow = Color(0xFFFDDA24);
  static const orange = Color(0xFFFF7F41);
  static const red = Color(0xFFE20201);
  static const pink = Color(0xFFF5638B);
  static const black = Color(0xFF03091E);
  static const dark = Color(0xFF2C2A29);
  static const grey = Color(0xFF212738);
  static const disabled = Color(0xFFCCCCCC);
  static const lightGrey = Color(0xFFF4F4F4);
  static const veryLightGrey = Color(0xFFF3F3F3);
  static const white = Color(0xFFFFFFFF);
}

class ColorConstantsDark {
  ColorConstantsDark._();

  static const Color primaryColor = Color(0xff6200ee);
  static const Color accentColor = Color(0xff3700B3);

  static const Color backgroundColor = Color(0xFF2C2A29);
  static const Color backgroundColorGrey = Color(0xFF212738);
  static const Color backgroundColorPill = Color(0xFF393736);

  static const Color textColor = Color(0xFFF3F3F3);
  static const Color textBodyColor = Color(0xFFF5638B);
  static const Color textBodyLightColor = Color(0xFFF3F3F3);
  static const Color textColorDark = Color(0xFFABA59D);
}
