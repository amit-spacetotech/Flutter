import 'package:flutter/material.dart';
import '../Providers/feedback.dart';
import '../constants.dart';
import 'thankyou2.dart';
import '../widgets/image_color_filter.dart';
import 'package:provider/provider.dart';

class ImproveFeedBack extends StatefulWidget {
  static const routeName = '/improve-feedback';
  const ImproveFeedBack({super.key});

  @override
  State<ImproveFeedBack> createState() => _ImproveFeedBackState();
}

class _ImproveFeedBackState extends State<ImproveFeedBack> {
  bool selected = false;
  int selectedText = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageWithColorFilter(
        image: const AssetImage(
          AppConstants.ipad,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.55),
            // backgroundBlendMode: BlendMode.color,
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 10,
                      child: MediaQuery.sizeOf(context).width > 800
                          ? SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    // width: 504,
                                    child: Text(
                                      ' What we could have improved ?',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: MediaQuery.sizeOf(context).width > 800 ? 64 : 40,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'Didot',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 34,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = true;
                                        selectedText = 1;
                                      });
                                    },
                                    child: Container(
                                      width: 433,
                                      // margin: const EdgeInsets.symmetric(vertical: 8),
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      decoration: BoxDecoration(
                                        color: selected && selectedText == 1 ? Colors.white : null,
                                        border: const Border(
                                          bottom: BorderSide(color: Colors.white),
                                        ),
                                      ),
                                      child: Text(
                                        'Timeliness',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: MediaQuery.sizeOf(context).width > 800 ? 34 : 25,
                                            fontWeight: FontWeight.bold,
                                            color: selectedText == 1 ? Colors.black : Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 34),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = true;
                                        selectedText = 2;
                                      });
                                    },
                                    child: Container(
                                      width: 433,
                                      // margin: const EdgeInsets.symmetric(vertical: 8),
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      decoration: BoxDecoration(
                                        color: selected && selectedText == 2 ? Colors.white : null,
                                        border: const Border(
                                          bottom: BorderSide(color: Colors.white),
                                        ),
                                      ),
                                      child: Text(
                                        'Amenities in the car',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: MediaQuery.sizeOf(context).width > 800 ? 34 : 25,
                                            fontWeight: FontWeight.w600,
                                            color: selectedText == 2 ? Colors.black : Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 34),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = true;
                                        selectedText = 3;
                                      });
                                    },
                                    child: Container(
                                      width: 433,
                                      // margin: const EdgeInsets.symmetric(vertical: 8),
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      decoration: BoxDecoration(
                                        color: selected && selectedText == 3 ? Colors.white : null,
                                        border: const Border(
                                          bottom: BorderSide(color: Colors.white),
                                        ),
                                      ),
                                      child: Text(
                                        'Cleanliness of the car',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: MediaQuery.sizeOf(context).width > 800 ? 34 : 25,
                                            fontWeight: FontWeight.bold,
                                            color: selectedText == 3 ? Colors.black : Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 34),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = true;
                                        selectedText = 4;
                                      });
                                    },
                                    child: Container(
                                      width: 433,
                                      // margin: const EdgeInsets.symmetric(vertical: 8),
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      decoration: BoxDecoration(
                                        color: selected && selectedText == 4 ? Colors.white : null,
                                        border: const Border(
                                          bottom: BorderSide(color: Colors.white),
                                        ),
                                      ),
                                      child: Text(
                                        'Chauffeur',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: MediaQuery.sizeOf(context).width > 800 ? 34 : 25,
                                            fontWeight: FontWeight.bold,
                                            color: selectedText == 4 ? Colors.black : Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  // width: 504,
                                  child: Text(
                                    ' What we could have improved ?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: MediaQuery.sizeOf(context).width > 800 ? 64 : 40,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'Didot',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 34,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selected = true;
                                      selectedText = 1;
                                    });
                                  },
                                  child: Container(
                                    width: 433,
                                    // margin: const EdgeInsets.symmetric(vertical: 8),
                                    padding: const EdgeInsets.symmetric(vertical: 15),
                                    decoration: BoxDecoration(
                                      color: selected && selectedText == 1 ? Colors.white : null,
                                      border: const Border(
                                        bottom: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    child: Text(
                                      'Timeliness',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: MediaQuery.sizeOf(context).width > 800 ? 34 : 25,
                                          fontWeight: FontWeight.bold,
                                          color: selectedText == 1 ? Colors.black : Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 34),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selected = true;
                                      selectedText = 2;
                                    });
                                  },
                                  child: Container(
                                    width: 433,
                                    // margin: const EdgeInsets.symmetric(vertical: 8),
                                    padding: const EdgeInsets.symmetric(vertical: 15),
                                    decoration: BoxDecoration(
                                      color: selected && selectedText == 2 ? Colors.white : null,
                                      border: const Border(
                                        bottom: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    child: Text(
                                      'Amenities in the car',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: MediaQuery.sizeOf(context).width > 800 ? 34 : 25,
                                          fontWeight: FontWeight.w600,
                                          color: selectedText == 2 ? Colors.black : Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 34),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selected = true;
                                      selectedText = 3;
                                    });
                                  },
                                  child: Container(
                                    width: 433,
                                    // margin: const EdgeInsets.symmetric(vertical: 8),
                                    padding: const EdgeInsets.symmetric(vertical: 15),
                                    decoration: BoxDecoration(
                                      color: selected && selectedText == 3 ? Colors.white : null,
                                      border: const Border(
                                        bottom: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    child: Text(
                                      'Cleanliness of the car',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: MediaQuery.sizeOf(context).width > 800 ? 34 : 25,
                                          fontWeight: FontWeight.bold,
                                          color: selectedText == 3 ? Colors.black : Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 34),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selected = true;
                                      selectedText = 4;
                                    });
                                  },
                                  child: Container(
                                    width: 433,
                                    // margin: const EdgeInsets.symmetric(vertical: 8),
                                    padding: const EdgeInsets.symmetric(vertical: 15),
                                    decoration: BoxDecoration(
                                      color: selected && selectedText == 4 ? Colors.white : null,
                                      border: const Border(
                                        bottom: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    child: Text(
                                      'Chauffeur',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: MediaQuery.sizeOf(context).width > 800 ? 34 : 25,
                                          fontWeight: FontWeight.bold,
                                          color: selectedText == 4 ? Colors.black : Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 10,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) {
                              return Colors.white;
                            })),
                            onPressed: () {
                              // Navigator.pushNamed(context, FeebbackThankyou.routeName);
                              if (selectedText == -1) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please Select one option from the following'),
                                  ),
                                );
                              } else {
                                String val;
                                if (selectedText == 1) {
                                  val = 'Timeliness';
                                } else if (selectedText == 2) {
                                  val = 'Amenities in the car';
                                } else if (selectedText == 3) {
                                  val = 'Cleanliness of the car';
                                } else {
                                  val = 'Chauffeur';
                                }
                                final value = Provider.of<FeedbackProvider>(context, listen: false);
                                value.improvement = val;
                                Navigator.pushReplacementNamed(context, FeebbackThankyou2.routeName);
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
                            )),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
