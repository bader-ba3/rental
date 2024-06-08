import 'dart:math';
import 'package:get/get.dart';
import '../../../../Utils/app_style.dart';
import '../../../utils/const.dart';
import '../../Cars/Car_Model.dart';
import '../../Cars/Car_view.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CarItemWidget extends StatefulWidget {
  const CarItemWidget({super.key, required this.carModel});

  @override
  State<CarItemWidget> createState() => _CarItemWidgetState();
  final CarModel carModel;
}

class _CarItemWidgetState extends State<CarItemWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      width: Get.width,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [  BoxShadow(
            blurRadius: 5,
            offset:  -Offset(5,5),
            color: Color(0xff772035),
            inset: false
        ),
          BoxShadow(
              blurRadius: 5,
              offset:Offset(5, 5) ,
              color: Color(0xff150106),
              inset: false
          ),],
        color: Const.mainColor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            left: -45,
            child: Row(
              children: [
                SizedBox(
                  height: 150,
                  child: Hero(
                    tag: widget.carModel.carColor![0].images![10],
                    child: Image.network(
                      widget.carModel.carColor![0].images![10],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.carModel.carName!,
                      maxLines: 2,
                      style: Styles.headLineStyle4.copyWith(color: Colors.white,fontSize: 22),
                    ),
                    Text(
                      widget.carModel.carModule!,
                      maxLines: 2,
                      style: Styles.headLineStyle4.copyWith(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Text(
                            "rental Date: "+DateTime.now().toString().split(" ")[0],
                            style: Styles.headLineStyle4.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 5,
                          ),
                          const Spacer(),
                          Container(
                            width: 1,
                            color: Colors.white,
                            height: 20,
                          ),
                          const Spacer(),
                          Container(
                            width: 5,
                          ),
                          Text(
                            "return Date: "+DateTime.now().toString().split(" ")[0],
                            style: Styles.headLineStyle4.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
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
                            child: InkWell(
                              onTap: (){
                                Get.to(()=>CarPage(carModel: widget.carModel));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,

                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Details",
                                        style: Styles.headLineStyle4.copyWith(fontSize: 16,color: Const.mainColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
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
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
