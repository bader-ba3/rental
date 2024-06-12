import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rental/controller/home_page_view_model.dart';
import 'package:rental/controller/place_view_model.dart';

import '../../../model/PlaceModel.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  bool showMarker = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageViewModel>(builder: (controller) {
      return Container(
        // padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)
            )
        ),
        clipBehavior: Clip.hardEdge,
        child: controller.userPosition == null
            ? CircularProgressIndicator()
            : GoogleMap(
          myLocationButtonEnabled: false,
          compassEnabled: true,
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(controller.userPosition!.latitude, controller.userPosition!.longitude),
            zoom: 17,
          ),
          mapType: MapType.normal,
          markers: controller.markers.values.toSet(),
          onCameraMove: (_) {
            if (_.zoom > 13.5) {
              showMarker = true;
            } else {
              showMarker = false;
            }
            setState(() {});
          },
          onMapCreated: (mapController) async {
            String mapStyle = await rootBundle.loadString('assets/map_style.json');
            mapController.setMapStyle(mapStyle);
            controller.mapController = Completer();
            controller.mapController.complete(mapController);
          },
          onTap: (argument) async {
            controller.setMarker(argument, "location_icon", "marker_from", "0", size: 100);
            PlaceViewModel placeViewModel = Get.find<PlaceViewModel>();
            PlaceModel places = await placeViewModel.getLocationName(argument);
            if (places.places!.isEmpty) {
              controller.markers.removeWhere((key, value) => value.position == argument);
              controller.address = null;
            } else {
              controller.address = places.places!.first.displayName!.text;
              setState(() {});
              controller.update();
            }
          },
        ),
      );
    });
  }
}
