import 'dart:developer';

import 'package:Challenge_App/models/event_model.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

String formatDate(DateTime now) {
  tz.initializeTimeZones();
  final pacificTimeZone = tz.getLocation('America/Sao_Paulo');
  final data = tz.TZDateTime.from(now, pacificTimeZone);

  //Formato data DD/MM/AA ou DD/MM/AAAA
  //return DateFormat('kk:mm | dd/MM/yyyy').format(data);

  //Formato data e hora
  return DateFormat('kk:mm').format(data);

  //Formato apenas hora
  //return DateFormat('kk:mm').format(data);
}

String formatDateRowEventScreen(DateTime now) {
  tz.initializeTimeZones();
  final pacificTimeZone = tz.getLocation('America/Sao_Paulo');
  final data = tz.TZDateTime.from(now, pacificTimeZone);

  //Formato data DD/MM/AA ou DD/MM/AAAA
  //return DateFormat('kk:mm | dd/MM/yyyy').format(data);

  //Formato data e hora
  //return DateFormat('kk:mm').format(data);
  log(data.toString());
  int currentDay = data.weekday;
  log(currentDay.toString());
  switch (currentDay) {
    case 1:
      return 'SEG';
    case 2:
      return 'TER';
    case 3:
      return 'QUA';
    case 4:
      return 'QUI';
    case 5:
      return 'SEX';
    case 6:
      return 'SAB';
    case 7:
      return 'DOM';

    default:
      return 'erro';
  }

  //Formato apenas hora
  //return DateFormat('kk:mm').format(data);
}
