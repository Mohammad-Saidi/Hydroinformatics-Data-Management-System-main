import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/get_hydro_data_model.dart';
import '../providers/station_info_provider.dart';
import '../services/data_entry_service.dart';
import '../services/fetch_station_data_service.dart';

class GroundWaterPage extends StatefulWidget {
  const GroundWaterPage({super.key});

  static const String groundWaterPage = 'groundWaterPage';

  @override
  State<GroundWaterPage> createState() => _GroundWaterPageState();
}

class _GroundWaterPageState extends State<GroundWaterPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late StationInfoProvider stationInfoProvider;
  bool callOnce = false;
  late dynamic selectedStation;
  late String selectedKeyword;
  GetHydroDataModel? getHydroDataModel;
  TextEditingController datePickerController = TextEditingController();
  TextEditingController nineAmController = TextEditingController();

  @override
  void initState() {
    DateTime currentDate = DateTime.now();

    String formattedDate = DateFormat('dd-MM-yyyy').format(currentDate);

    super.initState();
    datePickerController.text = formattedDate;
  }

  @override
  void didChangeDependencies() {
    stationInfoProvider = Provider.of(context, listen: true);
    if (callOnce == false && stationInfoProvider.stationInfo.isNotEmpty) {
      getHydroDataModel = GetHydroDataModel();
      stationInfoProvider.stationName.clear();
      stationInfoProvider.getStationName();
      selectedStation = stationInfoProvider.stationName[0];
      selectedKeyword = stationInfoProvider.getStationKeyword(selectedStation);
      callOnce = true;
    }

    super.didChangeDependencies();

    if (stationInfoProvider.stationInfo.isNotEmpty) {
      String value =
          checkIntorDouble(stationInfoProvider.getHydroDataModel.value ?? '');
      nineAmController.text = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('selectedKeyword: $selectedKeyword');
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Ground Water Page',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
            margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: stationInfoProvider.stationInfo.isEmpty
                  ? Text(
                      'You have no assigned station ...',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Well ID',
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DropdownSearch<String>(
                                    items: stationInfoProvider.stationName,
                                    popupProps: const PopupProps.menu(
                                      showSearchBox: true,
                                    ),
                                    dropdownButtonProps:
                                        const DropdownButtonProps(
                                      color: Colors.black,
                                    ),
                                    dropdownDecoratorProps:
                                        DropDownDecoratorProps(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      dropdownSearchDecoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              top: 12,
                                              bottom: 12,
                                              left: 8,
                                              right: 8),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1))),
                                    ),
                                    onChanged: (value) {
                                      setState(() async {
                                        selectedStation = value.toString();
                                        selectedKeyword = stationInfoProvider
                                            .getStationKeyword(selectedStation);
                                        dynamic info =
                                            await FetchStationDataService
                                                .fetchHydroData(selectedKeyword,
                                                    datePickerController.text);

                                        if (info != null) {
                                          GetHydroDataModel getHydroDataModel =
                                              GetHydroDataModel.fromJson(info);

                                          String value = checkIntorDouble(
                                              getHydroDataModel.value ?? '');

                                          nineAmController.text = value;
                                        } else {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Something went wrong'),
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
                                      });
                                    },
                                    selectedItem: selectedStation,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Date',
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: datePickerController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () async {
                                            DateTime? pickedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: selectedDate(),
                                              firstDate: DateTime(1950),
                                              lastDate: DateTime(2100),
                                              selectableDayPredicate:
                                                  (DateTime date) {
                                                return date.weekday != 1
                                                    ? false
                                                    : true;
                                              },
                                            );

                                            if (pickedDate != null) {
                                              String formattedDate =
                                                  DateFormat('dd-MM-yyyy')
                                                      .format(pickedDate);
                                              setState(() async {
                                                datePickerController.text =
                                                    formattedDate;

                                                dynamic info =
                                                    await FetchStationDataService
                                                        .fetchHydroData(
                                                            selectedKeyword,
                                                            datePickerController
                                                                .text);

                                                if (info != null) {
                                                  GetHydroDataModel
                                                      getHydroDataModel =
                                                      GetHydroDataModel
                                                          .fromJson(info);
                                                  String value =
                                                      checkIntorDouble(
                                                          getHydroDataModel
                                                                  .value ??
                                                              '');

                                                  nineAmController.text = value;
                                                } else {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Something went wrong'),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  SystemNavigator
                                                                      .pop();
                                                                },
                                                                child:
                                                                    Text('OK'))
                                                          ],
                                                        );
                                                      });
                                                }
                                              });
                                            } else {}
                                          },
                                          icon: const Icon(
                                            Icons.date_range,
                                            color: Colors.blue,
                                          )),
                                      contentPadding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                          top: 15,
                                          bottom: 15),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 3,
                            ),
                            Expanded(
                              child: Text(
                                'Station: ${selectedStation}',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text('Date: ${datePickerController.text}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "09:00",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: TextFormField(
                                    validator: (value) {
                                      RegExp pattern1 =
                                          RegExp(r'^\d{0,3}\.\d{1,3}$');
                                      RegExp pattern2 = RegExp(r'^\d+$');

                                      if (value == null || value.isEmpty) {
                                        return 'Please provide a value';
                                      }

                                      if (!((pattern1.hasMatch(value)) ||
                                          (pattern2.hasMatch(value)))) {
                                        return 'Please provide a valid value';
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    controller: nineAmController,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                          top: 15,
                                          bottom: 15),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      errorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                    ),
                                  )),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '(m)',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50),
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                DataEntryService.hydroDataEntry(
                                  selectedKeyword,
                                  datePickerController.text,
                                  nineAmController.text,
                                  '9:00',
                                ).then((value) {
                                  if (value != null) {
                                    showDialog<String>(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: Text(value['message']),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    showDialog<String>(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: const Text(
                                            "OOPS! Something went wrong"),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child:
                                                const Center(child: Text('OK')),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                });
                              }
                            },
                            child: Text(
                              'Submit',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ))
                      ],
                    ),
            )),
      ),
    );
  }

  String checkIntorDouble(String value) {
    if (value.contains(".")) {
      return value;
    } else if (value == "") {
      return "";
    } else {
      double convertedValue = double.parse(value);
      String desiredValue = convertedValue.toStringAsFixed(1);
      return desiredValue;
    }
  }

  DateTime selectedDate() {
    DateTime selectedDate = DateTime.now();
    selectedDate =
        selectedDate.subtract(Duration(days: selectedDate.weekday - 1));
    return selectedDate;
  }
}
