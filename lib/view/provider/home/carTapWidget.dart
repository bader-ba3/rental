import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/controller/home_page_view_model.dart';
import 'package:rental/model/Car_Model.dart';
import 'package:rental/model/reservation_model.dart';
import 'package:rental/model/small_car_model.dart';
import '../../../../utils/app_style.dart';
import '../../../utils/const.dart';
import '../../../utils/data.dart';
import '../../../utils/services.dart';

class CarTapWidget extends StatefulWidget {
  const CarTapWidget({super.key, required this.dataType});

  final String dataType;

  @override
  State<CarTapWidget> createState() => _CarTapWidgetState();
}

class _CarTapWidgetState extends State<CarTapWidget> {
  @override
  void initState() {
    //getInit();
    super.initState();
  }

  List<bool> expand = List.generate(
    6,
    (index) => false,
  );



  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageViewModel>(builder: (controller) {
      List<SmallCarModel> dataList = [];
      dataList = controller.allCars.where((element) => element.status == widget.dataType).toList();
      // if(widget.dataType == "all"){
      //   dataList= controller.allReservation.where((element) => element.reservationStatus == Const.reservationEnded ||element.reservationStatus == Const.reservationCanceled &&element.carStatus == Const.carStatusIdle).toList();
      //   _type="available";
      // }else if(widget.dataType == Const.carStatusMaintenance){
      //   dataList= controller.allReservation.where((element) => element.carStatus == Const.carStatusMaintenance ).toList();
      //   _type="maintenance";
      // }else if(widget.dataType == Const.reservationPending){
      //   dataList= controller.allReservation.where((element) => element.reservationStatus == Const.reservationPending ).toList();
      //   _type="pending";
      // }else{
      //   dataList= controller.allReservation.where((element) => element.reservationStatus == widget.dataType ).toList();
      //   _type="active";
      // }
      return dataList.isEmpty
          ? Center(child: Column(
        children: [
          Spacer(flex: 2,),
          Image.asset("assets/no_data.png"),
          Spacer(flex: 1,),
          Text("No Data",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
          Spacer(flex: 1,),
        ],
      ))
          : ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (BuildContext context, int index) {
                SmallCarModel smallModel = dataList[index];
                CarModel carModel = carList.firstWhere((element) => element.carId == smallModel.id);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
                  child: GestureDetector(
                    onTap: () {
                      expand[index] = !expand[index];
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Const.mainColor.withOpacity(0.3), blurRadius: 5)],
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height:   widget.dataType == Const.carStatusMaintenance
                                    ? 90
                                    : 70,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        carList[index].carName! /*widget.carModel.carName!*/,
                                        maxLines: 2,
                                        style: Styles.headLineStyle3.copyWith(color: Const.mainColor),
                                      ),
                                      Text(
                                        carList[index].carModule! /*widget.carModel.carModule!*/,
                                        maxLines: 2,
                                        style: Styles.headLineStyle4.copyWith(),
                                      ),
                                      Text(
                                        "RAK 115322" /*widget.carModel.carModule!*/,
                                        maxLines: 2,
                                        style: Styles.headLineStyle4.copyWith(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // if ( model.reservationStatus == Const.reservationPending ||model.reservationStatus == Const.reservationStarted)
                                      //   Text(
                                      //     "Add-ons" /*widget.carModel.carModule!*/,
                                      //     maxLines: 1,
                                      //     style: Styles.headLineStyle4.copyWith(
                                      //         color: Const.paigeToBrownColor),
                                      //   ),
                                      // if ( model.reservationStatus == Const.reservationPending ||model.reservationStatus == Const.reservationStarted)
                                      //   Text(
                                      //     "With three suitcases and a refrigerator",
                                      //     maxLines: 2,
                                      //     style: Styles.headLineStyle4.copyWith(),
                                      //   ),
                                      if ( widget.dataType == Const.carStatusMaintenance)
                                        Text(
                                          "Crashed" /*widget.carModel.carModule!*/,
                                          maxLines: 1,
                                          style: Styles.headLineStyle4.copyWith(color: Const.paigeToBrownColor),
                                        ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -40,
                                  right: -50,
                                  child: SizedBox(height: 135, child: Image.file(carModel.carColor!.first.imagesFile![3])
                                      /*    child: Image.network(
                              carList[index].carColor![0].images![3],
                            ),*/
                                      ),
                                )
                              ],
                            ),
                          ),
                          AnimatedCrossFade(
                            firstChild:  widget.dataType == Const.carStatusMaintenance
                                ? Column(
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        color: Const.mainColor.withOpacity(0.3),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "External Damage Assessment:\nFront Bumper: Significant damage including cracks and dents on the right side.\nRear Bumper: Minor scratches.\nDoors: Front right door has noticeable dents, other doors are intact.",
                                            style: Styles.headLineStyle4,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        color: Const.mainColor.withOpacity(0.3),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Crash Date & Time",
                                            style: Styles.headLineStyle4,
                                          ),
                                          const Spacer(),
                                          Text(
                                            "${Random().nextInt(30)}/${Random().nextInt(12)}/2024",
                                            style: Styles.headLineStyle4.copyWith(color: Colors.black),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Maintenance Number",
                                            style: Styles.headLineStyle4,
                                          ),
                                          const Spacer(),
                                          Text(
                                            "MAI11788468453",
                                            style: Styles.headLineStyle4.copyWith(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.changeCarStatus(id: carModel.carId.toString(), status: Const.carStatusIdle);
                                        },
                                        child: Container(
                                          width: 180,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Const.paigeColor,
                                            border: Border.all(color: Const.paigeColor),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Active",
                                                style: Styles.headLineStyle2.copyWith(color: Colors.white),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(
                                                Icons.check,
                                                color: Colors.greenAccent,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Center(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.changeCarStatus(id: carModel.carId.toString(), status: Const.carStatusMaintenance);
                                          },
                                          child: Container(
                                            width: 180,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Const.paigeColor,
                                              border: Border.all(color: Const.paigeColor),
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.car_repair_outlined,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Maintenance",
                                                  style: Styles.headLineStyle2.copyWith(color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            secondChild: Center(
                              child: Image.asset(
                                "assets/arrowDown.png",
                                height: 20,
                                color: Const.paigeColor,
                              ),
                            ),

                            crossFadeState: expand[index] ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                            duration: Durations.short4,
                            // firstCurve: Curves.easeInQuad,
                            //   sizeCurve: Curves.elasticInOut,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
    });
  }
}

class TextIconWidget extends StatelessWidget {
  const TextIconWidget({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Const.paigeColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: Styles.headLineStyle3.copyWith(fontSize: 14, color: Colors.black),
        )
      ],
    );
  }
}
