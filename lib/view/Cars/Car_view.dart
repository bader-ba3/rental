import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:slider_button/slider_button.dart';

import '../../Utils/app_style.dart';
import '../../utils/const.dart';
import 'Car_Model.dart';

class CarPage extends StatefulWidget {
  const CarPage({super.key, required this.carModel});

  @override
  State<CarPage> createState() => _CarPageState();
  final CarModel carModel;
}

class _CarPageState extends State<CarPage> with TickerProviderStateMixin {
  late TabController tabController =
      TabController(length: 5, vsync: this, initialIndex: 0);
  ScrollController controller = ScrollController();
  int i = 0;

  bool isPend = false;
  int indexOf360Image = 3;
  bool enableRotation = true;
  int fingersCount = 0;
  int rotationRate = 0;
  double carWidth = Get.width, carHeight = 300;

  bool carIsBig = false, isLoad = false, detailsView = true;

  bool extendable=true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getImage().then(
        (value) {
          fadeDetails();
          isLoad = true;
          setState(() {});
        },
      );
    });
  }

  fadeDetails() {
    Timer(const Duration(seconds: 5), () {
      setState(() {
        detailsView = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Const.mainColor,
      appBar: AppBar(toolbarHeight: 0,),
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy < 0) {
                  if (i != 1&&isLoad) {
                    startAnimate(details);
                    i++;
                  }
                } else {
                  if (i != 1&&isLoad) {
                    backAnimate(details);
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
                            bottom: 10,
                            left: 20,
                            right: 20,
                            child: SliderButton(
                              buttonColor: Styles.mainColor,
                              radius: 10,
                              action: () async {
                                ///Do something here OnSlide
        
                                Get.defaultDialog(
                                    title: "Rent Confirm",
                                      middleText: "",
        
                                content: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          // activeColor: Styles.paigeColor,
        
                                          fillColor: MaterialStateProperty.all(Styles.paigeColor),
                                          value: extendable, onChanged: (value) {
                                          extendable=value!;
        
                                          Get.appUpdate();
                                          setState(() {
        
                                          });
                                        },),
                                        Text("Extendable",style: Styles.headLineStyle3,),
        
                                      ],
        
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          fillColor: MaterialStateProperty.all(Styles.paigeColor),
        
                                          value: true, onChanged: (value) {
        
                                        },
                                        ),
                                        Text("Insurance included",style: Styles.headLineStyle3,),
        
                                      ],
        
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Styles.mainColor,
        
                                        // color: Styles.mainColor,
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${Random().nextInt(500)} AED ",
                                              style: Styles.headLineStyle3.copyWith(color: Colors.white),
                                            ),
                                            Text(
                                              " per day",
                                              style: Styles.headLineStyle4.copyWith(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                actions: [
        
                                ]
                                );
                                return true;
                              },
                              label: Text(
                                "Slide to rent this car",
                                style: Styles.headLineStyle1.copyWith(
                                    color: Styles.paigeToBrownColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              ),
                              icon: const Icon(
                                CupertinoIcons.square_on_circle,
                                color: Styles.paigeToBrownColor,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: BackButton(color: Const.mainColor,),)
          ],
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
border: Border.all(color: Styles.mainColor.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(20),
        boxShadow:  [
          BoxShadow(
            color: Styles.paigeColor.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 0,

            // offset: Offset(0, 5),
          ),
        ],
      ),
      width: 180,
      height: 110,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 30, width: 30),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(title,
                    style: Styles.headLineStyle3.copyWith(color: Colors.black)),
                Text(subtitle,
                    maxLines: 2,
                    style: Styles.headLineStyle4
                        .copyWith(color: Styles.mainColor)),
                const Spacer()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftInfo() {
    return AnimatedPositioned(
      duration: Durations.medium2,
      top: 100,
      left: carIsBig ? 20 : -200,
      child: Column(
        children: [
          _buildInfoCard(
              "assets/car_details/fuel.png", "Diesel", "Common Rail Fuel Injection"),
          const SizedBox(height: 20),
          _buildInfoCard(
              "assets/car_details/Acceleration.png", "Acceleration", "0 - 100km / 11s"),
          const SizedBox(height: 20),
          _buildInfoCard(
              "assets/car_details/sets.png", "Cool Seat", "Temp Control on 5 seat"),
          const SizedBox(height: 20),
          _buildInfoCard("assets/car_details/careng.png", "SKYACTIV-G", "6 SPEED SKYACTIV"),
        ],
      ),
    );
  }

  Widget _buildImageFooter() {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined, color: Styles.paigeColor),
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
    return  AnimatedPositioned(
            duration: Durations.long4,
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            child: Listener(
              onPointerDown: (_) => fingersCount++,
              onPointerUp: (_) => fingersCount--,
              onPointerMove: (event) {
                if (enableRotation && fingersCount == 1 && !carIsBig&&isLoad) {
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
                    child: Image.network(
                      widget.carModel.carColor![0].images![indexOf360Image],
                      height: carHeight,
                      width: carWidth,
                      fit: BoxFit.cover,
                    ),

                  ),
              if(!isLoad)
              const Center(
                child: CircularProgressIndicator(color: Colors.greenAccent),
              ),
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
      top: 270,
      duration: Durations.extralong4,
      child: Container(
        height: 270,
        width: Get.width,
        alignment: Alignment.center,
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
    );
  }

  Widget _buildBottomInfo() {
    return Positioned(
      bottom: 10,
      child: AnimatedOpacity(
        duration: Durations.medium2,
        opacity: carIsBig ? 0 : 1.0,
        child: Column(
          children: [
            Image.asset(
              "assets/car_details/arrowUp.png",
              height: 40,
              color: Styles.mainColor,
            )/*.animate(onPlay: (controller) => controller.repeat()).shakeY(
                  hz: 0.5,
                  duration: const Duration(seconds: 2),
                  // end:  -0.5,
                )*/,
            const SizedBox(
              height: 10,
            ),
            Text(
              "Swipe up to view details",
              style: Styles.headLineStyle2.copyWith(
                  color: Styles.mainColor, fontWeight: FontWeight.w400),
            )/*.animate(onPlay: (controller) => controller.repeat()).shimmer(
                color: Colors.red, duration: const Duration(seconds: 2)),*/
          ],
        ),
      ),
    );
  }

  Widget _buildRightInfo() {
    return AnimatedPositioned(
      duration: Durations.medium2,
      top: 100,
      right: carIsBig ? 20 : -200,
      child: Column(
        children: [
          _buildInfoCard(
              "assets/car_details/cargear.png", "Automatic", "Common Rail Fuel Injection"),
          const SizedBox(height: 20),
          _buildInfoCard("assets/car_details/24hours.png", "1 day rental", "1500 AE"),
          const SizedBox(height: 20),
          _buildInfoCard("assets/car_details/addOns.png", "AddOns", "might want to use"),
          const SizedBox(height: 20),
          _buildInfoCard("assets/car_details/travel.png", "Travel Bags", "More than 5 bag"),
        ],
      ),
    );
  }

  Future<void> getImage() async {
    for (var element in widget.carModel.carColor![0].images!) {
      try {
        await precacheImage(NetworkImage(element), context);
      } catch (e) {
        print('Failed to load and cache the image: $e');
      }
    }
  }

  void backAnimate(DragUpdateDetails details) {
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
