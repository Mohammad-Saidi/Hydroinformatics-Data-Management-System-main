import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hydroinformatics_data_management_system/custom/bottom_navigation.dart';
import 'package:hydroinformatics_data_management_system/pages/contact_page.dart';
import 'package:hydroinformatics_data_management_system/pages/data_availability_list_page.dart';
import 'package:hydroinformatics_data_management_system/pages/data_request_details_page.dart';
import 'package:hydroinformatics_data_management_system/pages/data_request_page.dart';
import 'package:hydroinformatics_data_management_system/pages/data_selection_page.dart';
import 'package:hydroinformatics_data_management_system/pages/ground_water_page.dart';
import 'package:hydroinformatics_data_management_system/pages/hydro_graph_page.dart';
import 'package:hydroinformatics_data_management_system/pages/login_page.dart';
import 'package:hydroinformatics_data_management_system/pages/rainfall_graph_page.dart';
import 'package:hydroinformatics_data_management_system/pages/rainfall_page.dart';
import 'package:hydroinformatics_data_management_system/pages/services_page.dart';
import 'package:hydroinformatics_data_management_system/pages/splash_page.dart';
import 'package:hydroinformatics_data_management_system/pages/surface_water_graph_page.dart';
import 'package:hydroinformatics_data_management_system/pages/surface_water_page.dart';
import 'package:hydroinformatics_data_management_system/pages/user_registration_page.dart';
import 'package:hydroinformatics_data_management_system/pages/water_level_availability_search_page.dart';
import 'package:hydroinformatics_data_management_system/pages/water_level_availability_page.dart';
import 'package:hydroinformatics_data_management_system/providers/data_availability_provider.dart';
import 'package:hydroinformatics_data_management_system/providers/data_request_details_provider.dart';
import 'package:hydroinformatics_data_management_system/providers/data_request_provider.dart';
import 'package:hydroinformatics_data_management_system/providers/graph_provider.dart';
import 'package:hydroinformatics_data_management_system/providers/login_provider.dart';
import 'package:hydroinformatics_data_management_system/providers/registration_status_provider.dart';
import 'package:hydroinformatics_data_management_system/providers/station_info_provider.dart';
import 'package:hydroinformatics_data_management_system/providers/subdivision_provider.dart';
import 'package:hydroinformatics_data_management_system/providers/user_details_provider.dart';
import 'package:hydroinformatics_data_management_system/providers/user_registration_provider.dart';
import 'package:hydroinformatics_data_management_system/providers/water_level_availability_provider.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => LoginProvider()),
    ChangeNotifierProvider(create: (context) => StationInfoProvider()),
    ChangeNotifierProvider(create: (context) => GraphProvider()),
    ChangeNotifierProvider(create: (context) => UserRegistrationProvider()),
    ChangeNotifierProvider(create: (context) => UserDetailsProvider()),
    ChangeNotifierProvider(create: (context) => RegistrationStatusProvider()),
    ChangeNotifierProvider(create: (context) => DataRequestProvider()),
    ChangeNotifierProvider(create: (context) => DataRequestDetailsProvider()),
    ChangeNotifierProvider(create: (context) => SubdivisionProvider()),
    ChangeNotifierProvider(create: (context) => DataAvailabilityProvider()),
    ChangeNotifierProvider(
        create: (context) => WaterLevelAvailabilityProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eHIMS',
      theme: ThemeData(),
      navigatorKey: navigatorKey,
      initialRoute: SplashPage.splashPage,
      builder: EasyLoading.init(),
      routes: {
        LoginPage.loginPage: (context) => LoginPage(),
        BottomNavigationPage.bottomNavigationPage: (context) =>
            BottomNavigationPage(),
        ServicesPage.servicesPage: (context) => ServicesPage(),
        DataSelectionPage.dataSelectionPage: (create) => DataSelectionPage(),
        SurfaceWaterPage.surfaceWaterPage: (create) => SurfaceWaterPage(),
        RainfallPage.rainfallPage: (create) => RainfallPage(),
        GroundWaterPage.groundWaterPage: (create) => GroundWaterPage(),
        SplashPage.splashPage: (create) => SplashPage(),
        HydroGraphPage.hydroGraphPage: (create) => HydroGraphPage(),
        UserRegistrationPage.userRegistrationPage: (create) =>
            UserRegistrationPage(),
        DataRequestPage.dataRequestPage: (create) => DataRequestPage(),
        DataRequestDetailsPage.dataRequestDetailsPage: (create) =>
            DataRequestDetailsPage(),
        RainfallGraphPage.rainfallGraphPage: (create) => RainfallGraphPage(),
        ContactPage.contactPage: (create) => ContactPage(),
        WaterLevelAvailabilitySearchPage.waterLevelAvailabilitySearchPage:
            (create) => WaterLevelAvailabilitySearchPage(),
        SurfaceWaterGraphPage.surfaceWaterGraphPage: (create) =>
            SurfaceWaterGraphPage(),
        WaterLevelAvailabilityPage.waterLevelAvailabilityPage: (create) =>
            WaterLevelAvailabilityPage(),
        DataAvailabilityListPage.dataAvailabilityListPage: (create) =>
            DataAvailabilityListPage(),
      },
    );
  }
}
