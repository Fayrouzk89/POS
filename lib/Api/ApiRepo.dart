import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../Common/Products.dart';
import '../Common/UserInfo.dart';
import '../globals.dart' as globals;
import 'Api.dart';
import 'apiUtils.dart';
import 'response/GeneralResponse.dart';
import 'response/LoginReponse.dart';
import 'response/OrderResponse.dart';
import 'response/ProductResponse.dart';
import 'response/SingleProductResponse.dart';
final title = "ApiRepo";

class ApiRepo {
  Future<LoginResponse?> validateUser(UserInfo userInfo) async {

    String url = Api.getLogin();
    var formData = FormData.fromMap({
      'email': userInfo.email,
      'password':  userInfo.password
    });
    var option=  Options(headers: apiUtils.emptyHeaders);
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return LoginResponse.fromJson(response.data);
      }

      return null;
    }
    on DioError catch (e) {
      apiUtils.handleError(e);
    if(e.response!=null){
      return LoginResponse.fromJson(e.response!.data);
    }else{
    print(e.message);
    return null;
    }
    }
    catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<LoginResponse?> registerUser(UserInfo userInfo) async {

    String url = Api.getRegister();
    var formData = FormData.fromMap({
      'name': userInfo.first_name,
      'email':  userInfo.email,
      'password':  userInfo.password,
      'c_password':  userInfo.password_confirmation
    });
    var option=  Options(headers: apiUtils.emptyHeaders);
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return LoginResponse.fromJson(response.data);
      }

      return null;
    }
    on DioError catch (e) {
      apiUtils.handleError(e);
      if(e.response!=null){
        return LoginResponse.fromJson(e.response!.data);
      }else{
        print(e.message);
        return null;
      }
    }
    catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<GeneralResponse?> addProductComment(int id,String text) async {
    String url = Api.getcomment();
    var formData = FormData.fromMap({
      'product_id': id,
      'content': text
    });
    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);
      if (response != null) {
        return GeneralResponse.fromJson(response.data);
      }
      return null;
    }
    on DioError catch (e) {
      apiUtils.handleError(e);
      if(e.response!=null){
        return GeneralResponse.fromJson(e.response!.data);
      }else{
        print(e.message);
        return null;
      }
    }
    catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<GeneralResponse?> addProductRate(int id,double rate) async {
    String url = Api.getrate();
    var formData = FormData.fromMap({
      'product_id': id,
      'rate': rate
    });
    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);
      if (response != null) {
        return GeneralResponse.fromJson(response.data);
      }
      return null;
    }
    on DioError catch (e) {
      apiUtils.handleError(e);
      if(e.response!=null){
        return GeneralResponse.fromJson(e.response!.data);
      }else{
        print(e.message);
        return null;
      }
    }
    catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<GeneralResponse?> addProductOrder(int id) async {
    String url = Api.getAddOrder();
    var formData = FormData.fromMap({
      'product_id': id,
    });
    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);
      if (response != null) {
        return GeneralResponse.fromJson(response.data);
      }
      return null;
    }
    on DioError catch (e) {
      apiUtils.handleError(e);
      if(e.response!=null){
        return GeneralResponse.fromJson(e.response!.data);
      }else{
        print(e.message);
        return null;
      }
    }
    catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }

  Future<Products?> getProductbyId(int Id) async {

    String url = Api.get_product_Id(Id);

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        SingleProductResponse singleProductResponse= SingleProductResponse.fromJson(response.data);
         return singleProductResponse.data;
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }

  Future<ProductResponse?> getProducts() async {

    String url = Api.getLatestProducts();

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return ProductResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<ProductResponse?> getProductsByFilter(String title,int rate) async {

    String url = Api.getProductsByFilter();
    var option=  Options(headers: apiUtils.getsecureHeaders());
    var formData = FormData.fromMap({
      'title': title,
      'rate':rate
    });
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return ProductResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }

  Future<OrderResponse?> getOrders() async {

    String url = Api.getOrders();

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return OrderResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<GeneralResponse?> deleteOrder(Order order) async {
    String url = Api.getDeleteOrder(order.id!);

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.delete(api: url,options: option);
      if (response != null) {
        return GeneralResponse.fromJson(response.data);
      }
      return null;
    }
    on DioError catch (e) {
      apiUtils.handleError(e);
      if(e.response!=null){
        return GeneralResponse.fromJson(e.response!.data);
      }else{
        print(e.message);
        return null;
      }
    }
    catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }


  /*
  Future<BannersResponse?> getBanners() async {
    String url = Api.getBanners();

    var option = Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url, options: option);

      if (response != null) {
        return BannersResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<BannersResponse?> getCompanyBanners() async {
    String url = Api.getCompanyBanners();

    var option = Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url, options: option);

      if (response != null) {
        return BannersResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }

  Future<CategoryMainResponse?> getCategories() async {

    String url = Api.getCategories();

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return CategoryMainResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<SubCategoriesresponse?> getSubCategories() async {

    String url = Api.getSubCategories();

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return SubCategoriesresponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }

  Future<ProductResponse?> getPopular() async {

    String url = Api.getPopular();

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return ProductResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<ProductResponse?> getLatestSearches() async {

    String url = Api.getLatestSearches();

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return ProductResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<ProductResponse?> getlatest_views() async {

    String url = Api.getlatest_views();

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return ProductResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }


  Future<ProductResponse?> getLatestProducts() async {

    String url = Api.getLatestProducts();

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return ProductResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }

  Future<ProductResponse?> getProductsPage(int page,int categoryId,bool isCompany) async {

    String url = Api.getProductsPage(page);
    if(isCompany==true)
    {
      url = Api.getProductsByCompany(page,categoryId);
    }
    else if(categoryId!=globals.publicProducts)
    {
      url = Api.getProductsByCategoryPage(page,categoryId);
    }
    if (categoryId==globals.myProducts)
    {
      url = Api.getProductsByUser(page,categoryId);
    }
    else   if (categoryId==globals.usersProducts)
    {
      url = Api.getProductsByUserId(page,categoryId);
    }
    else   if (categoryId==globals.companyProducts)
    {
      url = Api.getProductsByCompanyId(page,categoryId);
    }

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return ProductResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<ProductResponse?> getProductsPageByUserId(int page,int userId) async {

    String url=Api.getProductsByUserId(page,userId);
    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return ProductResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<ProductResponse?> getProductsByFilter(int page,String prefix ,SubCategory? category,bool isNear,bool isHigh,String lat,String long) async {

    String url=Api.getProductsByFilter(page,prefix , category, isNear, isHigh, lat, long);
    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return ProductResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<ProductDetailsResponse?> getProductDetails(int productId) async {

    String url = Api.getProductDetails(productId);

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return ProductDetailsResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }

  Future<CategoryMainResponse?> getSubCategoriesByParent(int page) async {

    String url = Api.getSubCatByParentId(page);

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return CategoryMainResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<CompanyResponse?> getCompanyPage(int page) async {

    String url = Api.getCompanyPage(page);

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return CompanyResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<PackageResponse?> getPackages() async {

    String url = Api.getPackages();

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return PackageResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<PackageResponse?> getExtraPackages() async {

    String url = Api.getExtraPackages();

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return PackageResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }

  Future<StaticPageResponse?> getSettings() async {

    String url = Api.getSettings();

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return StaticPageResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }

  Future<UserPackages?> getUserPackages() async {

    String url = Api.getUserPackages();

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return UserPackages.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<BuyResponse?> buyPackage(PackageInner? package,PaymentMethods? card) async {
    String url = Api.postPackages();
    var formData = FormData.fromMap({
      'package_id': package!.id,
      'payment_method':  card!.paymentMethodId
    });
    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return BuyResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }

  }
  Future<BuyResponse?> buyAds(PaymentMethods? card,int? numberads) async {
    String url = Api.post_purchase_advs();
    var formData = FormData.fromMap({
      'num_advs': numberads,
      'payment_method':  card!.paymentMethodId
    });
    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return BuyResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }

  }


  Future<GeneralResponse?> logOut() async {

    String url = Api.getlogout();

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.post(url: url,options: option);

      if (response != null) {
        return GeneralResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }

  Future<CreateAccountResponse?> registerUser(UserInfo userInfo) async {

    String url = Api.getRegister();
    var formData = FormData.fromMap({
      'first_name': userInfo.first_name,
      'second_name':  userInfo.second_name,
      'mobile':  userInfo.mobile,
      'password':  userInfo.password,
      'password_confirmation':  userInfo.password_confirmation,
      'gender':  userInfo.gender,
      'type':  userInfo.type,
    });
    var option=  Options(headers: apiUtils.emptyHeaders);
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return CreateAccountResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<LoginResponse?> validateUser(UserInfo userInfo) async {

    String url = Api.getLogin();
    var formData = FormData.fromMap({
      'mobile': userInfo.mobile,
      'password':  userInfo.password,
      'device_type':  userInfo.deviceType,
      'fcm_token' : globals.fcm
    });
    var option=  Options(headers: apiUtils.emptyHeaders);
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return LoginResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<GeneralResponse?> verifyUser(UserInfo userInfo) async {

    String url = Api.getVerify();
    var formData = FormData.fromMap({
      'mobile': userInfo.mobile,
      'password':  userInfo.password,
      'otp_code':  userInfo.otp_code
    });
    var option=  Options(headers: apiUtils.emptyHeaders);
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return GeneralResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<GeneralResponse?> resetUser(UserInfo userInfo) async {
    String url = Api.getrestet_password();
    var formData = FormData.fromMap({
      'mobile': userInfo.mobile,
      'otp_code':  userInfo.otp_code,
      'new_password': userInfo.password,
      'password_confirmation':  userInfo.password_confirmation
    });
    var option=  Options(headers: apiUtils.emptyHeaders);
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return GeneralResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<GeneralResponse?> forget_password(UserInfo userInfo) async {
    String url = Api.getforget_password();
    var formData = FormData.fromMap({
      'mobile': userInfo.mobile,
    });
    var option=  Options(headers: apiUtils.emptyHeaders);
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return GeneralResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<GeneralResponse?> deleteCall(UserInfo userInfo) async {
    String url = Api.getdeleteCall();//MHD
    var formData = FormData.fromMap({
      'mobile': userInfo.mobile,
      'password': userInfo.password,
    });
    var option=  Options(headers: apiUtils.emptyHeaders);
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return GeneralResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<GeneralResponse?> DeleteUserCode(UserInfo userInfo) async {
    String url = Api.getdeleteEnterCode();//MHD
    var formData = FormData.fromMap({
      'otp_code': userInfo.otp_code,
      'mobile': userInfo.mobile,

    });
    var option=  Options(headers: apiUtils.emptyHeaders);
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return GeneralResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }

  Future<MultipartFile> getImage(UserInfo userInfo)async
  {
    return  MultipartFile.fromFile(userInfo.imageFile!.path);
  }
  Future<UpdateProfileResponse?> updateUser(UserInfo userInfo) async {
    String url = Api.getupdateUser();
    var formData = FormData.fromMap({
      'first_name': userInfo.first_name,
      'last_name': userInfo.second_name,
      'mobile': userInfo.mobile,
      'gender': userInfo.gender,
      'type': userInfo.type,
    });
    if(userInfo.isEmptyPassword) {
      if (userInfo.imageFile != null) {
        formData = FormData.fromMap({
          'first_name': userInfo.first_name,
          'last_name': userInfo.second_name,
          'mobile': userInfo.mobile,
          'photo_profile':await getImage( userInfo),
          'gender': userInfo.gender,
          'type': userInfo.type,
        });
      }
    }
    else
    {
      formData = FormData.fromMap({
        'first_name': userInfo.first_name,
        'last_name': userInfo.second_name,
        'mobile': userInfo.mobile,
        'password': userInfo.password,
        'gender': userInfo.gender,
        'type': userInfo.type,
      });
      if (userInfo.imageFile != null) {
        formData = FormData.fromMap({
          'first_name': userInfo.first_name,
          'last_name': userInfo.second_name,
          'mobile': userInfo.mobile,
          'photo_profile': await getImage( userInfo),
          'password': userInfo.password,
          'gender': userInfo.gender,
          'type': userInfo.type,
        });
      }
    }
    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return UpdateProfileResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }

  Future<List<MultipartFile>> getImages(Product info)async
  {
    List<MultipartFile> newList = [];

    for (int i = 0; i < info.resultList.length; i++) {
      var path = await FlutterAbsolutePath.getAbsolutePath(info.resultList[i].identifier);
      var file =await  MultipartFile.fromFile(path);
      newList.add(file);
    }
    return newList;
  }
  Future<AddProductResponse?> addProduct(Product info) async {
    String url = Api.getaddProduct();
    var x= await getImages(info);

    var formData = FormData.fromMap({
      'title': info.title,
      'description': info.desctiption,
      'price': info.price,
      "category_id" :info.subcategoryId,
      'city': info.city,
      'latitude': info.latitude,
      'longitude': info.longitude,
      'mobile': info.mobile,
      'image[]': x,

    });
    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return AddProductResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<AddProductResponse?> editProduct(Product info,int id) async {
    String url = Api.getEditProduct(id);
    var x= await getImages(info);
    var formData = FormData.fromMap({
      'title': info.title,
      'description': info.desctiption,
      'price': info.price,
      "category_id" :info.subcategoryId,
      'city': info.city,
      'latitude': info.latitude,
      'longitude': info.longitude,
      'mobile': info.mobile,

    });

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        if(x.length>0)
        {
          await  callUploadImages(x,id);
        }
        return AddProductResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<GeneralResponse?> callUploadImages(List<MultipartFile> files,int id)async
  {
    String url = Api.upload_product_images(id);
    var formData = FormData.fromMap({
      'image[]': files,

    });
    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.post(url: url,options: option,data: formData);

      if (response != null) {
        return GeneralResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<GeneralResponse?> deleteProduct(Product product) async {
    String url = Api.get_product_delete(product.id);
    Map<String, dynamic>? queryParameters= Map();
    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.post(url: url,options: option,data: null);

      if (response != null) {
        return GeneralResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }

  Future<GeneralResponse?> deleteProductImage(Images images,Product? info) async {
    String url = Api.deleteProductImage(images.id);
    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.post(url: url,options: option);

      if (response != null) {
        return GeneralResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }
  Future<NotificationResponse?> getNotificationList(int page) async {

    String url = Api.getNotificationList(page);

    var option=  Options(headers: apiUtils.getsecureHeaders());
    try {
      final response = await apiUtils.get(url: url,options: option);

      if (response != null) {
        return NotificationResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      apiUtils.handleError(e);
      return null;
    }
  }

   */
}
