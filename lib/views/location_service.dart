import 'dart:async';

import 'package:employee_provider/helper.dart';
import 'package:employee_provider/logic/address_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationServices extends StatefulWidget {
  @override
  _LocationServicesState createState() => _LocationServicesState();
}

class _LocationServicesState extends State<LocationServices> {

  AddressLogic addressLogic = Get.put(AddressLogic());
   bool loader = true;

  _getLocation() async {
    Position position =await addressLogic.getLatLong();
    setState(() {
      //SOURCE_LOCATION=LatLng(position.longitude, position.latitude);
      loader = false;
    });
    print(position);
  }
  double CAMERA_ZOOM = 13;
  double CAMERA_TILT = 0;
  double CAMERA_BEARING = 30;
  LatLng SOURCE_LOCATION=LatLng(23.3699464, 85.3250059);
  LatLng DEST_LOCATION = LatLng(23.6889,86.9661);
  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _markers = {};

  Set<Polyline> _polylines = {};

  List<LatLng> polylineCoordinates = [];

  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = "AIzaSyBBJ_ahummzZ-dbB2_kS3q3xHYaI2-GWnc";
// for my custom icons
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.9),
        "images/source.png");
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5,size: Size(20, 20) ),
        "images/destination.png",);
  }
  setPolylines() async {
    var result = await
    polylinePoints.getRouteBetweenCoordinates(
        googleAPIKey,
        PointLatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude),
        PointLatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude),
        travelMode: TravelMode.driving,
        );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    setState(() {

      Polyline polyline = Polyline(
          polylineId: PolylineId("poly"),
          color: color1,
          points: polylineCoordinates
      );

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLocation();
    setSourceAndDestinationIcons();
  }

  @override
  Widget build(BuildContext context) {
    if(loader){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    CameraPosition initialLocation = CameraPosition(
        zoom: CAMERA_ZOOM,
        bearing: CAMERA_BEARING,
        tilt: CAMERA_TILT,
        target: SOURCE_LOCATION
    );
    return GoogleMap(
        myLocationEnabled: true,
        compassEnabled: true,
        tiltGesturesEnabled: false,
        markers: _markers,
        polylines: _polylines,
        mapType: MapType.normal,
        initialCameraPosition: initialLocation,
        onMapCreated: onMapCreated
    );
  }
  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setMapPins();
    setPolylines();
  }
  void setMapPins() {
    setState(() {
      // source pin
      _markers.add(Marker(
          markerId: MarkerId("sourcePin"),
          position: SOURCE_LOCATION,
          icon: sourceIcon
      ));
      // destination pin
      _markers.add(Marker(
          markerId: MarkerId("destPin"),
          position: DEST_LOCATION,
          icon: destinationIcon
      ));
    });
  }
}
