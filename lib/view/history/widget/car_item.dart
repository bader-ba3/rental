import 'package:get/get.dart';
import 'package:rental/model/reservation_model.dart';
import 'package:rental/utils/hive.dart';
import '../../../../Utils/app_style.dart';
import '../../../utils/const.dart';
import '../../../model/Car_Model.dart';
import '../../../utils/services.dart';
import '../../Cars/Car_view.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../../provider/home/carTapWidget.dart';

class CarItemWidget extends StatefulWidget {
  const  CarItemWidget({super.key, required this.reservationModel});

  @override
  State<CarItemWidget> createState() => _CarItemWidgetState();
  final ReservationModel reservationModel;
}

class _CarItemWidgetState extends State<CarItemWidget> {
bool expand=false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.short2,
      height:expand?225: 475,
      width: Get.width,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Const.mainColor.withOpacity(0.3), blurRadius: 5)
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            left: -30,
            child: Row(
              children: [
                SizedBox(
                  height: 150,
                  child: SafeArea(
                    // tag: widget.reservationModel.carImage0.toString(),
                    child: FutureBuilder(
                      future: Utils().saveImage(widget.reservationModel.carImage13.toString()),
                      builder: (context, snapshot) {
                        if(snapshot.data==null) {
                          return SizedBox();
                        }
                        return Image.file(snapshot.data!);
                      },
                    ),
                    // child: Image.network(
                    //   widget.reservationModel.carImage0.toString(),
                    // ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.reservationModel.carName!,
                      maxLines: 2,
                      style: Styles.headLineStyle4.copyWith(color: Colors.black,fontSize: 22),
                    ),
                    Text(
                      widget.reservationModel.carDes!,
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

                          Text(
                            "rental Date: ${widget.reservationModel.pickupDate}",
                            style: Styles.headLineStyle4.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            width: 5,
                          ),

                          Container(
                            width: 1,
                            color: Colors.black54,
                            height: 20,
                          ),

                          Container(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              "return Date: ${widget.reservationModel.returnDate}",
                              style: Styles.headLineStyle4.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AnimatedCrossFade(
                              firstChild: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        print("object");
                                        expand=!expand;
                                        setState(() {
                                    
                                        });
                                       // Get.to(()=>CarPage( carId: widget.reservationModel.carId.toString(),));
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
                                        color: Const.mainColor,

                                        // color: Styles.mainColor,
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              widget.reservationModel.price.toString()+" AED ",
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
                              ),
                              secondChild: Column(
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
                                              HiveDataBase.getUserData().name,
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
                                        text: "address.toString()",
                                      ),
                                      const Spacer(),
                                      TextIconWidget(
                                        icon: Icons.access_time_outlined,
                                        text: "5 day",
                                      ),
                                      const Spacer(),
                                      TextIconWidget(
                                        icon: Icons.credit_card_outlined,
                                        text: "1300 AED",
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
                                        "15-4-2024",
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
                                        "20-4-2024",
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
                                        HiveDataBase.getUserData().passport,
                                        style: Styles.headLineStyle4
                                            .copyWith(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Const.mainColor.withOpacity(0.3),
                                  ),
SizedBox(height: 10,),
                                    Center(
                                      child: InkWell(
                                        onTap:(){
                                          expand=!expand;
                                          setState(() {

                                          });
                                          // controller.changeReservationStatus(id:model.id! , status:Const.reservationCanceled);
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
                                    )

                                ],
                              ),
                              crossFadeState: expand
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: Durations.short4,
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
