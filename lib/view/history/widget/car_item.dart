import 'package:get/get.dart';
import 'package:rental/model/reservation_model.dart';
import '../../../../Utils/app_style.dart';
import '../../../utils/const.dart';
import '../../../model/Car_Model.dart';
import '../../../utils/services.dart';
import '../../Cars/Car_view.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CarItemWidget extends StatefulWidget {
  const  CarItemWidget({super.key, required this.reservationModel});

  @override
  State<CarItemWidget> createState() => _CarItemWidgetState();
  final ReservationModel reservationModel;
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
                  child: Hero(
                    tag: widget.reservationModel.carImage0.toString(),
                    child: FutureBuilder(
                      future: Utils().saveImage(widget.reservationModel.carImage13.toString()),
                      builder: (context, snapshot) {
                        if(snapshot.data==null)
                          return SizedBox();
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
                          const Spacer(),
                          Text(
                            "rental Date: "+ widget.reservationModel.pickupDate.toString(),
                            style: Styles.headLineStyle4.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            width: 5,
                          ),
                          const Spacer(),
                          Container(
                            width: 1,
                            color: Colors.black54,
                            height: 20,
                          ),
                          const Spacer(),
                          Container(
                            width: 5,
                          ),
                          Text(
                            "return Date: "+widget.reservationModel.returnDate.toString(),
                            style: Styles.headLineStyle4.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
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
                               Get.to(()=>CarPage( carId: widget.reservationModel.carId.toString(),));
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
