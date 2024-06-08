import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/app_style.dart';
import '../Car_Model.dart';

class CarStackWidget extends StatefulWidget {
  const CarStackWidget({super.key, required this.carModel});

  @override
  State<CarStackWidget> createState() => _CarStackWidgetState();
  final CarModel carModel;
}

class _CarStackWidgetState extends State<CarStackWidget> {
  int indexOf360Image = 5;
  bool enableRotation = true;
  double rotationIndex = 0;
  int fingersCount = 0;
  int rotationRate = 0;

  Future<void> getImage() async {
    for (var element in widget.carModel.carColor![1].images!) {
      await precacheImage(NetworkImage(element), context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      getImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
        trackpadScrollCausesScale: false,
        panEnabled: false,
        onInteractionStart: (details) {
          details.pointerCount == 2
              ? {enableRotation = false, setState(() {})}
              : null;
        },
        onInteractionEnd: (details) {
          enableRotation = true;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              height: 270,
              width: Get.width,
              alignment: Alignment.center,
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.carModel.carName.toString(),
                    style: Styles.headLineStyle1.copyWith(fontSize: 40),
                  ),
                  Text(
                    widget.carModel.carModule.toString(),
                    style: Styles.headLineStyle4.copyWith(fontSize: 70),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Durations.long4,
              curve: Curves.easeInOut,
              bottom: -50,
              child: Listener(
                  onPointerDown: (event) => fingersCount++,
                  onPointerUp: (event) => fingersCount--,
                  onPointerMove: (event) {
                    if (enableRotation && fingersCount == 1) {
                      rotationIndex += event.delta.dx.sign * -0.05;
                      rotationIndex %= pi * -2;
                      if (event.delta.dx > 0) {
                        if (indexOf360Image == 23) {
                          indexOf360Image = 0;
                        }
                        rotationRate == 2
                            ? {indexOf360Image++, rotationRate = 0}
                            : rotationRate++;
                        setState(() {});
                      } else {
                        if (indexOf360Image == 0) {
                          indexOf360Image = 23;
                        }
                        rotationRate == 2
                            ? {indexOf360Image--, rotationRate = 0}
                            : rotationRate++;
                        setState(() {});
                      }
                    }
                  },

                  // mazda3_Hatchback
                  child: Image.network(
                    widget.carModel.carColor![1].images![indexOf360Image],
                    height: 300,
                    width: Get.width,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset("assets/px/mazda3Hatchback_1.png");
                    },
                  )),
            ),
          ],
        )
        );
  }
}
