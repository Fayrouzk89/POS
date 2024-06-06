import 'package:flutter/material.dart';
import 'package:pos/Helper/LocalDataHelper.dart';
import 'package:pos/Utils/colors.dart';

import 'dart:async';
import '../../Helper/SizeConfig.dart';
import '../../Routes/Routes.dart';
import '../../Routes/navigation.dart';
import '../../utils/ResponsiveWidget.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key) {}

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  final duration = const Duration(seconds: 4);

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
    )..forward();
    super.initState();
    handleOnInitialize();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  void handleOnInitialize() async {
    Future.delayed(duration).then((_) {
      if(!LocalDataHelper.login())
        {
          Navigator.pushReplacementNamed(
            Navigation.getContext(),
            Routes.authScreen,
          );
        }
      else
      Navigator.pushReplacementNamed(
        Navigation.getContext(),
        Routes.homeScreen,
      );
    });
  }

  handleNext() {}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: helperColor,
      body: GestureDetector(
        onTap: () {
          handleOnInitialize();
        },
        child: ResponsiveWidget(
          desktop: Center(
            child: buildMain(width * 0.18),
          ),
          mobile: Center(
            child: buildMain(width * 0.3),
          ),
        ),
      ),
    );
  }

  Widget buildMain(double width) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: width, //change 0.3 to any value you want
      backgroundImage: AssetImage('assets/images/shop.jpg'),
    );
  }
}
