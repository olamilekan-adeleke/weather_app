import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget(this.latlng, {this.placeName, Key? key}) : super(key: key);

  final LatLng latlng;
  final String? placeName;

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: widget.latlng,
        zoom: 14.4746,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: <Marker>{
        Marker(
          markerId: const MarkerId('location_id'),
          position: widget.latlng,
          infoWindow: InfoWindow(title: widget.placeName ?? 'Location'),
          icon: BitmapDescriptor.defaultMarker,
        )
      },
    );
  }
}
