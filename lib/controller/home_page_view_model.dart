import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rental/model/reservation_model.dart';
import 'package:rental/utils/hive.dart';

import '../model/Car_Model.dart';
import '../utils/data.dart';
import '../utils/get_bytes_from_asset.dart';
import '../utils/services.dart';

class HomePageViewModel extends GetxController{
  Map<MarkerId, Marker> markers = {};
  Completer<GoogleMapController> mapController = Completer();
  List<ReservationModel> allReservation = [];
  Position? userPosition ;

  bool carIsLoading=false;

  ({DateTime end, DateTime start})? startAndEndDate;
  String? address;


  HomePageViewModel(){
    getImages();
    FirebaseFirestore.instance.collection("Reservation").snapshots().listen((event) {
      print("listend");
      allReservation.clear();
      for(var i in event.docs){
        allReservation.add(ReservationModel.fromJson(i.data()));
      }
      WidgetsFlutterBinding.ensureInitialized().waitUntilFirstFrameRasterized.then((value) => update());
    });
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

  Future<void> addReservation({
    required String price,
    required String carName,
    required String carImage,
  }) async{
    ReservationModel model = ReservationModel(
        id: "R${Random().nextInt(9999999)}",
        userName: HiveDataBase.getUserData().name,
        carName: carName,
        licenseImage:HiveDataBase.getUserData().licenseImage,
        addOns: "addOns",
        carImage: carImage,
        time: startAndEndDate!.end.difference(startAndEndDate!.start).inDays.toString(),
        price: price,
        pickupDate: startAndEndDate!.start.toString().split(" ")[0],
        returnDate: startAndEndDate!.end.toString().split(" ")[0],
        address: address,
        reservationStatus: "reservationStarted"
    );
    FirebaseFirestore.instance.collection("Reservation").doc(model.id).set(model.toJson());
  }

  Future<void> getImages() async {
    for (CarModel element in carList) {
        for (var imagesElement in element.carColor![0].images!) {
          print(imagesElement);
          await Utils().saveImage(imagesElement).then((value) {
            carList[carList.indexOf(element)]
                .carColor![0]
                .imagesFile!
                .add(value);
            // print(value.path);
            // imagesElement =value;
            // print(imagesElement);
          });
        }

    }
carIsLoading=true;
    print("--------------done");
  }

  String? checkFilter() {
    if(startAndEndDate==null){
      return "You Should Enter Date";
    }else
    if(address==null){
      return "You Should Enter address";
    }
    return null;
  }
}