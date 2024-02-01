import 'package:flutter/material.dart';
import 'package:hydroinformatics_data_management_system/models/user_registration_model.dart';
import 'package:hydroinformatics_data_management_system/services/user_registration_service.dart';

class UserRegistrationProvider extends ChangeNotifier {
  UserRegistrationModel? userRegistrationModel;
  List<Message> dataList = [];

  Future<void> getRegistrationInfo(context) async {
    final data = await UserRegistrationService.userRegistration();

    if (data != null) {
      userRegistrationModel = UserRegistrationModel.fromJson(data);
      notifyListeners();

    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: const Text('Oops! Something went wrong'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  getPendingRegistrationInfo() {
    dataList.clear();
    userRegistrationModel!.message!.forEach((element) {
      dataList.add(element);
    });
    notifyListeners();
  }

}
