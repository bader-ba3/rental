import 'dart:math';

import 'package:fast_ui_kit/ui/widgets/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../controller/home_page_view_model.dart';
import '../../utils/const.dart';
import '../Cars/car_home.dart';

class TripDetails extends StatefulWidget {
  final int index;
  const TripDetails({super.key, required this.index});

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  double top = 1000;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().waitUntilFirstFrameRasterized.then((value) {
      top = 220;
      setState(() {});
    });
    super.initState();
  }

  int seats = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.mainColor,
      body: Stack(
        children: [
          Hero(
            tag: widget.index,
            child: Material(
              color: Colors.transparent,
              child: Container(
                height:250,
                width: MediaQuery.sizeOf(context).width,
                child: Image.asset("assets/trip/trip${widget.index}.png",fit: BoxFit.fill,),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(child: BackButton(color: Colors.white,)),
          ),
      AnimatedPositioned(
        duration: Duration(milliseconds: 500),
            top: top,
            bottom: 90,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  // padding: EdgeInsets.zero,
                  children: [
                    Row(
                      children: [
                        Container(

                          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          decoration: BoxDecoration(color: Const.paigeColor,borderRadius: BorderRadius.circular(10)),
                          child: const Text("Best on Dubai",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text("Dubai Dubai",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text((Random().nextDouble() * 4 + 1).toStringAsFixed(1)),
                        SizedBox(
                          width: 5,
                        ),
                        Text("(${Random().nextInt(5000)} rate)")
                      ],
                    ),
                    InkWell(onTap: (){}, child: Text("Show Rates",style: TextStyle(color: Colors.blue),)),
                    SizedBox(height: 20,),
                    Text("Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    const Text("Embark on an unforgettable journey through the United Arab Emirates, a land of modern marvels, rich cultural heritage, and breathtaking landscapes. This trip will take you through the bustling metropolis of Dubai, the cultural heart of Sharjah, the serene beauty of Ras Al Khaimah, the vibrant streets of Abu Dhabi, and the charming emirates of Ajman and Umm Al Quwain. Get ready to experience a perfect blend of traditional and contemporary, desert and sea, luxury and simplicity.",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 18),),
                    SizedBox(height: 20,),
                    Text("The Conditions",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    Text("The credit Card is required.",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 18),),
                    Text("Family only.",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 18),),
                    SizedBox(height: 20,),
                    Text("Additional information",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    Text("Contains breakfast.",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 18),),
                    Text("Free canceled.",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 18),),
                    Text("No need to advance payments.",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 18),),
                    SizedBox(height: 20,),
                    Text("Location",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 250,
                        width: MediaQuery.sizeOf(context).width,
                        foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey.withOpacity(0.2)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(image: AssetImage("assets/map.jpg"),fit: BoxFit.fill)),
                        child: Center(child: Icon(Icons.pin_drop_outlined,size: 75,color: Const.mainColor,),),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                BoxShadow(color: Colors.black26,blurRadius: 20)
              ]),
              padding: EdgeInsets.symmetric(vertical: 25,horizontal: 15),
              child:Row(
                children: [
                  SizedBox(width: 10,),
                  StatefulBuilder(
                    builder: (context,setstate) {
                      return Row(
                        children: [
                          Text("Persons:",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600)),
                          SizedBox(width: 15,),
                          InkWell(
                              onTap: (){
                                if(seats>1)seats--;
                                setstate((){});
                              },
                              child: CircleAvatar(
                                  backgroundColor: Const.brownColor,
                                  radius: 15,
                                  child: Text("-",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),))),
                          SizedBox(width: 15,),
                          Text(seats.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                          SizedBox(width: 15,),
                          CircleAvatar(
                            backgroundColor: Const.brownColor,
                            radius: 15,
                            child: InkWell(
                                onTap: () {
                                  if(seats<6)seats++;
                                  setstate((){});
                                },
                                child: Text("+",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),)),
                          ),
                        ],
                      );
                    }
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      ({DateTime start, DateTime end})? tempDate ;
                      HomePageViewModel homePageViewModel = Get.find<HomePageViewModel>();
                      if (Get.find<HomePageViewModel>().carIsLoading) {
                        Get.defaultDialog(
                            backgroundColor: Const.mainColor,
                            title: "choose start and end date",
                            titleStyle: TextStyle(color: Colors.white),
                            content: Container(
                              color: Const.mainColor,
                              height: Get.height/2,
                              width: Get.height/2,
                              child: FastCalendar(
                                initialSelectedFirstDate:
                                homePageViewModel.startAndEndDate?.start,
                                initialSelectedLastDate:
                                homePageViewModel.startAndEndDate?.end,
                                onRangeSelected: (DateTime? start, DateTime? end) {
                                  if (start != null && end != null) {
                                    tempDate = (start: start, end: end);
                                  }
                                },
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1)),
                                rangeMode: true,
                              ),
                            ),
                            actions: [
                              ElevatedButton(onPressed: (){
                                Get.back();
                              }, child: Text("cancel")),
                              ElevatedButton(onPressed: (){
                                if(tempDate!=null){
                                  homePageViewModel.startAndEndDate = tempDate;
                                  Get.to(const CarHome());
                                }
                              }, child: Text("ok")),

                            ]
                        );
                        //
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Const.mainColor,borderRadius: BorderRadius.circular(10)),
                      width: 150,
                      height: 40,
                      child: Center(child: Text("Show Car",style: TextStyle(color: Colors.white,fontSize: 18),),),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
