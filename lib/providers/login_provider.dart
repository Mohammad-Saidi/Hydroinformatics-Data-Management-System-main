import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydroinformatics_data_management_system/models/login_model.dart';
import 'package:hydroinformatics_data_management_system/services/login_service.dart';

class LoginProvider extends ChangeNotifier {
  LoginModel? loginModel;
  List<ServiceInfo> serviceInfo = [];

  Future<dynamic> getLoginInfo(String email, String password) async {

    final data = await LoginService.userLogin(email, password);

    if (data != null) {
      try {
        loginModel = LoginModel.fromJson(data);
        print("11111111111");
        return data;
      } catch (e) {
        print('22222222222');
        return data;
      }
    } else {
      print("333333333333");
      return data;

    }
  }

  void getServiceInfo() {
    serviceInfo.clear();
    loginModel!.serviceInfo!.forEach((element) {
      serviceInfo.add(element);
    });
  }
}
