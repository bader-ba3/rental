import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/controller/home_page_view_model.dart';
import 'package:rental/model/reservation_model.dart';
import '../../../../utils/app_style.dart';
import '../../../utils/const.dart';
import '../../../utils/data.dart';
import '../../../utils/services.dart';

class TapWidget extends StatefulWidget {
  TapWidget({super.key, required this.dataType});

  String dataType;

  @override
  State<TapWidget> createState() => _TapWidgetState();
}

class _TapWidgetState extends State<TapWidget> {
  @override
  void initState() {
    super.initState();
  }

  List<bool> expand = List.generate(
    6,
        (index) => false,
  );


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageViewModel>(builder: (controller) {
      List<ReservationModel> dataList = [];
      print(widget.dataType);
      dataList= controller.allReservation.where((element) => element.reservationStatus == widget.dataType ).toList();

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
        ?Center(child: Text("No Data",style: TextStyle(color: Colors.black),),)
        :ListView.builder(
        itemCount: dataList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          ReservationModel model = dataList[index];
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
                  boxShadow: [
                    BoxShadow(color: Const.mainColor.withOpacity(0.3), blurRadius: 5)
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:  70+(model.addOns!=""?50:0),
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
                                  carList[index]
                                      .carName! /*widget.carModel.carName!*/,
                                  maxLines: 2,
                                  style: Styles.headLineStyle3
                                      .copyWith(color: Const.mainColor),
                                ),
                                Text(
                                  carList[index]
                                      .carModule! /*widget.carModel.carModule!*/,
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
                                if ( (model.reservationStatus == Const.reservationPending ||model.reservationStatus == Const.reservationStarted)&& model.addOns!="")
                                  Text(
                                    "Add-ons" /*widget.carModel.carModule!*/,
                                    maxLines: 1,
                                    style: Styles.headLineStyle4.copyWith(
                                        color: Const.paigeToBrownColor),
                                  ),
                                if (( model.reservationStatus == Const.reservationPending ||model.reservationStatus == Const.reservationStarted) && model.addOns!="")
                                  Text(
                                    "With "+model.addOns.toString(),
                                    maxLines: 2,
                                    style: Styles.headLineStyle4.copyWith(),
                                  ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: -40,
                            right: -50,
                            child: SizedBox(
                              height: 135,
                              child: FutureBuilder(
                                future: Utils().saveImage(model.carImage3.toString()),
                                builder: (context, snapshot) {
                                  if(snapshot.data==null)
                                    return SizedBox();
                                  return Image.file(snapshot.data!);
                                },
                              ),
                              // child: Image.file(
                              //   (model.carImage0!),
                              //   errorBuilder: (context, error, stackTrace) {
                              //     return Image.network(
                              //       model.carImage.toString(),
                              //       errorBuilder: (context, error, stackTrace) {
                              //         return Image.asset(
                              //             "assets/px/mazda3Hatchback_1.png");
                              //       },
                              //     );
                              //   },
                              // ),
                              /*    child: Image.network(
                              carList[index].carColor![0].images![3],
                            ),*/
                            ),
                          )
                        ],
                      ),
                    ),
                    AnimatedCrossFade(
                      firstChild:  Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: Const.mainColor.withOpacity(0.3),
                          ),
                          SizedBox(
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      model.userName!,
                                      style: Styles.textStyle,
                                    ),
                                    Text(
                                      "Resident",
                                      style: Styles.headLineStyle4.copyWith(
                                          color: Const.mainColor),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star_rounded,
                                          color: Colors.orangeAccent,
                                        ),
                                        Text(
                                          "5.0",
                                          style: Styles.textStyle,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  width: 95,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(5),
                                      color: Const.mainColor.withOpacity(0.3),
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              "https://cdn.al-ain.com/lg/images/2020/9/24/176-163839-muhammad-ramadan-off-his-new-car-3.jpeg"),
                                          fit: BoxFit.contain)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: Const.mainColor.withOpacity(0.3),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               TextIconWidget(
                                icon: Icons.location_on_outlined,
                                text: model.address.toString(),
                              ),
                              const Spacer(),
                              TextIconWidget(
                                icon: Icons.access_time_outlined,
                                text: "${model.time} day",
                              ),
                              const Spacer(),
                              TextIconWidget(
                                icon: Icons.credit_card_outlined,
                                text: "${model.price} AED",
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                "  PickUp Date & Time",
                                style: Styles.headLineStyle4,
                              ),
                              const Spacer(),
                              Text(
                                model.pickupDate.toString(),
                                style: Styles.headLineStyle4
                                    .copyWith(color: Colors.black),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                "  Return Date & Time",
                                style: Styles.headLineStyle4,
                              ),
                              const Spacer(),
                              Text(
                               model.returnDate.toString(),
                                style: Styles.headLineStyle4
                                    .copyWith(color: Colors.black),
                              )
                            ],
                          ),
                          Divider(
                            color: Const.mainColor.withOpacity(0.3),
                          ),
                          Row(
                            children: [
                              Text(
                                "Revers Number",
                                style: Styles.headLineStyle4,
                              ),
                              const Spacer(),
                              Text(
                                model.id.toString(),
                                style: Styles.headLineStyle4
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                          Divider(
                            color: Const.mainColor.withOpacity(0.3),
                          ),
                          if(widget.dataType  == Const.reservationPending)
                          Row(
                            children: [
                              InkWell(
                                onTap:(){
                                  controller.changeReservationStatus(id:model.id! , status:Const.reservationCanceled);
                                  },
                                child: Container(
                                  width: 150,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Const.paigeColor,
                                    border:
                                    Border.all(color: Const.paigeColor),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Cancel",
                                        style: Styles.headLineStyle2.copyWith(color: Colors.white),
                                      ),
                                      const SizedBox(width: 5,),
                                      Icon(
                                        Icons.close,
                                        color:Colors.red.shade700 ,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap:(){
                                  controller.changeReservationStatus(id:model.id! , status:Const.reservationStarted);
                                  controller.changeCarStatus(id:model.carId! , status:Const.carStatusRented);
                                },
                                child: Container(
                                  width: 150,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Const.paigeColor,

                                    border:
                                    Border.all(color: Const.paigeColor),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Active",
                                        style: Styles.headLineStyle2.copyWith(color: Colors.white),
                                      ),
                                      const SizedBox(width: 5,),
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
                          else
                            InkWell(
                              onTap:(){
                                controller.changeReservationStatus(id:model.id! , status:Const.reservationEnded);
                                controller.changeCarStatus(id:model.carId! , status:Const.carStatusIdle);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Const.paigeColor,
                                  border:
                                  Border.all(color: Const.paigeColor),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Ended",
                                      style: Styles.headLineStyle2.copyWith(color: Colors.white),
                                    ),
                                    const SizedBox(width: 5,),
                                    Icon(
                                      Icons.close,
                                      color:Colors.red.shade700 ,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                      secondChild: Center(
                        child: Image.asset(
                          "assets/arrowDown.png",
                          height: 20,
                          color: Const.paigeColor,
                        ),
                      ),
                      crossFadeState: expand[index]
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
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
          style:
          Styles.headLineStyle3.copyWith(fontSize: 14, color: Colors.black),
        )
      ],
    );
  }
}
