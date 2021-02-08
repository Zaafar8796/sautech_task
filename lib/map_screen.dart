import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/map';
  final double origLat;
  final double origLng;
  final double destLat;
  final double destLng;

  MapScreen({
    this.origLat,
    this.origLng,
    this.destLat,
    this.destLng,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;
  List<Marker> _markers = <Marker>[];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    _markers.add(
      Marker(
        markerId: MarkerId('one'),
        position: LatLng(
          routeArgs['origLat'],
          routeArgs['origLng'],
        ),
        infoWindow: InfoWindow(
          title: 'Starting Position',
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: Set<Marker>.of(_markers),
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(routeArgs['origLat'], routeArgs['origLng']),
          zoom: 10.0,
        ),
      ),
    );
  }
}
