import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils.dart';

class GoogleMapUI extends StatefulWidget {
  @override
  _GoogleMapUIState createState() => _GoogleMapUIState();
}

class _GoogleMapUIState extends State<GoogleMapUI> {

  List<Marker> markers = [];

  GoogleMapController _controller;

  var _geoLocator = Geolocator();
  var _locationOptions =
      LocationOptions(accuracy: LocationAccuracy.best, distanceFilter: 10);

  @override
  void initState() {
    markers.clear();

    markers.add(Marker(
      markerId: MarkerId("USER_LOCATION"),
      position: LatLng(currentLatitude, currentLongitude),
      draggable: false,
    ));

    _geoLocator.getPositionStream(_locationOptions).listen((Position position) {
      currentLatitude = position.latitude;
      currentLongitude = position.longitude;

      markers.clear();
      markers.add(Marker(
        markerId: MarkerId("USER_LOCATION"),
        position: LatLng(currentLatitude, currentLongitude),
        draggable: false,
      ));

      if (_controller != null) {
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(currentLatitude, currentLongitude),
              zoom: 17.5,
            ),
          ),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        buildingsEnabled: false,
        mapToolbarEnabled: true,
        indoorViewEnabled: false,
        compassEnabled: true,
        trafficEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(currentLatitude, currentLongitude),
          zoom: 17.5,
        ),
        onMapCreated: mapCreated,
        markers: Set.from(markers),
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
    setState(() {
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(currentLatitude, currentLongitude),
        zoom: 17.5,
      )));
    });
  }
}
