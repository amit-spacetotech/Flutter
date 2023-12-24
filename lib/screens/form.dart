import 'dart:convert';
import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../models/chauffer.dart';
import '../models/client.dart';
import 'feedbackformthankyou.dart';
import '../widgets/label_text.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Providers/feedback.dart';

class FeedBackForm extends StatefulWidget {
  const FeedBackForm({super.key});
  static const routeName = '/feedbackForm';

  @override
  State<FeedBackForm> createState() => _FeedBackFormState();
}

class _FeedBackFormState extends State<FeedBackForm> {
  final formKey = GlobalKey<FormState>();
  String? chauffername;
  String? client;
  String? passenger;
  String? tripType;
  bool loading = false;
  bool isError = false;
  List<Client> clients = [];
  List<Chauffer> chauffers = [];

  Future getClients() async {
    try {
      final http.Response res =
          await http.get(Uri.parse('https://feedback-c9h6.onrender.com/api/client/getAllClients'));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        for (var element in data['clients']) {
          clients.add(Client.fromJson(element));
        }
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future getChauffers() async {
    try {
      final http.Response res =
          await http.get(Uri.parse('https://feedback-c9h6.onrender.com/api/driver/getAllDrivers'));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        log(data.toString());
        for (var element in data['drivers']) {
          chauffers.add(Chauffer.fromJson(element));
        }
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> fetchData() async {
    try {
      setState(() {
        loading = true;
      });
      // await Future.delayed(Duration(seconds: 100000));
      await getChauffers();
      await getClients();

      setState(() {
        loading = false;
      });
    } catch (error) {
      // Handle any errors that occurred during data fetching
      print("Error: $error");
      setState(() {
        loading = false;
        isError = true;
      });
    }
  }

  @override
  void initState() {
    fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    // print(size);
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: false,
      resizeToAvoidBottomInset: false,
      body: loading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    child: Image.asset("assets/images/loading_gif.gif"),
                  )
                  // CircularProgressIndicator(),
                  // Text(
                  //   'Please wait',
                  //   style: TextStyle(color: Colors.white, fontSize: 18),
                  // )
                ],
              ),
            )
          : Consumer<FeedbackProvider>(builder: (context, value, _) {
              return Stack(
                children: [
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size > 800 ? 80 : 24),
                        child: Form(
                          key: formKey,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size > 800 ? 100 : 40,
                                ),
                                const SizedBox(
                                  width: 474,
                                  child: Text(
                                    'Chauffeur  To Fill',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 34,
                                      fontFamily: 'Didot',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                const LabelText(text: 'Chauffeur Name'),
                                const SizedBox(
                                  height: 4,
                                ),
                                DropdownButtonFormField2<String>(
                                  menuItemStyleData: const MenuItemStyleData(
                                    padding: EdgeInsets.zero,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Field Required';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                    color: chauffername == null ? Colors.white : Colors.black,
                                    fontFamily: 'Montserrat',
                                  ),
                                  onChanged: (newValue) {
                                    chauffername = newValue!.trim();

                                    setState(() {});
                                  },
                                  onSaved: (newValue) {
                                    chauffername = newValue!.trim();
                                  },
                                  items: chauffers.map<DropdownMenuItem<String>>((Chauffer value) {
                                    return DropdownMenuItem<String>(
                                      value: value.id,
                                      child: Text(value.name),
                                    );
                                  }).toList(),
                                  dropdownStyleData: const DropdownStyleData(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 77, 76, 76),
                                      border: Border(),
                                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                                    ),
                                  ),
                                  iconStyleData: IconStyleData(
                                      iconEnabledColor: chauffername != null ? Colors.black : Colors.white),
                                  decoration: InputDecoration(
                                    filled: chauffername != null ? true : false,
                                    fillColor: chauffername != null ? Colors.white : null,
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                const LabelText(text: 'Client'),
                                const SizedBox(
                                  height: 4,
                                ),
                                DropdownButtonFormField2<String>(
                                  // isExpanded: isExpanded,
                                  // focusColor: Colors.amber,
                                  // isDense: true,

                                  menuItemStyleData: const MenuItemStyleData(
                                    padding: EdgeInsets.zero,
                                  ),

                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Field Required';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                    color: client == null ? Colors.white : Colors.black,
                                    fontFamily: 'Montserrat',
                                  ),

                                  onChanged: (newValue) {
                                    client = newValue!.trim();
                                    setState(() {});
                                  },
                                  onSaved: (newValue) {
                                    client = newValue!.trim();
                                  },
                                  items: clients.map<DropdownMenuItem<String>>((Client value) {
                                    return DropdownMenuItem<String>(
                                      value: value.id,
                                      child: Text(value.name),
                                    );
                                  }).toList(),
                                  dropdownStyleData: const DropdownStyleData(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 77, 76, 76),
                                      border: Border(),
                                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                                    ),
                                  ),
                                  iconStyleData:
                                      IconStyleData(iconEnabledColor: client != null ? Colors.black : Colors.white),
                                  decoration: InputDecoration(
                                    filled: client != null ? true : false,
                                    fillColor: client != null ? Colors.white : null,
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                const LabelText(text: 'Passenger Name'),
                                const SizedBox(
                                  height: 4,
                                ),
                                TextFormField(
                                  style:
                                      const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Field Required';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    passenger = value.trim();
                                    setState(() {});
                                  },
                                  onSaved: (newValue) {
                                    passenger = newValue!.trim();
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(left: 25),
                                    filled: passenger != null ? true : false,
                                    fillColor: passenger != null ? Colors.white : null,
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                const LabelText(text: 'Trip Type'),
                                const SizedBox(
                                  height: 4,
                                ),
                                DropdownButtonFormField2<String>(
                                  menuItemStyleData: const MenuItemStyleData(
                                    padding: EdgeInsets.zero,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Field Required';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                    color: tripType == null ? Colors.white : Colors.black,
                                    fontFamily: 'Montserrat',
                                  ),
                                  onChanged: (newValue) {
                                    tripType = newValue!.trim();
                                    setState(() {});
                                  },
                                  onSaved: (newValue) {
                                    tripType = newValue!.trim();
                                  },
                                  items: <String>[
                                    'Hourly',
                                    'Transfer',
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  dropdownStyleData: const DropdownStyleData(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 77, 76, 76),
                                      border: Border(),
                                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                                    ),
                                  ),
                                  iconStyleData:
                                      IconStyleData(iconEnabledColor: tripType != null ? Colors.black : Colors.white),
                                  decoration: InputDecoration(
                                    filled: tripType != null ? true : false,
                                    fillColor: tripType != null ? Colors.white : null,
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) {
                                    return Colors.white;
                                  })),
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      // Perform form submission or other actions here

                                      final feedBackProvider = Provider.of<FeedbackProvider>(context, listen: false);
                                      feedBackProvider.driverId = chauffername;
                                      feedBackProvider.clientId = client;
                                      feedBackProvider.passengerName = passenger;
                                      feedBackProvider.tripType = tripType;
                                      try {
                                        await feedBackProvider.saveFeedback();
                                        if (context.mounted) {
                                          Navigator.pushReplacementNamed(context, FeebbackThankyou.routeName);
                                        }
                                      } catch (e) {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text("Something went wrong. Please try again")));
                                        }
                                      }
                                    }
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        // fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (value.isSaving)
                    // Positioned.fill(
                    // child:
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.black,
                      child: Center(
                          child: SizedBox(
                        height: 200,
                        child: Image.asset("assets/images/loading_gif.gif"),
                      )),
                    ),
                  // ),
                ],
              );
            }),
    );
  }
}
