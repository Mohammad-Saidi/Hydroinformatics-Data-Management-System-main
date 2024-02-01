import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/models/surface_water_graph_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../providers/graph_provider.dart';
import '../providers/station_info_provider.dart';

class SurfaceWaterGraphPage extends StatefulWidget {
  const SurfaceWaterGraphPage({super.key});

  static const String surfaceWaterGraphPage = "surfaceWaterGraphPage";

  @override
  State<SurfaceWaterGraphPage> createState() => _SurfaceWaterGraphPageState();
}

class _SurfaceWaterGraphPageState extends State<SurfaceWaterGraphPage> {
  late StationInfoProvider stationInfoProvider;
  bool callOnce = false;
  dynamic selectedStation;
  dynamic selectedKeyword;
  TextEditingController toDateController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late GraphProvider graphProvider;

  @override
  void didChangeDependencies() {
    stationInfoProvider = Provider.of(context, listen: true);
    graphProvider = Provider.of(context, listen: true);
    if (callOnce == false && stationInfoProvider.stationInfo.isNotEmpty) {
      stationInfoProvider.stationName.clear();
      stationInfoProvider.getStationName();
      selectedStation = stationInfoProvider.stationName[0];
      selectedKeyword = stationInfoProvider.getStationKeyword(selectedStation);
      callOnce = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Surface Water Graph Page',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: stationInfoProvider.stationInfo.isEmpty
                ? Text(
                    'Nothing to show ...',
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  )
                : Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'Station Name',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DropdownSearch<String>(
                          items: stationInfoProvider.stationName,
                          popupProps: const PopupProps.menu(
                            showSearchBox: true,
                          ),
                          dropdownButtonProps: const DropdownButtonProps(
                            color: Colors.black,
                          ),
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            textAlignVertical: TextAlignVertical.center,
                            dropdownSearchDecoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    top: 12, bottom: 12, left: 8, right: 8),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1))),
                          ),
                          onChanged: (value) {
                            setState(() async {
                              selectedStation = value.toString();
                              selectedKeyword = stationInfoProvider
                                  .getStationKeyword(selectedStation);
                            });
                          },
                          selectedItem: selectedStation,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'From Date',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'To Date',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Select a date';
                                  }
                                },
                                controller: fromDateController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1950),
                                                lastDate: DateTime(2100));

                                        if (pickedDate != null) {
                                          String formattedDate =
                                              DateFormat('dd-MM-yyyy')
                                                  .format(pickedDate);
                                          print('From date: ${formattedDate}');
                                          setState(() {
                                            fromDateController.text =
                                                formattedDate;
                                          });
                                        } else {}
                                      },
                                      icon: const Icon(
                                        Icons.date_range,
                                        color: Colors.blue,
                                      )),
                                  contentPadding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 15, bottom: 15),
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
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Select a date';
                                  }
                                },
                                controller: toDateController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1950),
                                                lastDate: DateTime(2100));

                                        if (pickedDate != null) {
                                          String formattedDate =
                                              DateFormat('dd-MM-yyyy')
                                                  .format(pickedDate);
                                          print('to date: ${formattedDate}');
                                          setState(() {
                                            toDateController.text =
                                                formattedDate;
                                          });
                                        } else {}
                                      },
                                      icon: const Icon(
                                        Icons.date_range,
                                        color: Colors.blue,
                                      )),
                                  contentPadding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 15, bottom: 15),
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
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                graphProvider
                                    .showSurfaceWaterGraph(
                                        selectedKeyword,
                                        fromDateController.text,
                                        toDateController.text,
                                        "WL",
                                        context)
                                    .then((value) {
                                  if (graphProvider
                                      .surfaceWaterDataList.isNotEmpty) {
                                    showDialog<String>(
                                        context: context,
                                        builder:
                                            (BuildContext context) =>
                                                AlertDialog(
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  insetPadding:
                                                      const EdgeInsets.all(10),
                                                  content: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text(
                                                            "Station Name: ${selectedStation}",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                          ),
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Container(
                                                                    width: 20,
                                                                    height: 10,
                                                                    color: Colors
                                                                        .blue,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text("6:00")
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  Container(
                                                                    width: 20,
                                                                    height: 10,
                                                                    color: Colors
                                                                        .green,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text("9:00")
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  Container(
                                                                    width: 20,
                                                                    height: 10,
                                                                    color: Colors
                                                                        .amber,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text("12:00")
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  Container(
                                                                    width: 20,
                                                                    height: 10,
                                                                    color: Colors
                                                                        .purple,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text("15:00")
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  Container(
                                                                    width: 20,
                                                                    height: 10,
                                                                    color: Colors
                                                                        .cyan,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text("18:00")
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 40,
                                                          ),
                                                          SfCartesianChart(
                                                              primaryXAxis:
                                                                  CategoryAxis(
                                                                      title: AxisTitle(
                                                                          text:
                                                                              'Date')),
                                                              primaryYAxis: NumericAxis(
                                                                  title: AxisTitle(
                                                                      text:
                                                                          'WL(m)')),
                                                              series: <CartesianSeries>[
                                                                // Renders line chart
                                                                LineSeries<
                                                                        WlData,
                                                                        String>(
                                                                    dataSource:
                                                                        graphProvider
                                                                            .surfaceWaterDataList,
                                                                    xValueMapper:
                                                                        (WlData data, _) =>
                                                                            data
                                                                                .logDate,
                                                                    yValueMapper:
                                                                        (WlData data,
                                                                            _) {
                                                                      // Check if the value is empty or non-numeric
                                                                      if (data.hr6!
                                                                              .isNotEmpty &&
                                                                          num.tryParse(data.hr6!) !=
                                                                              null) {
                                                                        // Parse the valid value to double
                                                                        return num.parse(
                                                                            data.hr6!);
                                                                      } else {
                                                                        // Return a default value or null to skip the data point
                                                                        return 0.0; // You can set this to a default value or null
                                                                      }
                                                                    },
                                                                    name: 'hr6',
                                                                    color: Colors
                                                                        .blue),

                                                                LineSeries<
                                                                        WlData,
                                                                        String>(
                                                                    dataSource:
                                                                        graphProvider
                                                                            .surfaceWaterDataList,
                                                                    xValueMapper:
                                                                        (WlData data, _) =>
                                                                            data
                                                                                .logDate,
                                                                    yValueMapper:
                                                                        (WlData data,
                                                                            _) {
                                                                      // Check if the value is empty or non-numeric
                                                                      if (data.hr9!
                                                                              .isNotEmpty &&
                                                                          num.tryParse(data.hr9!) !=
                                                                              null) {
                                                                        // Parse the valid value to double
                                                                        return num.parse(
                                                                            data.hr9!);
                                                                      } else {
                                                                        // Return a default value or null to skip the data point
                                                                        return 0.0; // You can set this to a default value or null
                                                                      }
                                                                    },
                                                                    name: 'hr9',
                                                                    color: Colors
                                                                        .green),

                                                                LineSeries<
                                                                        WlData,
                                                                        String>(
                                                                    dataSource:
                                                                        graphProvider
                                                                            .surfaceWaterDataList,
                                                                    xValueMapper:
                                                                        (WlData data, _) =>
                                                                            data
                                                                                .logDate,
                                                                    yValueMapper:
                                                                        (WlData data,
                                                                            _) {
                                                                      // Check if the value is empty or non-numeric
                                                                      if (data.hr12!
                                                                              .isNotEmpty &&
                                                                          num.tryParse(data.hr12!) !=
                                                                              null) {
                                                                        // Parse the valid value to double
                                                                        return num.parse(
                                                                            data.hr12!);
                                                                      } else {
                                                                        // Return a default value or null to skip the data point
                                                                        return 0.0; // You can set this to a default value or null
                                                                      }
                                                                    },
                                                                    name:
                                                                        'hr12',
                                                                    color: Colors
                                                                        .amber),

                                                                LineSeries<
                                                                        WlData,
                                                                        String>(
                                                                    dataSource:
                                                                        graphProvider
                                                                            .surfaceWaterDataList,
                                                                    xValueMapper:
                                                                        (WlData data, _) =>
                                                                            data
                                                                                .logDate,
                                                                    yValueMapper:
                                                                        (WlData data,
                                                                            _) {
                                                                      // Check if the value is empty or non-numeric
                                                                      if (data.hr15!
                                                                              .isNotEmpty &&
                                                                          num.tryParse(data.hr15!) !=
                                                                              null) {
                                                                        // Parse the valid value to double
                                                                        return num.parse(
                                                                            data.hr15!);
                                                                      } else {
                                                                        // Return a default value or null to skip the data point
                                                                        return 0.0; // You can set this to a default value or null
                                                                      }
                                                                    },
                                                                    name:
                                                                        'hr15',
                                                                    color: Colors
                                                                        .purple),

                                                                LineSeries<
                                                                        WlData,
                                                                        String>(
                                                                    dataSource:
                                                                        graphProvider
                                                                            .surfaceWaterDataList,
                                                                    xValueMapper:
                                                                        (WlData data, _) =>
                                                                            data
                                                                                .logDate,
                                                                    yValueMapper:
                                                                        (WlData data,
                                                                            _) {
                                                                      // Check if the value is empty or non-numeric
                                                                      if (data.hr18!
                                                                              .isNotEmpty &&
                                                                          num.tryParse(data.hr18!) !=
                                                                              null) {
                                                                        // Parse the valid value to double
                                                                        return num.parse(
                                                                            data.hr18!);
                                                                      } else {
                                                                        // Return a default value or null to skip the data point
                                                                        return 0.0; // You can set this to a default value or null
                                                                      }
                                                                    },
                                                                    name:
                                                                        'hr18',
                                                                    color: Colors
                                                                        .cyan),
                                                              ]),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child: ListView
                                                                .builder(
                                                              physics:
                                                                  NeverScrollableScrollPhysics(),
                                                              shrinkWrap: true,
                                                              itemCount:
                                                                  graphProvider
                                                                      .surfaceWaterDataList
                                                                      .length,
                                                              itemBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      int index) {
                                                                return Card(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  elevation: 5,
                                                                  color: Colors
                                                                      .blue,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            10),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Text(
                                                                          "Date: ${graphProvider.surfaceWaterDataList[index].logDate}",
                                                                          style: GoogleFonts.poppins(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w400,
                                                                              color: Colors.white),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              5,
                                                                        ),
                                                                        Table(
                                                                          border:
                                                                              TableBorder.all(color: Colors.white),
                                                                          children: [
                                                                            TableRow(children: [
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    'Time',
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    'WL(m)',
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                            TableRow(children: [
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    '6:00',
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    graphProvider.surfaceWaterDataList[index].hr6!,
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                            TableRow(children: [
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    '9:00',
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    graphProvider.surfaceWaterDataList[index].hr9!,
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                            TableRow(children: [
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    '12:00',
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    graphProvider.surfaceWaterDataList[index].hr12!,
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                            TableRow(children: [
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    '15:00',
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    graphProvider.surfaceWaterDataList[index].hr15!,
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                            TableRow(children: [
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    '18:00',
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5),
                                                                                  child: Text(
                                                                                    graphProvider.surfaceWaterDataList[index].hr18!,
                                                                                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                elevation: 5,
                                                                backgroundColor:
                                                                    Colors.blue,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8))),
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            child: Text('OK',
                                                                style: GoogleFonts.poppins(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ));
                                  } else if (graphProvider
                                      .surfaceWaterDataList.isEmpty) {
                                    var snackBar = const SnackBar(
                                        content: Text(
                                            'Your selected date range has no data'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                });
                              }
                            },
                            child: Text('Show Graph',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white))),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
