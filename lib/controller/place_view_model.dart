import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../model/PlaceModel.dart';



class PlaceViewModel extends GetxController {
  PlaceModel _places = PlaceModel();

  PlaceModel get places => _places;

  Future<List<String>?> getPlace(String placeText) async {
    Map<String, dynamic> body = {
      "textQuery": placeText,
    };
    Map<String, String> headers = {
      "Accept": "*/*",
      "X-Goog-Api-Key": "AIzaSyARUw-vbD_KeA-AvvQZp7VmOMkosTq0UZQ",
      "X-Goog-FieldMask":
          "places.displayName,places.formattedAddress,places.priceLevel,places.location"
    };

    http.Response response = await http.post(
        Uri.parse("https://places.googleapis.com/v1/places:searchText"),
        body: body,
        headers: headers);
    if (response.statusCode == 200) {
      // _places = PlaceModel.fromJson(jsonDecode(response.body));
      return PlaceModel.fromJson(jsonDecode(response.body)).places!.map((e) => e.displayName!.text.toString()).toList();
    } else {
      return [];
    }
  }

  Future<PlaceModel> getLocationName(LatLng location) async {
    String body = jsonEncode({
      "maxResultCount": "1",
      "locationRestriction": {
        "circle": {
          "center": {
            "latitude": location.latitude,
            "longitude": location.longitude
          },
          "radius": 50.0
        }
      }
    });
    Map<String, String> headers = {
      "Accept": "*/*",
      "X-Goog-Api-Key": "AIzaSyARUw-vbD_KeA-AvvQZp7VmOMkosTq0UZQ",
      "X-Goog-FieldMask":
          "places.displayName,places.formattedAddress,places.priceLevel,places.location"
    };

    http.Response response = await http.post(
        Uri.parse("https://places.googleapis.com/v1/places:searchNearby"),
        body: body,
        headers: headers);
    if (response.statusCode == 200) {
      return _places = PlaceModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      return PlaceModel();
    }
  }
}
