import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/models/data_request_details_model.dart';
import 'package:hydroinformatics_data_management_system/services/data_request_details_service.dart';

import '../main.dart';

class DataRequestDetailsProvider extends ChangeNotifier {
  DataRequestDetailsModel? dataRequestDetailsModel;

  List<RequestedDataInfo> requestedDataInfoList = [];

  Future<void> getDataRequestDetails(id, context) async {
    final data = await DataRequestDetailsService.dataRequestDetails(id);

    if (data != null) {
      if (data["status"] == "success") {
        dataRequestDetailsModel = DataRequestDetailsModel.fromJson(data);
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
                      //SystemNavigator.pop();
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'))
              ],
            );
          });
    }
  }

  void getDataRequestList() {
    requestedDataInfoList.clear();
    dataRequestDetailsModel!.requestedDataInfo!.forEach((element) {
      requestedDataInfoList.add(element);
    });
  }
}
