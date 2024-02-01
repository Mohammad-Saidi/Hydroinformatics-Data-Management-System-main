import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hydroinformatics_data_management_system/pages/login_page.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom/bottom_navigation.dart';
import '../providers/login_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const String splashPage = 'splashPage';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late LoginProvider loginProvider;

  @override
  void initState() {
    loginProvider = Provider.of(context, listen: false);
    Future.delayed(const Duration(seconds: 5)).then((value) async {
      final SharedPreferences loginPref = await SharedPreferences.getInstance();
      final String? userName = await loginPref.getString('userName');
      final String? password = await loginPref.getString('password');
      if (userName != null && userName.isNotEmpty) {
        if (password != null && password.isNotEmpty) {
          loginProvider.getLoginInfo(userName, password).then((value) async {
            if (value != null) {
              if (value['status'] == 'success') {
                Navigator.of(context).pushReplacementNamed(
                    BottomNavigationPage.bottomNavigationPage);
              } else if (value['status'] == 'error') {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Error!!!'),
                        content: const Text(
                            "Something went wrong. Please try again later"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                SystemChannels.platform
                                    .invokeMethod('SystemNavigator.pop');
                              },
                              child: Text('Close'))
                        ],
                      );
                    });
              }
            } else {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Error!!!'),
                      content:
                          const Text("Something went wrong. Please try again later"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              SystemChannels.platform
                                  .invokeMethod('SystemNavigator.pop');
                            },
                            child: const Text('Close'))
                      ],
                    );
                  });
            }
          });
        }
      } else {
        Navigator.of(context).pushReplacementNamed(LoginPage.loginPage);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF64B5F6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.white,
              size: 50,
            ),
          )
        ],
      ),
    );
  }
}
