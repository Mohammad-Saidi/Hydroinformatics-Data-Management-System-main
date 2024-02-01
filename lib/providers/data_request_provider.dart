import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/models/data_request_info_model.dart';
import 'package:hydroinformatics_data_management_system/services/data_request_service.dart';

import '../main.dart';

class DataRequestProvider extends ChangeNotifier {
  DataRequestInfoModel? dataRequestInfoModel;
  List<DataRequestInfo> dataRequestList = [];

  Future<void> getDataRequestInfo(context) async {
    final data = await DataRequestService.dataRequest();
    if (data != null) {
      if (data["status"] == "success") {
        dataRequestInfoModel = DataRequestInfoModel.fromJson(data);
        notifyListeners();
      }
    } else {
      showDialog(
          barrierDismissible: false,
          context: navigatorKey.currentContext!,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Oops! Something went wrong',
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text('OK'))
              ],
            );
          });
    }
  }

  void getDataRequestList() {
    dataRequestList.clear();
    dataRequestInfoModel!.dataRequestInfo!.forEach((element) {
      dataRequestList.add(element);
    });
    notifyListeners();
  }
}
