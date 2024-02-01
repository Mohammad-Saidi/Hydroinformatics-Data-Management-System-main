import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydroinformatics_data_management_system/models/user_details_model.dart';
import 'package:hydroinformatics_data_management_system/services/user-details_service.dart';

class UserDetailsProvider extends ChangeNotifier {
  UserDetailsModel? userDetailsModel;

  Future<void> getUserInfo(id, context) async {
    final data = await UserDetailsService.UserDetails(id);

    if (data != null) {
      userDetailsModel = UserDetailsModel.fromJson(data);
      print(userDetailsModel!.status);
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
}
