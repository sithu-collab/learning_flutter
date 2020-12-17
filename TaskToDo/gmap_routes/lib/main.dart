import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GMap(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GMap extends StatefulWidget {
  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  Set<Marker> _markers = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Polyline> _polylines = HashSet<Polyline>();
  Set<Circle> _circles = HashSet<Circle>();
  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;

  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _getCurrentLocation() async {
      _locationData = await location.getLocation();
      print('Current Location ' + '$_locationData');
  }

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
    _setPolygons();
    _setPolyline();
    _setCircles();
    _getCurrentLocation();
  }

  void _setMapStyle() async{
    String style = await DefaultAssetBundle.of(context).loadString('assets/map_style.json');
    _mapController.setMapStyle(style);
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(),
        'assets/destination_pin.png');
  }

  void _setPolygons() {
    List<LatLng> polygonLatLng = List<LatLng>();
    polygonLatLng.add(LatLng(37.78493, -122.42932));
    polygonLatLng.add(LatLng(37.78693, -122.41942));
    polygonLatLng.add(LatLng(37.78923, -122.41542));
    polygonLatLng.add(LatLng(37.78923, -122.42582));
    
    _polygons.add(
      Polygon(
        polygonId: PolygonId("polygon1"),
        points: polygonLatLng,
        strokeWidth: 4,
        fillColor: Colors.white.withOpacity(0.4),
        strokeColor: Colors.purple
      )
    );
  }

  void _setPolyline() {
    List<LatLng> _polylineLatLng = List<LatLng>();
    _polylineLatLng.add(LatLng(40.6782, -73.9442));
    _polylineLatLng.add(LatLng(40.6982, -73.9142));

    _polylines.add(
      Polyline(
        polylineId: PolylineId('polyline1'),
        color: Colors.red,
        points: _polylineLatLng,
        width: 4,
        startCap: Cap.roundCap,
        endCap: Cap.buttCap,
      )
    );
  }

  void _setCircles() {
    _circles.add(
      Circle(
        circleId: CircleId('circle1'),
        radius: 500.0,
        fillColor: Colors.white.withOpacity(0.4),
        strokeColor: Colors.red,
        strokeWidth: 4,
        center: LatLng(40.6782, -73.9442),
    ),);
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('marker1'),
        position: LatLng(40.6782, -73.9442),
        infoWindow: InfoWindow(
          title: 'BROOKLYN',
          snippet: 'An Interesting city',
        ),
        icon: _markerIcon,
      ),);
    });
    _setMapStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(40.6782, -73.9442),
          zoom: 15,
        ),
        markers: _markers,
        polygons: _polygons,
        polylines: _polylines,
        circles: _circles,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        tooltip: 'Get Current Location',
        child: IconButton(
          icon: Icon(Icons.map_rounded),
        )
      ),
    );
  }
  //
  // void _displayCurrentLocation() async {
  //   final location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high, forceAndroidLocationManager: true);
  //   setState(() {
  //     _location = location;
  //   });
  //   print('Current Location : ' + '${_location.latitude}, ${_location.longitude}');
  // }
}

