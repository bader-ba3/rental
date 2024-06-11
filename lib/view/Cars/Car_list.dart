import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/view/Cars/widget/app_bottom.dart';
import '../../../../Utils/app_style.dart';
import '../../utils/const.dart';
import '../../model/Car_Model.dart';
import 'Car_view.dart';

class CarViewWidget extends StatefulWidget {
  const CarViewWidget({super.key, required this.carModel, required this.index});

  @override
  State<CarViewWidget> createState() => _CarViewWidgetState();
  final CarModel carModel;
  final int index;
}

class _CarViewWidgetState extends State<CarViewWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: Get.width,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.6), blurRadius: 10)],
        color: Colors.white,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: Row(
              children: [
                SizedBox(
                  height: 190,
                  child: Hero(
                    tag: widget.carModel.carColor![widget.index].images![1],
                    child:Image.file(
                      ( widget.carModel.carColor![widget.index].imagesFile![3]),
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          widget.carModel.carColor![widget.index].images![3],
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                                "assets/px/mazda3Hatchback_1.png");
                          },
                        );
                      },)
/*
                    child: Image.network(
                      widget.carModel.carColor![widget.index].images![3],
                    ),
*/
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            width: 160,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.carModel.carName!,
                    maxLines: 2,
                    style: Styles.headLineStyle3.copyWith(color: Const.mainColor),
                  ),
                  Text(
                    widget.carModel.carModule!,
                    maxLines: 2,
                    style: Styles.headLineStyle4.copyWith(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 80,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        "5 seats",
                        style: Styles.headLineStyle4.copyWith(color: Const.mainColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Container(
                        width: 1,
                        color: Colors.black,
                        height: 20,
                      ),
                      const Spacer(),
                      Text(
                        "Automatic",
                        style: Styles.headLineStyle4.copyWith(color: Const.mainColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Container(
                        width: 1,
                        color: Colors.black,
                        height: 20,
                      ),
                      const Spacer(),
                      Text(
                        "Fuel",
                        style: Styles.headLineStyle4.copyWith(color: Const.mainColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppBottom(
                            text: "Detail",
                            onTap: () {
                              Get.to(CarPage(carModel: widget.carModel));
                            }),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Const.mainColor,

                            // color: Styles.mainColor,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.carModel.carPrice.toString()+" AED ",
                                  style: Styles.headLineStyle3.copyWith(color: Colors.white),
                                ),
                                Text(
                                  " per day",
                                  style: Styles.headLineStyle4.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
