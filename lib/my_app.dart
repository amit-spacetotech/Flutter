
import 'package:flutter/material.dart';
import 'Providers/feedback.dart';
import 'routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   super.initState();
  //   bool isTablet = Device.get().isTablet;
  //   log(isTablet.toString());
  //   if (isTablet) {
  //     SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  //   } else {
  //     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FeedbackProvider(),
        ),
      ],
      child: MaterialApp(
        // debugShowCheckedModeBanner: false,
        // home: Selec(),
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
