import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:rental/view/home_page/home_page_view.dart';
import 'package:slider_button/slider_button.dart';

import '../../Utils/app_style.dart';
import '../../utils/const.dart';
import '../../model/Car_Model.dart';
import '../../utils/services.dart';

class CarPage extends StatefulWidget {
  const CarPage({super.key, required this.carModel});

  @override
  State<CarPage> createState() => _CarPageState();
  final CarModel carModel;
}

class _CarPageState extends State<CarPage> with TickerProviderStateMixin {
  int i = 0;
  bool isPend = false;
  int indexOf360Image = 3;
  bool enableRotation = true;
  int fingersCount = 0;
  int rotationRate = 0;
  double carWidth = Get.width, carHeight = 300,carLeft=0,carRight=0;


  bool carIsBig = false, carOrdered = false, detailsView = true;

  bool extendable = false;
  bool insurance = true;
  bool address = true;

  @override
  void initState() {
    super.initState();
    getImage();
    fadeDetails();
  }

  fadeDetails() {
    setState(() {
      detailsView = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(carIsBig){
          carIsBig=false;
          // setState(() {});
          return false;
        }else{
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Const.mainColor,
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy < 0) {
                    if (i != 1 ) {
                      startAnimate(details);
                      i++;
                    }
                  } else {
                    if (i != 1 ) {
                      backAnimate();
                      i++;
                    }
                  }
                },
                child: Scaffold(
                  backgroundColor: Styles.bgColor,
                  body: InteractiveViewer(
                    trackpadScrollCausesScale: false,
                    panEnabled: false,
                    onInteractionStart: (details) {
                      if (details.pointerCount == 2) {
                        enableRotation = false;
                        setState(() {});
                      }
                    },
                    onInteractionEnd: (_) {
                      enableRotation = true;
                      setState(() {});
                    },
                    child: SizedBox(
                      height: Get.height,
                      child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          _buildCarInfo(),
                          _buildCarImage(),
                          _buildBottomInfo(),
                          _buildLeftInfo(),
                          _buildRightInfo(),
                          if (carIsBig)
                            Positioned(
                              bottom: 95,
                              left: 20,
                              right: 20,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Const.brownColor),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Const.paigeColor.withOpacity(0.6),
                                ),
                                height: 175,
                                width: 100,
                                child:  Column(
                                  children: [
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Checkbox(
                                          fillColor: MaterialStateProperty.all(Const.paigeColor),
                                          value: insurance,
                                          onChanged: (value) {
                                            insurance =value!;
                                            Get.appUpdate();
                                            setState(() {});
                                          },
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Insurance included",
                                              style: Styles.headLineStyle3.copyWith(color: Colors.black),
                                            ),
                                            Text(
                                              "Do you want to issue car insurance?",
                                              style: Styles.headLineStyle4.copyWith(color: Colors.black.withOpacity(0.8),fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Checkbox(
                                          fillColor: MaterialStateProperty.all(Const.paigeColor),
                                          value: address,
                                          onChanged: (value) {
                                            address =value!;
                                            Get.appUpdate();
                                            setState(() {});
                                          },
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Same Default Address",
                                              style: Styles.headLineStyle3.copyWith(color: Colors.black),
                                            ),
                                            Text(
                                              "UAE, Dubai, 16 Street",
                                              style: Styles.headLineStyle4.copyWith(color: Colors.black.withOpacity(0.8),fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Checkbox(
                                          // activeColor: Styles.paigeColor,
                                          fillColor: MaterialStateProperty.all(Const.paigeColor),
                                          value: extendable,
                                          onChanged: (value) {
                                            extendable = value!;
                                            Get.appUpdate();
                                            setState(() {});
                                          },
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Extendable",
                                              style: Styles.headLineStyle3.copyWith(color: Colors.black),
                                            ),
                                            Text(
                                              "Can you request an extension of the rental?",
                                              style: Styles.headLineStyle4.copyWith(color: Colors.black.withOpacity(0.8),fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          if (carIsBig)
                            Positioned(
                              bottom: 10,
                              left: 20,
                              right: 20,
                              child: SliderButton(
                                buttonColor: Const.mainColor,
                                radius: 10,
                                action: () async {
                                  backAnimate();
                                  carOrdered=true;
                                  Timer(const Duration(seconds: 1), () {
                                    carLeft=-400;
                                    carRight=400;
                                    setState(() {

                                    });
                                  },);

                                  carLeft=100;
                                  carRight=-100;
                                  setState(() {

                                  });
                                  Timer(const Duration(seconds: 3), () {
                                    Get.offAll(const HomePageView());
                                  },);
                                  return true;
                                },
                                label: Text(
                                  "Slide to rent this car",
                                  style: Styles.headLineStyle1.copyWith(color: Const.paigeToBrownColor, fontWeight: FontWeight.w500, fontSize: 17),
                                ),
                                icon: Image.asset("assets/hand_icon.png",color: Colors.white,)
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: BackButton(
                  color: Const.mainColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void startAnimate(DragUpdateDetails details) {
    Timer.periodic(Durations.short1, (timer) {
      detailsView = true;
      if (indexOf360Image != 6) {
        updateIndexAndHeight();
        setState(() {});
      } else if (carHeight < 900) {
        carHeight += 50;
        setState(() {});
      } else {
        fadeDetails();
        timer.cancel();
        setState(() {});
        i = 0;
      }
    });
  }

  void updateIndexAndHeight() {
    if (indexOf360Image < 6) {
      indexOf360Image++;
    } else {
      indexOf360Image--;
    }

    if (carHeight < 900) {
      carHeight += 50;
    }

    carIsBig = true;
  }

  Widget _buildInfoCard(String iconPath, String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Const.brownColor),
        borderRadius: BorderRadius.circular(20),
        color: Const.paigeColor.withOpacity(0.6),
      ),
      width: 180,
      height: 110,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 30, width: 30,color: Colors.black,),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(title, style: Styles.headLineStyle3.copyWith(color: Colors.black)),
                Text(subtitle, maxLines: 2, style: Styles.headLineStyle4.copyWith(color: Const.mainColor)),
                const Spacer()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard2(String iconPath, String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
        color: Const.mainColor.withOpacity(0.5),
      ),
      width: 180,
      height: 110,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 30, width: 30,color: Colors.white,),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(title, style: Styles.headLineStyle3.copyWith(color: Colors.white)),
                Text(subtitle, maxLines: 2, style: Styles.headLineStyle4.copyWith(color:  Colors.white)),
                const Spacer()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftInfo() {
    return AnimatedPositioned(
      duration: Durations.medium2,
      top: 50,
      left: carIsBig ? 20 : -200,
      child: Column(
        children: [
          _buildInfoCard("assets/car_details/fuel.png", "Diesel", "Common Rail Fuel Injection"),
          const SizedBox(height: 20),
          _buildInfoCard("assets/car_details/Acceleration.png", "Acceleration", "0 - 100km / 11s"),
          const SizedBox(height: 20),
          _buildInfoCard("assets/car_details/sets.png", "Cool Seat", "Temp Control on 5 seat"),
          const SizedBox(height: 20),
          _buildInfoCard("assets/car_details/careng.png", "SKYACTIV-G", "6 SPEED SKYACTIV"),
        ],
      ),
    );
  }

  Widget _buildImageFooter() {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined, color: Const.paigeColor),
        const SizedBox(width: 5),
        Text("Delivery, on Demand", style: Styles.headLineStyle4),
        const Spacer(),
        const Icon(Icons.star, color: Colors.orangeAccent),
        const SizedBox(width: 5),
        Text("4.5", style: Styles.headLineStyle2),
      ],
    );
  }

  Widget _buildBlurOverlay() {
    return Positioned.fill(
      child: AnimatedOpacity(
        duration: Durations.short4,
        opacity: carIsBig ? 1 : 0,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(color: Colors.white.withOpacity(0)),
        ),
      ),
    );
  }

  Widget _buildCarImage() {
    return AnimatedPositioned(
      duration:carOrdered?const Duration(seconds: 1): Durations.extralong4,
      curve: Curves.easeInOut,
      left: carLeft,
      right: carRight,
      child: Listener(
        onPointerDown: (_) => fingersCount++,
        onPointerUp: (_) => fingersCount--,
        onPointerMove: (event) {
          if (enableRotation && fingersCount == 1 && !carIsBig ) {
            setState(() {
              if (event.delta.dx > 0) {
                indexOf360Image = (indexOf360Image + 1) % 24;
              } else {
                indexOf360Image = (indexOf360Image - 1 + 24) % 24;
              }
              rotationRate = (rotationRate + 1) % 3;
            });
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Hero(
              tag: widget.carModel.carColor![0].images![1],

              child: Image.file(
                height: carHeight,
                width: carWidth,
                fit: BoxFit.cover,

                ( widget.carModel.carColor![0].imagesFile![indexOf360Image]),
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    height: carHeight,
                    width: carWidth,
                    fit: BoxFit.cover,

                    widget.carModel.carColor![0].images![indexOf360Image],
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                          "assets/px/mazda3Hatchback_1.png");
                    },
                  );
                },
              ),
             /* child: Image.network(
                widget.carModel.carColor![0].images![indexOf360Image],
                height: carHeight,
                width: carWidth,
                fit: BoxFit.cover,
              ),*/
            ),
          /*  if (!isLoad)
              const Center(
                child: CircularProgressIndicator(color: Colors.greenAccent),
              ),*/
            if (!carOrdered)
            Positioned(
              right: 20,
              left: 20,
              bottom: 10,
              child: _buildImageFooter(),
            ),
            if (carIsBig) _buildBlurOverlay(),
          ],
        ),
      ),
    );
  }

  Widget _buildCarInfo() {
    return AnimatedPositioned(
      top: 200,
      duration: Durations.extralong4,
      child: Container(
        height: 270,
        width: Get.width,
        // alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.carModel.carName.toString(),
              style: Styles.headLineStyle1.copyWith(fontSize: 40),
            ),
            AnimatedCrossFade(
              firstChild: Text(
                carOrdered?"Car in way to you":  widget.carModel.carModule.toString(),
                style: Styles.headLineStyle4.copyWith(fontSize: carOrdered?30: 60),
              ),
              secondChild: Text(
                "Car in way to you",
                style: Styles.headLineStyle4.copyWith(fontSize: 40,color: Const.paigeToBrownColor),
              ),
              duration: Durations.extralong4,
              crossFadeState:carOrdered?CrossFadeState.showSecond:CrossFadeState.showFirst ,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomInfo() {
    return Positioned(
      bottom: 10,
      child: AnimatedOpacity(
        duration: Durations.medium2,
        opacity: carIsBig||carLeft==-400 ? 0 : 1.0,
        child: Column(
          children: [
            Image.asset(
              "assets/car_details/arrowUp.png",
              height: 40,
              color: Const.mainColor,
            ) .animate(onPlay: (controller) => controller.repeat()).shakeY(
                  hz: 0.5,
                  duration: const Duration(seconds: 2),
                  // end:  -0.5,
                )
            ,
            const SizedBox(
              height: 10,
            ),
            Text(
              "Swipe up to view details",
              style: Styles.headLineStyle2.copyWith(color: Const.mainColor, fontWeight: FontWeight.w400),
            ) .animate(onPlay: (controller) => controller.repeat()).shimmer(
                color: Colors.red, duration: const Duration(seconds: 2)),
          ],
        ),
      ),
    );
  }

  Widget _buildRightInfo() {
    return AnimatedPositioned(
      duration: Durations.medium2,
      top: 50,
      right: carIsBig ? 20 : -200,
      child: Column(
        children: [
          _buildInfoCard("assets/car_details/cargear.png", "Automatic", "Common Rail Fuel Injection"),
          const SizedBox(height: 20),
          _buildInfoCard("assets/car_details/24hours.png", "1 day rental", "1500 AE"),
          const SizedBox(height: 20),
          _buildInfoCard("assets/car_details/travel.png", "Travel Bags", "More than 5 bag"),
          const SizedBox(height: 20),
          _buildInfoCard2("assets/car_details/addOns.png", "AddOns", "might want to use"),
        ],
      ),
    );
  }


  Future<void> getImage() async {
    for (var element in widget.carModel.carColor![0].imagesFile!) {
      await Utils().loadFileImage(element, context);
    }
/*    for (var element in widget.carModel.carColor![0].images!) {
      try {
        await precacheImage(NetworkImage(element), context);
      } catch (e) {
        print('Failed to load and cache the image: $e');
      }
    }*/
  }

  void backAnimate() {
    Timer.periodic(Durations.short1, (timer) {
      detailsView = true;

      if (indexOf360Image != 0) {
        updateIndexAndHeightBackward();
        setState(() {});
      } else {
        resetHeightAndFadeDetails(timer);
      }
    });
  }

  void updateIndexAndHeightBackward() {
    indexOf360Image--;

    if (carHeight > 250) {
      carHeight -= 100;
    }
  }

  void resetHeightAndFadeDetails(Timer timer) {
    carHeight = 250;

    fadeDetails();
    timer.cancel();
    carIsBig = false;
    setState(() {});
    i = 0;
  }
}
