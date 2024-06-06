import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos/Routes/Routes.dart';
import 'package:pos/Routes/navigation.dart';


class PublicController{
  static openHome(BuildContext context)
  {
    Navigator.pushReplacementNamed(
      Navigation.getContext(),
      Routes.homeScreen,
    );
  }
}