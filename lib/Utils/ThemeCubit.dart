import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'colors.dart';
import 'style.dart';

class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: orangeColor,
        onPrimary: blackColor,
        secondary: orangeColor,
        background: Colors.white,
        brightness: Brightness.light,
        surfaceTint: Colors.transparent
    ),
    brightness: Brightness.light,

    useMaterial3: true,
    cardColor: Colors.white,
    cardTheme: CardTheme(color: Colors.white,),
    dialogBackgroundColor: Colors.white,

    dialogTheme: DialogTheme(backgroundColor: Colors.white,),
    appBarTheme:  AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: primaryColor,
        ),
        backgroundColor: primaryColor
    ),
    scaffoldBackgroundColor: whiteColor,
    textTheme: textTheme.apply(
      bodyColor: blackColor,
      decorationColor: blackColor,
      displayColor: blackColor,
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: whiteColor,
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: blackColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: orangeColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: blackColor),
      ),
      hintStyle: const TextStyle(
        fontFamily: sofia,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
    ),
    // switchTheme: SwitchThemeData(
    //   thumbColor: MaterialStateProperty.all(orangeColor80),
    //   trackColor: MaterialStateProperty.all(orangeColor50),
    //   overlayColor: MaterialStateProperty.all(grayColor),
    // ),
  );

  static final _darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: blackColor,
      onPrimary: whiteColor,
      // secondary: orangeColor,
    ),
    useMaterial3: true,
    appBarTheme:  AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: primaryColor,
        ),
        backgroundColor: primaryColor
    ),
    scaffoldBackgroundColor: blackColor,
    textTheme: textTheme.apply(
      bodyColor: whiteColor,
      decorationColor: whiteColor,
      displayColor: whiteColor,
    ),
    listTileTheme: ListTileThemeData(
      tileColor: blackColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: blackColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: orangeColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: blackColor),
      ),
      hintStyle: const TextStyle(
        fontFamily: sofia,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.blue[800]),
      trackColor: MaterialStateProperty.all(Colors.blue[800]),
      overlayColor: MaterialStateProperty.all(grayColor),
    ),
  );

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}