import 'dart:io';

import 'package:flutter/material.dart';
import '../Providers/feedback.dart';
import '../constants.dart';
import 'impove_feedback.dart';
import 'permissions.dart';
import 'thankyou.dart';
import '../widgets/image_color_filter.dart';
import 'package:provider/provider.dart';

class SelectFeedback extends StatefulWidget {
  const SelectFeedback({super.key});

  @override
  State<SelectFeedback> createState() => _SelectFeedbackState();
}

class _SelectFeedbackState extends State<SelectFeedback> {
  bool selected = false;
  int selectedIcon = -1;
  @override
  void initState() {
    getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageWithColorFilter(
        image: const AssetImage(AppConstants.one),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.55),
            // backgroundBlendMode: BlendMode.color,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            // width: 474,
                            child: Text(
                              'We have arrived at your destination',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.sizeOf(context).width > 800 ? 50 : 30,
                                fontFamily: 'Didot',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 34,
                          ),
                          SizedBox(
                            // width: 504,
                            child: Text(
                              'Did this journey meet your expectation ?',
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.sizeOf(context).width > 800 ? 86 : 45,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Didot',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = true;
                                        selectedIcon = 1;
                                      });
                                    },
                                    child: Image.asset(
                                      selected && selectedIcon == 1 ? AppConstants.fill1 : AppConstants.blank1,
                                      height: MediaQuery.sizeOf(context).width > 800 ? 90 : 70,
                                      width: MediaQuery.sizeOf(context).width > 800 ? 90 : 70,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = true;
                                        selectedIcon = 2;
                                      });
                                    },
                                    child: Image.asset(
                                      selected && selectedIcon == 2 ? AppConstants.fill2 : AppConstants.blank2,
                                      height: MediaQuery.sizeOf(context).width > 800 ? 90 : 70,
                                      width: MediaQuery.sizeOf(context).width > 800 ? 90 : 70,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = true;
                                        selectedIcon = 3;
                                      });
                                    },
                                    child: Image.asset(
                                      selected && selectedIcon == 3 ? AppConstants.fill3 : AppConstants.blank3,
                                      height: MediaQuery.sizeOf(context).width > 800 ? 90 : 70,
                                      width: MediaQuery.sizeOf(context).width > 800 ? 90 : 70,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = true;
                                        selectedIcon = 4;
                                      });
                                    },
                                    child: Image.asset(
                                      selected && selectedIcon == 4 ? AppConstants.fill4 : AppConstants.blank4,
                                      height: MediaQuery.sizeOf(context).width > 800 ? 90 : 70,
                                      width: MediaQuery.sizeOf(context).width > 800 ? 90 : 70,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = true;
                                        selectedIcon = 5;
                                      });
                                    },
                                    child: Image.asset(
                                      selected && selectedIcon == 5 ? AppConstants.fill5 : AppConstants.blank5,
                                      height: MediaQuery.sizeOf(context).width > 800 ? 90 : 70,
                                      width: MediaQuery.sizeOf(context).width > 800 ? 90 : 70,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: Container()),
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                    flex: 10,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) {
                          return Colors.white;
                        })),
                        onPressed: () {
                          if (selectedIcon == -1) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(content: Text('Please Give feedback')));
                          } else if (selectedIcon == 5) {
                            Provider.of<FeedbackProvider>(context, listen: false).rating = selectedIcon;
                            Navigator.pushReplacementNamed(context, ThankYou.routeName);
                          } else {
                            Provider.of<FeedbackProvider>(context, listen: false).rating = selectedIcon;
                            Navigator.pushReplacementNamed(
                              context,
                              ImproveFeedBack.routeName,
                            );
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              // fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  getPermission() async {
    if (Platform.isIOS) {
    } else {
      bool granted = await PermissionManager.hasLocationPermissions();

      if (granted) {
        // Storage permissions are granted; you can proceed to pick an image.
        if (context.mounted) {
          Provider.of<FeedbackProvider>(context, listen: false).getCurrentLocation();
        }
      } else {
        // Permissions were not granted; ask the user for permission.
        await PermissionManager.requestLocationPermissions();

        // After requesting permissions, you can check again or handle it further as needed.
        bool rechecked = await PermissionManager.hasLocationPermissions();

        if (rechecked) {
          // Permissions were granted after requesting.
          if (context.mounted) {
            Provider.of<FeedbackProvider>(context, listen: false).getCurrentLocation();
          }
        } else {
          // Handle the case where permissions were not granted even after requesting.
          // You can show a message or take appropriate action.
        }
      }
    }
  }
}
