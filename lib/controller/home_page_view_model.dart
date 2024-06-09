import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/get_bytes_from_asset.dart';

class HomePageViewModel extends GetxController{
  Map<MarkerId, Marker> markers = {};
  Completer<GoogleMapController> mapController = Completer();
  Position? userPosition ;

  HomePageViewModel(){
    Future.sync(() async {
      await Geolocator.requestPermission();
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) {
        userPosition = value;
        update();
        // getLocationName(LatLng(value.latitude, value.longitude)).then((value) {
        //   fromAddress = value.places!.first.displayName!.text!;
        //   update();
        // });
      });
    });
  }

  void setMarker(LatLng location, String path, String uID,String bearing,{int? size}) {
    getBytesFromAsset(path: 'assets/$path.png', width: size??100)
        .then((value) {
      Marker newMarker = Marker(
        flat: true,
        markerId: MarkerId(uID),
        icon: BitmapDescriptor.fromBytes(value),
        position: location,
        rotation: double.parse(bearing),
        onTap: () {},
      );
      markers[MarkerId(uID)]= newMarker;
      update();
    });
  }

  Future<void> animateCamera(LatLng location) async {
    final GoogleMapController controller = await mapController.future;
    CameraPosition cameraPosition = CameraPosition(
      bearing: 0,

      target: location,
      zoom: 17.00,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<void> addReservation() async{

  }
}