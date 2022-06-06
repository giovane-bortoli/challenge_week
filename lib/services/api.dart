import 'dart:developer';
import 'dart:math';
import 'package:Challenge_App/models/event_model.dart';
import 'package:dio/dio.dart';

class ClientHttp {
  final dio = Dio();

  Future<List<EventModel>> getEvent() async {
    try {
      final response = await dio
          .get('https://628e3133368687f3e7121f1a.mockapi.io/api/v1/events');
      inspect(response.data);

      return List.from(response.data)
          .map((event) => EventModel.fromJson(event))
          .toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
