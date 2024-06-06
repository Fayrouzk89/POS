import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
class SizeConfig {
  SizeConfig._();
  static SizeConfig _instance = SizeConfig._();
  factory SizeConfig() => _instance;

  late MediaQueryData _mediaQueryData;
  late double screenWidth;
  late double screenHeight;
  late double blockSizeHorizontal;
  late double blockSizeVertical;
  late double _safeAreaHorizontal;
  late double _safeAreaVertical;
  late double safeBlockHorizontal;
  late double safeBlockVertical;
  double? profileDrawerWidth;
  late double refHeight;
  late double refWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    refHeight = 1450;
    refWidth = 670;

    if (screenHeight < 1200) {
      blockSizeHorizontal = screenWidth / 100;
      blockSizeVertical = screenHeight / 100;

      _safeAreaHorizontal =
          _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      _safeAreaVertical =
          _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    } else {
      blockSizeHorizontal = screenWidth / 120;
      blockSizeVertical = screenHeight / 120;

      _safeAreaHorizontal =
          _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      _safeAreaVertical =
          _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 120;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 120;
    }
  }

  double getWidthRatio(double val) {
    double res = (val / refWidth) * 100;
    double temp = res * blockSizeHorizontal;

    return temp;
  }

  double getHeightRatio(double val) {
    double res = (val / refHeight) * 100;
    double temp = res * blockSizeVertical;
    return temp;
  }

  double getFontRatio(double val) {
    double res = (val / refWidth) * 100;
    double temp = 0.0;
    if (screenWidth < screenHeight) {
      temp = res * safeBlockHorizontal;
    } else {
      temp = res * safeBlockVertical;
    }

    return temp;
  }
  double getItemWidth()
  {
    return(kIsWeb)?210:screenWidth*0.28;

  }
  double getImageWidth()
  {
    //return(kIsWeb)?200:screenWidth*0.24;
    return screenWidth*0.24;
  }
  double getCartWidth()
  {
    return screenWidth*0.3;
  }
  // Get the proportionate height as per screen size
  double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = SizeConfig().screenHeight;
    // 812 is the layout height that designer use
    final val=(inputHeight / 812.0) * screenHeight;
    return  val.toDouble();
  }

// Get the proportionate height as per screen size
  double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = SizeConfig().screenWidth;
    // 375 is the layout width that designer use
    final val=(inputWidth / 375.0) * screenWidth;
    return  val.toDouble();
  }

}

extension SizeUtils on num {
  double get toWidth => SizeConfig().getWidthRatio(this.toDouble());
  double get toHeight => SizeConfig().getHeightRatio(this.toDouble());
  double get toFont => SizeConfig().getFontRatio(this.toDouble());
}