import 'dart:io';

class ReservationModel {
  String? id,address,userName,carName,carId,carDes,carStatus,licenseImage,addOns,carImage0,carImage3,carImage13,time,price,pickupDate,returnDate,reservationStatus;
  File? carImageFile;

  ReservationModel({
    required this.id,
    required this.address,
    required this.userName,
    required this.carId,
    required this.carName,
    required this.carDes,
    required this.licenseImage,
    required this.addOns,
    required this.carImage0,
    required this.carImage3,
    required this.carImage13,
    required this.time,
    required this.price,
    required this.pickupDate,
    required this.returnDate,
    required this.reservationStatus,
    required this.carStatus,
  });

  ReservationModel.fromJson(json){
    id = json['id'];
    address = json['address'];
    userName = json['userName'];
    carName = json['carName'];
    licenseImage = json['licenseImage'];
    addOns = json['addOns'];
    carImage0 = json['carImage0'];
    carImage3 = json['carImage3'];
    carImage13 = json['carImage13'];
    time = json['time'];
    price = json['price'];
    pickupDate = json['pickupDate'];
    returnDate = json['returnDate'];
    reservationStatus = json['reservationStatus'];
    carDes = json['carDes'];
    carId = json['carId'];
    carStatus = json['carStatus'];
  }

  toJson(){
    return{
      "id": id,
      "address": address,
      "userName": userName,
      "carName":carName ,
      "carDes":carDes ,
      "carId":carId ,
      "licenseImage":licenseImage ,
      "addOns":addOns,
      "carImage0": carImage0,
      "carImage3": carImage3,
      "carImage13": carImage13,
      "time":time,
      "price": price,
      "pickupDate":pickupDate ,
      "returnDate": returnDate,
      "reservationStatus": reservationStatus,
      "carStatus": carStatus,
    };
  }

}