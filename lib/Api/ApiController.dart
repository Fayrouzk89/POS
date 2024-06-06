import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pos/Common/UserInfo.dart';
import 'package:pos/Helper/AppFocus.dart';

import '../Helper/MessageHelper.dart';
import '../Helper/PublicController.dart';
import '../Helper/StorageService.dart';
import 'Api.dart';
import 'ApiLoading.dart';
import 'ApiRepo.dart';
import 'package:easy_localization/easy_localization.dart';

import 'response/LoginReponse.dart';
class ApiController {
  String codeActivation="";
  String codeDeletion="";

  static Future<LoginResponse?> RegisterUser(BuildContext context,UserInfo userInfo) async {
    Api.setLoading( 'pleaseWait'.tr());
    try {
      final result = await ApiRepo().registerUser(userInfo);
      Api.hideLoading();
      if (result != null) {
        if (result!=null) {
          processRegisterResult(result, context);
          return result;
        } else {
          processRegisterResult(result, context);
        }
      }
      else
      {
        return null;
      }
    } catch (e) {
     // Log.loga(title, "RegisterUser:: e >>>>> $e");
      Api.hideLoading();
      processRegisterResult(null, context);
      return null;
    }
  }
  static  void processRegisterResult(LoginResponse? response,BuildContext context)
  {
    if(response!=null)
    {
      if(response.success==true)
      {
        if(response.data!=null && response.data!=null) {
          MessageHelper.showMessage(context,response.message!);
          StorageService.saveUserInfo(response.data!);
          // Get.clearRouteTree();
          // Get.offNamedUntil(Routes.HOME', (route) => false);;
          PublicController.openHome(context);
        }
        else
        {
          processFailRegister(response,context);
        }
      }
      else
      {
        processFailRegister(response,context);
      }
    }
    else
    {
      MessageHelper.showMessage(context,'time_out'.tr());
    }
  }
  static  void processFailRegister(LoginResponse response,BuildContext context)
  {
    if(response.message!=null)
    {
      MessageHelper.showMessage(context,response.message!);
    }
    else
    {
      MessageHelper.showMessage(context,'error_register'.tr());
    }
  }


 static Future<LoginResponse?> login(BuildContext context,UserInfo userInfo) async {
    AppFocus.unfocus(context);
    ApiLoading.setLoading('pleaseWait'.tr());
      try {
        final result = await ApiRepo().validateUser(userInfo);
        ApiLoading.hideLoading();
        if (result!=null) {
          processResult(result, context);
          return result;
        } else {
          processResult(result, context);
        }
      } catch (e) {
        print("RegisterUser:: e >>>>> ");
        ApiLoading.hideLoading();
        processResult(null, context);
      }

  }
static  void processResult(LoginResponse? response,BuildContext context)
  {
    if(response!=null)
    {
      if(response.success==true)
      {
        if(response.data!=null && response.data!.name!=null) {
          StorageService.saveUserInfo(response.data!);
          // Get.clearRouteTree();
          // Get.offNamedUntil(Routes.HOME', (route) => false);;
          PublicController.openHome(context);
        }
        else
        {
          processFailLogin(response,context);
        }
      }
      else
      {
        processFailLogin(response,context);
      }
    }
    else
    {
      MessageHelper.showMessage(context, 'time_out'.tr());
    }
  }
static  void processFailLogin(LoginResponse response,BuildContext context)
  {
    if(response.message!=null)
    {
      MessageHelper.showMessage(context,response.message!);
    }
    else
    {
      MessageHelper.showMessage(context,'error_login'.tr());
    }
  }
}
