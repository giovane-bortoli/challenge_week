import 'dart:async';

import 'package:Challenge_App/shared/utils/set_maps_position.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventDetailsMap extends StatefulWidget {
  const EventDetailsMap({Key? key}) : super(key: key);

  static const routeName = '/eventDetailsMap';

  @override
  State<EventDetailsMap> createState() => EventDetailsMapState();
}

class EventDetailsMapState extends State<EventDetailsMap> {
  Completer<GoogleMapController> mapController = Completer();
  Maps maps = Maps();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: GoogleMap(initialCameraPosition: maps.cameraPosition()),
        );
  }
}
