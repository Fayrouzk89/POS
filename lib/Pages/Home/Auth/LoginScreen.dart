import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos/Api/ApiController.dart';
import 'package:pos/Api/response/LoginReponse.dart';
import 'package:pos/Common/UserInfo.dart';
import 'package:pos/Routes/Routes.dart';
import 'package:pos/Routes/navigation.dart';
import 'package:pos/Utils/AppBars/MainAppBar.dart';
import 'package:pos/Utils/Buttons/CustomRounded.dart';
import 'package:pos/Utils/Regex.dart';
import 'package:pos/Utils/Widgets/InputFieldEmail.dart';
import 'package:pos/Utils/Widgets/InputPassword.dart';
import 'package:pos/Utils/Widgets/Widgets.dart';
import 'package:pos/Utils/colors.dart';
import 'package:pos/Utils/sizes.dart';
import 'package:pos/Utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../globals.dart' as globals;
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          appBar: MainAppBar(),
          backgroundColor: whiteColor,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: paddingBottom),
                child: Container(
                  color: whiteColor,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(
                      horizontal:paddingHorizontal),
                  child: _buildForms(context,screenSize),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onClick() {}
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginStaffController = TextEditingController();
  final loginPasswordController = TextEditingController();
  Widget _buildForms(BuildContext context,Size screenSize) {
    return Form(
      key:loginFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
              height: screenSize.height*0.3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  "images/login.svg",
                ),
              ),
            ),
            CommonWidget.rowHeight(height: 10),
            Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'sign_in'.tr(),
                  textAlign: TextAlign.center,
                  style: h4,
                )),
            CommonWidget.rowHeight(height: 20),
            InputFieldEmail(
              controller: loginStaffController,
              keyboardType: TextInputType.text,
              //labelText: 'Email address',
              placeholder:  'enter_email'.tr(),
              validator: (value) {
                if (value!.isEmpty) {
                  return  'email_required'.tr();
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
              controller: loginPasswordController,
              keyboardType: TextInputType.text,
              // labelText: 'Password',
              placeholder:'enter_secret'.tr(),
              password: true,

              validator: (value) {
                if (value!.isEmpty) {
                  return  'password_required'.tr();
                }


                return null;
              },
              icon: Icons.lock,
            ),
            CommonWidget.rowHeight(height: 10),
            GestureDetector(
              onTap: () {

              },
              child: Text(
                'forget_password'.tr(),
                // textAlign: TextAlign.center,
                style: textStyleBold,
              ),
            ),
            CommonWidget.rowHeight(height: 10),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                    horizontal:horizontalPaddingButton,
                    vertical: verticalPaddingButton),
                child: CustomRounded(
                    text: 'sign_in'.tr(),
                    textSize: textButton,
                    textColor: Colors.white,
                    color: helperColor,
                    size: Size(screenSize.width * 0.8, roundedHeight),
                    pressed: () {
                      doLogin(context);
                    })),
            CommonWidget.rowHeight(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.HOME);
                  },
                  child: Text(
                    'dont_have_account'.tr(),
                    textAlign: TextAlign.center,
                    style:textStyleBold,
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                   Navigator.pushNamed(
                     Navigation.getContext(),
                     Routes.registerScreen,
                   );
                  },
                  child: Text(
                    'register_now'.tr(),
                    textAlign: TextAlign.center,
                    style: textStyleBold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void doLogin(BuildContext context) async {
    if (loginFormKey.currentState!.validate()) {
      UserInfo userInfo = UserInfo(
          id: 0,
          first_name: '',
          second_name: '',
          gender: '',
          email: loginStaffController.text,
          password: loginPasswordController.text,
          password_confirmation: '',
          type: '');
      globals.userInfo = userInfo;
      LoginResponse? res = await ApiController.login(context, userInfo);
    }
    else
      {
        setState(() {

        });
      }

  }
}
