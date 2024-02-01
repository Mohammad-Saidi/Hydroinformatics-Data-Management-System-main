import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/pages/ground_water_page.dart';
import 'package:hydroinformatics_data_management_system/pages/hydro_graph_page.dart';
import 'package:hydroinformatics_data_management_system/pages/rainfall_graph_page.dart';
import 'package:hydroinformatics_data_management_system/pages/rainfall_page.dart';
import 'package:hydroinformatics_data_management_system/pages/surface_water_graph_page.dart';
import 'package:hydroinformatics_data_management_system/pages/surface_water_page.dart';

class DataSelectionPage extends StatefulWidget {
  const DataSelectionPage({super.key});

  static const String dataSelectionPage = 'dataSelectionPage';

  @override
  State<DataSelectionPage> createState() => _DataSelectionPageState();
}

class _DataSelectionPageState extends State<DataSelectionPage> {
  late String serviceInfo;

  @override
  void didChangeDependencies() {
    serviceInfo = ModalRoute.of(context)!.settings.arguments as String;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF64B5F6),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Process Selection Page',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                'Which action do you want to perform?',
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      if (serviceInfo == 'WL') {
                        Navigator.of(context)
                            .pushNamed(SurfaceWaterPage.surfaceWaterPage);
                      }

                      if (serviceInfo == 'RF') {
                        Navigator.of(context)
                            .pushNamed(RainfallPage.rainfallPage);
                      }

                      if (serviceInfo == 'GW') {
                        Navigator.of(context)
                            .pushNamed(GroundWaterPage.groundWaterPage);
                      }
                    },
                    child: Column(
                      children: [
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('images/data_entry.png'),
                            )),
                        const SizedBox(
                          height: 3,
                        ),
                        Text('Data Entry',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      if (serviceInfo == 'GW') {
                        Navigator.of(context)
                            .pushNamed(HydroGraphPage.hydroGraphPage);
                      }

                      if (serviceInfo == 'RF') {
                        Navigator.of(context)
                            .pushNamed(RainfallGraphPage.rainfallGraphPage);
                      }

                      if (serviceInfo == 'WL') {
                        Navigator.of(context).pushNamed(
                            SurfaceWaterGraphPage.surfaceWaterGraphPage);
                      }
                    },
                    child: Column(
                      children: [
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('images/data_list.png'),
                            )),
                        const SizedBox(
                          height: 3,
                        ),
                        Text('Data List',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
