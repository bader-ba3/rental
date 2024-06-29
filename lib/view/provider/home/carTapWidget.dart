import 'dart:math';
import 'package:flutter/cupertino.dart';
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

  List reasonList = [
    "rent on an annual contract",
    "rent on a monthly contract",
    "personal use",
    "another reason",
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageViewModel>(builder: (controller) {
      List<SmallCarModel> dataList = [];
      dataList = controller.allCars.where((element) => element.status == widget.dataType).toList();
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
                          if(widget.dataType == Const.carStatusOffline&&smallModel.reason!=null)
                          Text(smallModel.reason.toString()),
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
                                        Row(
                                          children: [
                                            Text("the periodic maintenance is after 2 day",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                            Spacer(),
                                            InkWell(
                                                onTap: (){
                                                  List allType= ['Day','Week',"month","Year"];
                                                  showModalBottomSheet(context: context, builder: (context) {
                                                    return  Container(
                                                      height: 200,
                                                      width: Get.width,
                                                      child: Center(
                                                        child: Column(
                                                          children: [
                                                            SizedBox(height: 20,),
                                                            Row(
                                                              children: [
                                                                SizedBox(width: 20,),
                                                                InkWell(
                                                                    onTap: (){
                                                                      Get.back();
                                                                    },
                                                                    child: Text("Cancel",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),)),
                                                                Spacer(),
                                                                InkWell(
                                                                    onTap: (){
                                                                      Get.back();
                                                                    },
                                                                    child: Icon(Icons.check,color: Colors.green,)),
                                                                SizedBox(width: 20,),
                                                              ],
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: [
                                                                  Text("periodic maintenance every: ",style: TextStyle(fontSize: 18),),
                                                                  SizedBox(
                                                                    height: 150,
                                                                    width: 75,
                                                                    child: CupertinoPicker(
                                                                      magnification: 1.22,
                                                                      squeeze: 1,
                                                                      useMagnifier: true,
                                                                      itemExtent: 32.0,
                                                                      scrollController: FixedExtentScrollController(
                                                                        // initialItem: _selectedFruit,
                                                                      ),
                                                                      // This is called when selected item is changed.
                                                                      onSelectedItemChanged: (int selectedItem) {
                                                                        setState(() {
                                                                          //_selectedFruit = selectedItem;
                                                                        });
                                                                      },
                                                                      children:
                                                                      List<Widget>.generate(100, (int index) {
                                                                        return Center(child: Text(index.toString()));
                                                                      }),
                                                                    ),
                                                                  ),
                                                                  // Container(
                                                                  //   decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(8)),
                                                                  //   height: 50,
                                                                  // width: 50,
                                                                  // child: TextFormField(
                                                                  //   textAlign: TextAlign.center,
                                                                  //   decoration: InputDecoration(border: InputBorder.none),
                                                                  // ),),
                                                                SizedBox(
                                                                  height: 150,
                                                                  width: 100,
                                                                  child: CupertinoPicker(
                                                                  magnification: 1.22,
                                                                  squeeze: 1,
                                                                  useMagnifier: true,
                                                                  itemExtent: 32.0,
                                                                  scrollController: FixedExtentScrollController(
                                                                   // initialItem: _selectedFruit,
                                                                  ),
                                                                  // This is called when selected item is changed.
                                                                  onSelectedItemChanged: (int selectedItem) {
                                                                    setState(() {
                                                                      //_selectedFruit = selectedItem;
                                                                    });
                                                                  },
                                                                  children:
                                                                  List<Widget>.generate(allType.length, (int index) {
                                                                    return Center(child: Text(allType[index]));
                                                                  }),
                                                                                                                        ),
                                                                )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },);
                                                },
                                                child: Icon(Icons.edit,color: Const.paigeColor,))
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if(widget.dataType==Const.carStatusOffline){
                                                  controller.changeCarStatus(id: carModel.carId.toString(), status:Const.carStatusIdle);
                                                }else{
                                                  showModalBottomSheet(context: context, builder: (context) {
                                                    String? selectedReason ;
                                                  return  Container(
                                                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))),
                                                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 0),
                                                    child: StatefulBuilder(
                                                      builder: (context,setstate) {
                                                        return Wrap(
                                                          children: [
                                                            SizedBox(height: 20,width: Get.width,),
                                                            SizedBox(width: Get.width,child: Padding(
                                                              padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 20),
                                                              child: Text("Choose The Reson:",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                                                            ),),
                                                            for(var i in reasonList)
                                                              Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Row(
                                                                  children: [
                                                                    Checkbox(value: i == selectedReason, onChanged: (_){
                                                                      if(_!){
                                                                        selectedReason = i;
                                                                      }else{
                                                                        selectedReason = null;
                                                                      }
                                                                      setstate((){});
                                                                    }),
                                                                    Text(i)
                                                                  ],
                                                                ),
                                                              ),
                                                            SizedBox(height: 10,width: Get.width,),
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 20),
                                                              child: InkWell(
                                                                onTap:(){
                                                                  controller.changeCarStatus(id: carModel.carId.toString(), status: Const.carStatusOffline,reason:selectedReason);
                                                                  Get.back();
                                                                },
                                                                child: Container(
                                                                  alignment: Alignment.center,
                                                                  padding: EdgeInsets.symmetric(horizontal: 8),
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
                                                                       "Confirm",
                                                                        style: Styles.headLineStyle2.copyWith(color: Colors.white),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(height: 30,width: Get.width,),
                                                          ],
                                                        );
                                                      }
                                                    ),
                                                    );
                                                  },);
                                                }
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(horizontal: 5),
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
                                                      Icons.car_crash,
                                                      color: Colors.white,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      widget.dataType==Const.carStatusOffline?"Go Online": "Go Offline",
                                                      style: Styles.headLineStyle2.copyWith(color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller.changeCarStatus(id: carModel.carId.toString(), status: Const.carStatusMaintenance);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(horizontal: 5),
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
