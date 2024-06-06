import 'package:flutter/material.dart';
import 'package:pos/Routes/Routes.dart';
import 'package:pos/Routes/navigation.dart';
import 'package:pos/Utils/AppBars/MainAppBar.dart';
import 'package:pos/Utils/Buttons/CustomRounded.dart';
import 'package:pos/Utils/colors.dart';
import 'package:pos/Utils/sizes.dart';
import 'package:pos/Utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor:whiteColor,
        appBar: MainAppBar(),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: paddingBottom),
              child: Container(
                  alignment: Alignment.topCenter,
                  color: whiteColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: paddingHorizontal),
                  child: _buildItems(context, screenSize)),
            ),
            //FooterWidget()
          ],
        ),
      ),
    );
  }

  Widget _buildItems(BuildContext context,Size screenSize) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      children: [
        Container(
          height: screenSize.height*0.3,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              "images/chat.svg",
            ),
          ),
        ),
        Text(
        'app_name'.tr(),
          //textAlign: TextAlign.center,
          style: h3,
        ),
        SizedBox(height: 10.0),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
                horizontal: horizontalPaddingButton,
                vertical: verticalPaddingButton),
            child: CustomRounded(
              text: 'sign_in'.tr(),
              textSize: textButton,
              textColor:Colors.white ,
              color:helperColor   ,
              size: Size(screenSize.width * 0.8,
                  roundedHeight),
              pressed: () {
                Navigator.pushNamed(
                  Navigation.getContext(),
                  Routes.loginScreen,
                );
              },
            )),
        SizedBox(height: 10.0),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
                horizontal: horizontalPaddingButton,
                vertical: verticalPaddingButton),
            child: CustomRounded(
                text:'create_account'.tr(),
                textSize:textButton,
                textColor:helperColor ,
                color:Colors.white ,
                size: Size(screenSize.width * 0.8,
                    roundedHeight),
                pressed: () {
                  Navigator.pushNamed(
                    Navigation.getContext(),
                    Routes.registerScreen,
                  );
                })),
        SizedBox(height: 10.0),

      ],
    );
  }
}
