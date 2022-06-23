import 'package:Challenge_App/models/event_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps {
  void cameraPosition(EventModel event) {
    final lat = double.parse(event.address.location.lat);
    final long = double.parse(event.address.location.long);

    final CameraPosition kGooglePlex =
        CameraPosition(target: LatLng(lat, long), zoom: 15);
  }
}
