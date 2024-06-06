import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos/Api/ApiController.dart';
import 'package:pos/Common/UserInfo.dart';
import 'package:pos/Utils/AppBars/MainAppBar.dart';
import 'package:pos/Utils/Buttons/CustomRounded.dart';
import 'package:pos/Utils/Regex.dart';
import 'package:pos/Utils/Widgets/InputField.dart';
import 'package:pos/Utils/Widgets/InputFieldEmail.dart';
import 'package:pos/Utils/Widgets/InputPassword.dart';
import 'package:pos/Utils/Widgets/Widgets.dart';
import 'package:pos/Utils/colors.dart';
import 'package:pos/Utils/sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pos/Utils/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Helper/AppFocus.dart';
import '../../../globals.dart' as globals;
class RegisterScreen extends StatefulWidget {

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          //resizeToAvoidBottomInset: false,
          appBar:MainAppBar(),
          backgroundColor: whiteColor,
          body:Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
            child: _buildForms(context,screenSize),
          ),)
      ],
    );
  }

   GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final registerFirstController = TextEditingController();

  final registerLastController = TextEditingController();

  final registerPhoneController = TextEditingController();

  final registerConfirmPasswordController = TextEditingController();

  final registerEmailController = TextEditingController();

  final registerPasswordController = TextEditingController();

  String gender="male";

  String individual="";

  bool registerTermsChecked = false;

  String city="";

  Widget _buildForms(BuildContext context,Size screenSize) {

    return Form(
      key:registerFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'create_account'.tr(),
                  textAlign: TextAlign.center,
                  style: h4,
                )),
            Container(
              height: screenSize.height*0.2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  "images/signup.svg",
                ),
              ),
            ),
            InputField(
              controller:registerFirstController,
              keyboardType: TextInputType.text,
              //labelText: 'Email address',
              placeholder:'first_name'.tr(),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'first_required'.tr();
                }

                return null;
              },
              icon: Icons.person,
            ),
            CommonWidget.rowHeight(height: 10.0),
            InputFieldEmail(
              controller: registerEmailController,
              keyboardType: TextInputType.text,
              //labelText: 'Email address',
              placeholder: 'enter_email'.tr(),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'email_required'.tr();
                }
                if (value != null) {
                  if (!Regex.isEmail(value)) {
                    return 'email_error'.tr();
                  }
                }
                return null;
              },
              icon: Icons.mail,
            ),
            CommonWidget.rowHeight(height: 10),
            InputPassword(
              controller: registerPasswordController,
              keyboardType: TextInputType.text,
              // labelText: 'Password',
              placeholder: 'enter_secret'.tr(),
              password: true,

              validator: (value) {
                if (value!.isEmpty) {
                  return 'password_required'.tr();
                }



                return null;
              },
              icon: Icons.lock,
            ),
            CommonWidget.rowHeight(height: 10.0),
            InputPassword(
              controller: registerConfirmPasswordController,
              keyboardType: TextInputType.text,
              // labelText: 'Password',
              placeholder:'enter_secret_confirm'.tr(),
              password: true,

              validator: (value) {
                if (value!.isEmpty) {
                  return 'password_required'.tr();
                }


                if (registerPasswordController.text !=
                    registerConfirmPasswordController.text) {
                  return 'password_not_same'.tr();
                }
                return null;
              },
              icon: Icons.lock,
            ),
            CommonWidget.rowHeight(height: 10.0),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                    horizontal:horizontalPaddingButton,
                    vertical:verticalPaddingButton),
                child: CustomRounded(
                    text: 'create_account'.tr(),
                    textSize: textButton,
                    textColor: Colors.white,
                    color: helperColor,
                    size: Size(screenSize.height * 0.8,
                      roundedHeight),
                    pressed: () {
                      register(context);
                    // controller.register(context);
                    })),
          ],
        ),
      ),
    );
  }

  register(BuildContext context)async
  {
   // AppFocus.unfocus(context);
    if (registerFormKey.currentState!.validate()) {
      // Get.toNamed(Routes.HOME);
      UserInfo userInfo = UserInfo( id: 0,
          first_name: registerFirstController.text,
          second_name: registerLastController.text,
          gender: gender,
          password: registerPasswordController.text,
          password_confirmation: registerConfirmPasswordController.text,
          type:individual, email: registerEmailController.text
      );
      globals.userInfo=userInfo;
      await ApiController.RegisterUser(context,userInfo);
    }
  }
}
