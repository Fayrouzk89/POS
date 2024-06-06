import 'package:flutter/widgets.dart';
import 'package:pos/Pages/Home/Auth/AuthScreen.dart';
import 'package:pos/Pages/Home/Auth/LoginScreen.dart';
import 'package:pos/Pages/Home/Auth/RegisterScreen.dart';
import '../Pages/Home/HomeScreen.dart';
import '../Pages/Splash/SplashScreen.dart';
import 'routes.dart';

Map<String, WidgetBuilder> routesApp = {
  Routes.splashScreen: (_) => SplashScreen(),
  Routes.homeScreen: (_) => HomeScreen(),
  Routes.authScreen: (_) => AuthScreen(),
  Routes.loginScreen: (_) => LoginScreen(),
  Routes.registerScreen: (_) => RegisterScreen(),

};