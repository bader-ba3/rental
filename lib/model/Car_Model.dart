import 'dart:io';
import 'dart:ui';

class CarModel {
  String? carName, carEngine, carDetails,carModule,carPrice,carId;
  List<CarColor>?carColor=[];

  CarModel({
    required  this.carName,
    required this.carId,
    required this.carPrice,
    required this.carEngine,
    required this.carColor,
    required this.carDetails,
    required this.carModule,
  });

  CarModel.fromJson(Map<String, dynamic> json) {
    carName = json['carName']?? '';
    carId = json['carId']?? '';
    carEngine = json['carEngine']?? '';
    carColor = json['carColor']?? [];
    carDetails = json['carDetails']?? '';
    carModule=json['carModule']?? '';
    carPrice=json['carPrice']?? '';

  }

  Map<String, dynamic> toJson() {
    return {
      'carName': carName,
      'carId': carId,
      'carEngine': carEngine,
      'carColor': carColor?.map((e) => e.toJson()).toList(),
      'carDetails': carDetails,
      'carModule':carModule,
      'carPrice':carPrice,
    };
  }
}

class CarColor {
  Color? color;
  List<String>? images;
  List<File>? imagesFile=[];

  CarColor({
    this.color,
    this.images,
    this.imagesFile
  });

  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'images': images?.toList(),
    };
  }

   CarColor.fromJson(Map<String, dynamic> json) {

      color= json['color']??'';
      images= List<String>.from(json['images'] ?? []);

  }
}
