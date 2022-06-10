import 'dart:convert';
import 'dart:developer';

import 'package:Challenge_App/models/event_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Future<void> saveData(EventModel eventList) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    final convertedValue = jsonEncode(eventList.toJson());

    inspect(convertedValue);
    shared.setString('eventList', convertedValue);
  }

  Future<EventModel> getData() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    final eventData = shared.getString('eventData');
    final response = EventModel.fromJson(jsonDecode(eventData!));
    return response;
  }
}
