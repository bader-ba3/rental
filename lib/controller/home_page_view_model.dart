import 'dart:async';
import 'dart:math';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart' hide Position;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rental/controller/place_view_model.dart';
import 'package:rental/model/reservation_model.dart';
import 'package:rental/model/small_car_model.dart';
import 'package:rental/utils/hive.dart';

import '../model/Car_Model.dart';
import '../model/PlaceModel.dart';
import '../utils/const.dart';
import '../utils/data.dart';
import '../utils/get_bytes_from_asset.dart';
import '../utils/services.dart';

class HomePageViewModel extends GetxController{
  Map<MarkerId, Marker> markers = {};
  int currentIndex = 0;

  Completer<GoogleMapController> mapController = Completer();
  List<ReservationModel> allReservation = [];
  List<SmallCarModel> allCars = [];
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
    FirebaseFirestore.instance.collection("Cars").snapshots().listen((event) {
      print("carListen");
      allCars.clear();
      for(var i in event.docs){
        allCars.add(SmallCarModel.fromJson(i.data()));
      }
      WidgetsFlutterBinding.ensureInitialized().waitUntilFirstFrameRasterized.then((value) => update());
    });
    FirebaseFirestore.instance.collection('dashboardMap').doc('0').snapshots().listen((event) {
      markers.removeWhere((key, _value) => key.value.contains("marker"));
      (event.data()!["markers"] as Map).forEach((key, value) {
        setMarker(LatLng(double.parse(value['lat']),double.parse(value['lng'])), value['image'], value['id'].toString(),"0",size: 200,flat: false);
        WidgetsFlutterBinding.ensureInitialized().waitUntilFirstFrameRasterized.then((value) => update());
      });
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

  void setMarker(LatLng location, String path, String uID,String bearing,{int? size, bool? flat}) {
    getBytesFromAsset(path: 'assets/$path.png', width: size??100)
        .then((value) {
      Marker newMarker = Marker(
        flat: flat ??true,
        markerId: MarkerId(uID),
        icon: BitmapDescriptor.fromBytes(value),
        position: location,
        rotation: double.parse(bearing),
        onTap: () async {
          PlaceViewModel placeViewModel = Get.find<PlaceViewModel>();
          PlaceModel places = await placeViewModel.getLocationName(location);
          markers.removeWhere((key, value) => value.markerId.value == uID);
          address = places.places == null ?"المركز الرئيسي":places.places!.first.displayName!.text;
          update();
        },
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
    required String carDes,
    required String carId,
    required String carImage0,
    required String carImage3,
    required String carImage13,
    required String addOns,
  }) async{
    ReservationModel model = ReservationModel(
        id: "R${Random().nextInt(9999999)}",
        userName: HiveDataBase.getUserData().name,
        carName: carName,
      carDes: carDes,
      carId: carId,
        licenseImage:HiveDataBase.getUserData().licenseImage,
        addOns: addOns,
        carImage0: carImage0,
        carImage13: carImage13,
        carImage3: carImage3,
        time: startAndEndDate!.end.difference(startAndEndDate!.start).inDays.toString(),
        price: price,
        pickupDate: startAndEndDate!.start.toString().split(" ")[0],
        returnDate: startAndEndDate!.end.toString().split(" ")[0],
        address: address??HiveDataBase.getUserData().location,
        reservationStatus: Const.reservationPending,
        carStatus: Const.carStatusIdle,
    );
    FirebaseFirestore.instance.collection("Reservation").doc(model.id).set(model.toJson());
  }

  Future<void> getImages() async {
    for (CarModel element in carList) {
        for (var imagesElement in element.carColor![0].images!) {
          await Utils().saveImage(imagesElement).then((value) {
            carList[carList.indexOf(element)].carColor![0].imagesFile!.add(value);
          });
        }
    }
    carIsLoading=true;
    print("--------------done");
  }

  CherryToast? checkFilter() {
    if(startAndEndDate==null){
      return CherryToast.error(
        title: Text("You Should Enter Date"),
        animationType: AnimationType.fromTop,
        action: Text("add Date",style: TextStyle(color: Colors.blueAccent),),
        actionHandler: (){
          editSetting(true);
        },
        animationDuration: Duration(milliseconds: 300),
      );
    }else
    if(address==null){
      return CherryToast.error(
        title: Text("You Should Enter address"),
        animationType: AnimationType.fromTop,
        action: Text("add Address",style: TextStyle(color: Colors.blueAccent),),
        actionHandler: (){
          editSearch(true);
        },
        animationDuration: Duration(milliseconds: 300),
      );
    }
    return null;
  }

  void changeReservationStatus({required String id, required String status}) {
    FirebaseFirestore.instance.collection("Reservation").doc(id).update({
      "reservationStatus":status
    });
  }
  void changeCarStatus({required String id, required String status}) {
    FirebaseFirestore.instance.collection("Cars").doc(id).update({
      "status":status
    });
  }


  bool isSettingOpened = false;
  bool isSearchOpened = false;
  editSetting(bool type){
    isSettingOpened = type;
    isSearchOpened = !type;
    update();
  }
  editSearch(bool type){
    isSettingOpened = !type;
    isSearchOpened = type;
    update();

  }

}