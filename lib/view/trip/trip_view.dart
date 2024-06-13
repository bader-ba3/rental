import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/view/trip/trip_details.dart';

import '../../utils/const.dart';

class TripView extends StatelessWidget {
  const TripView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Explore",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Const.mainColor,
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Const.mainColor, borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40))),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Get.to(()=>TripDetails(index: index,));
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/trip/trip${index}.png",fit: BoxFit.fill,height: 300,)),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Const.paigeColor.withOpacity(0.3),
                                Const.paigeColor,
                              ]
                            ),borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            //  color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius:BorderRadius.circular(20),
                              // image: DecorationImage(
                              //     image: AssetImage("assets/trip/trip${index}.png"),
                              //     fit: BoxFit.fill,
                              //   colorFilter: ColorFilter.mode(Const.paigeColor.withOpacity(0.5), BlendMode.color)
                              // )
                                    ),
                          child: Column(
                            children: [
                              Spacer(),
                              // SizedBox(
                              //   width: 100,
                              //   height: 100,
                              //   child: Placeholder(),
                              // ),
                              // SizedBox(
                              //   width: 10,
                              // ),
                              Container(
                                padding: EdgeInsets.all(4),
                                child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dubai",
                                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Colors.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Des "*3,
                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white),
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text((Random().nextDouble() * 4 + 1).toStringAsFixed(1),style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white),),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text("(${Random().nextInt(5000)} rate)",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white),)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
