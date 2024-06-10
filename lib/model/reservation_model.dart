class ReservationModel {
  String? id,address,userName,carName,licenseImage,addOns,city,carImage,time,price,pickupDate,returnDate;
  ReservationModel({required this.id,required this.address,required this.userName,required this.carName,required this.licenseImage,required this.addOns,required this.city,required this.carImage,required this.time,required this.price,required this.pickupDate,required this.returnDate});
  ReservationModel.fromJson(json){
    id = json['id'];
    address = json['address'];
    userName = json['userName'];
    carName = json['carName'];
    licenseImage = json['licenseImage'];
    addOns = json['addOns'];
    city = json['city'];
    carImage = json['carImage'];
    time = json['time'];
    price = json['price'];
    pickupDate = json['pickupDate'];
    returnDate = json['returnDate'];
  }

  toJson(){
    return{
      "id": id,
      "address": address,
      "userName": userName,
      "carName":carName ,
      "licenseImage":licenseImage ,
      "addOns":addOns ,
      "city":city ,
      "carImage": carImage,
      "time":time ,
      "price": price,
      "pickupDate":pickupDate ,
      "returnDate": returnDate,
    };
  }
}