import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../location.dart';

class FeedbackProvider with ChangeNotifier {
  int? rating;
  String? improvement;
  String? driverId;
  String? clientId;
  String? passengerName;
  String? tripType;
  String? location;
  bool isSaving = false;

  Future<void> saveFeedback() async {
    print(rating);
    print(improvement);
    print(driverId);
    print(clientId);
    print(passengerName);
    print(location);
    try {
      isSaving = true;
      notifyListeners();
      log(jsonEncode({
        "ratings": rating,
        "improvement": improvement ?? '',
        "driverId": driverId,
        "clientId": clientId,
        "passengerName": passengerName,
        "tripType": tripType,
        "geolocation": location ?? ''
      }).toString());
      location = await currentLocation();
      if (location == null) {
        throw "Can't get location";
      }
      final res = await http.post(Uri.parse('https://feedback-c9h6.onrender.com/api/feedback/saveFeedback'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode({
            "ratings": rating,
            "improvement": improvement ?? '',
            "driverId": driverId,
            "clientId": clientId,
            "passengerName": passengerName,
            "tripType": tripType,
            "geolocation": location ?? ''
          }));
      print(res.body);
      print(res.statusCode);
    } catch (e) {
      rethrow;
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }

  Future getCurrentLocation() async {
    try {
      // _isLoading = true;
      // notifyListeners();

      location = await currentLocation();
      print(location);
    } catch (e) {
      // rethrow;
    } finally {
      // _isLoading = false;
      // notifyListeners();
    }
  }
}
