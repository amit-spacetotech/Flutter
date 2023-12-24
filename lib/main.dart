import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'my_app.dart';

void main() async {
  // runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // runApp(const MyApp());

  bool isPhone = Device.get().isPhone;
  log(isPhone.toString());
  if (isPhone) {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(const MyApp());
  } else {
    runApp(const MyApp());
  }

  // runApp(
  //   Builder(
  //     builder: (context) {
  //       if (Device.get().isTablet) {
  //         SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]).then((_) {
  //           return const MyApp();
  //         });
  //       } else {
  //         SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
  //           return const MyApp();
  //         });
  //       }
  //       // if (MediaQuery.sizeOf(context).width < 768) {
  //       //   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
  //       //     return const MyApp();
  //       //   });
  //       // } else {
  //       //   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]).then((_) {
  //       //     return const MyApp();
  //       //   });
  //       // }

  //       return const MyApp();
  //     },
  //   ),
  // );
}
