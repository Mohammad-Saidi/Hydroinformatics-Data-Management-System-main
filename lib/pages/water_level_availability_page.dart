import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydroinformatics_data_management_system/pages/water_level_availability_search_page.dart';
import 'package:hydroinformatics_data_management_system/providers/subdivision_provider.dart';
import 'package:hydroinformatics_data_management_system/providers/water_level_availability_provider.dart';
import 'package:provider/provider.dart';

class WaterLevelAvailabilityPage extends StatefulWidget {
  const WaterLevelAvailabilityPage({super.key});

  static const String waterLevelAvailabilityPage = 'waterLevelAvailabilityPage';

  @override
  State<WaterLevelAvailabilityPage> createState() =>
      _WaterLevelAvailabilityPageState();
}

class _WaterLevelAvailabilityPageState
    extends State<WaterLevelAvailabilityPage> {
  late WaterLevelAvailabilityProvider waterLevelAvailabilityProvider;
  late SubdivisionProvider subdivisionProvider;
  bool callOnce = true;

  @override
  void didChangeDependencies() {
    waterLevelAvailabilityProvider = Provider.of(context, listen: true);
    subdivisionProvider = Provider.of(context);

    if (callOnce) {
      waterLevelAvailabilityProvider.getWaterLevelAvailability(context);
      callOnce = false;
    }

    super.didChangeDependencies();
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
          'Water Level Availability',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: waterLevelAvailabilityProvider.surfaceWaterList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: waterLevelAvailabilityProvider
                          .surfaceWaterList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            EasyLoading.show();
                            subdivisionProvider
                                .getSubdivision(
                                    context,
                                    waterLevelAvailabilityProvider
                                        .surfaceWaterList[index].serialNo!)
                                .then((value) {
                              EasyLoading.dismiss();
                              Navigator.of(context).pushNamed(
                                  WaterLevelAvailabilitySearchPage
                                      .waterLevelAvailabilitySearchPage);
                            });
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      height: 40,
                                      child: Image.network(
                                          waterLevelAvailabilityProvider
                                              .surfaceWaterList[index].icon!)),
                                  FittedBox(
                                    child: Text(
                                        waterLevelAvailabilityProvider
                                            .surfaceWaterList[index].name!,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
