import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rental/model/reservation_model.dart';

import '../model/Car_Model.dart';
import '../utils/data.dart';
import '../utils/get_bytes_from_asset.dart';
import '../utils/services.dart';

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

  Future<void> addReservation(userName,price,time,carName,) async{
    ReservationModel model = ReservationModel(
        id: "R${Random().nextInt(9999999)}",
        userName: userName,
        carName: carName,
        licenseImage: "licenseImage",
        addOns: "addOns",
        city: "Rak",
        carImage: "carImage",
        time: "",
        price: price,
        pickupDate: "pickupDate",
        returnDate: "returnDate", address: ''
    );
    FirebaseFirestore.instance.collection("Reservation").doc(model.id).set(model.toJson());
  }

  Future<void> getImages() async {

    for (CarModel element in carList) {
      for (var colorElement in element.carColor!) {
        for (var imagesElement in colorElement.images!) {
          await Utils().saveImage(imagesElement).then((value) {
            carList[carList.indexOf(element)]
                .carColor![element.carColor!.indexOf(colorElement)]
                .imagesFile!
                .add(value);
            // print(value.path);
            // imagesElement =value;
            // print(imagesElement);
          });
        }
      }
    }
  }
}