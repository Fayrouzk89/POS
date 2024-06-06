import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'colors.dart';
const TextTheme textTheme = TextTheme(
  headline4: TextStyle(
    fontFamily: sofia,
    //fontSize: 28,
    fontWeight: FontWeight.w700,
    // letterSpacing: 0.25,
  ),
  headline5: TextStyle(
    fontFamily: sofia,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  ),
  headline6: TextStyle(
    fontFamily: sofia,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
  ),
  subtitle1: TextStyle(
    fontFamily: sofia,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  subtitle2: TextStyle(
    fontFamily: sofia,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyText1: TextStyle(
    fontFamily: sofia,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyText2: TextStyle(
    fontFamily: sofia,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  caption: TextStyle(
    fontFamily: sofia,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  ),
  button: TextStyle(
    fontFamily: sofia,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  ),

);
Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );

}
double widthPercent=0.85;
/////////////////////////////////
///   TEXT STYLES
////////////////////////////////

const logoStyle = TextStyle(
    fontFamily: 'Pacifico',
    fontSize: 30,
    color: Colors.black54,
    letterSpacing: 2);

const logoWhiteStyle = TextStyle(
    fontFamily: sofia,
    fontSize: 21,
    letterSpacing: 2,
    color: Colors.white);
const whiteText = TextStyle(color: Colors.white, fontFamily: sofia);
const disabledText = TextStyle(color: Colors.grey, fontFamily:sofia);
const contrastText = TextStyle(color: helperColor, fontFamily: sofia);
const contrastTextBold = TextStyle(
    color: primaryColor, fontFamily: sofia, fontWeight: FontWeight.w600);
const hintStyle= TextStyle(
fontSize:  14,
color: hintColor
);
const textStyleBold=TextStyle(
    fontSize: 18,
    color:textColor,
    fontWeight: FontWeight.bold);
const h3 = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w800,
    fontFamily: sofia);

const h4 = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: sofia);

const h5 = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: sofia);

const h6 = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: sofia);


const priceText = TextStyle(
    color:helperColor,
    fontSize: 19,
    fontWeight: FontWeight.w800,
    fontFamily: sofia);

const foodNameText = TextStyle(
    color: Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    fontFamily: sofia);

const tabLinkStyle =
TextStyle(fontWeight: FontWeight.w500);

const taglineText = TextStyle(color: Colors.grey, fontFamily: sofia);
const categoryText = TextStyle(
    color: Color(0xff444444),
    fontWeight: FontWeight.w700,
    fontFamily: sofia);

const inputFieldTextStyle =
TextStyle(fontFamily:sofia, fontWeight: FontWeight.w500);

const inputFieldHintTextStyle =
TextStyle(fontFamily: sofia, color: Color(0xff444444));

const inputFieldPasswordTextStyle = TextStyle(
    fontFamily: sofia, fontWeight: FontWeight.w500, letterSpacing: 3);

const inputFieldHintPaswordTextStyle = TextStyle(
    fontFamily: sofia, color: Color(0xff444444), letterSpacing: 2);

///////////////////////////////////
/// BOX DECORATION STYLES
//////////////////////////////////

const authPlateDecoration = BoxDecoration(
    color: white,
    boxShadow: [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, .1),
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(0, 1))
    ],
    borderRadius: BorderRadiusDirectional.only(
        bottomEnd: Radius.circular(20), bottomStart: Radius.circular(20)));

/////////////////////////////////////
/// INPUT FIELD DECORATION STYLES
////////////////////////////////////

const inputFieldFocusedBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
    borderSide: BorderSide(
      color: primaryColor,
    ));

const inputFieldDefaultBorderStyle = OutlineInputBorder(
    gapPadding: 0, borderRadius: BorderRadius.all(Radius.circular(6)));
const double SizeIcon=30;