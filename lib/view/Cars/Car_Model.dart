import 'dart:io';
import 'dart:ui';

class CarModel {
  String? carName, carEngine, carDetails,carModule;
  List<CarColor>?carColor=[];

  CarModel({
    this.carName,
    this.carEngine,
    this.carColor,
    this.carDetails,
    this.carModule,
  });

  CarModel.fromJson(Map<String, dynamic> json) {
    carName = json['carName']?? '';
    carEngine = json['carEngine']?? '';
    carColor = json['carColor']?? [];
    carDetails = json['carDetails']?? '';
    carModule=json['carModule']?? '';

  }

  Map<String, dynamic> toJson() {
    return {
      'carName': carName,
      'carEngine': carEngine,
      'carColor': carColor?.map((e) => e.toJson()).toList(),
      'carDetails': carDetails,
      'carModule':carModule,
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
