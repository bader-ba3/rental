import 'dart:ffi';

import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:fast_ui_kit/ui/widgets/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter/painting.dart';
import 'package:rental/view/home_page/widget/button.dart';
import '../../../utils/const.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  bool isSettingOpened = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 5),
                    child: Container(
                      decoration: BoxDecoration(color: Const.mainColor, borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "search Location",
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  isSettingOpened = !isSettingOpened;
                  setState(() {});
                },
                child: Container(
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(color: Const.mainColor, borderRadius: isSettingOpened ? BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)) : BorderRadius.circular(15)),
                ),
              ),
            ],
          ),
          if (isSettingOpened)
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(color:Const.mainColor, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topLeft: Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: FastCalendar(
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
                        rangeMode: true,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        InkWell(
                            onTap: () {
                              isSettingOpened = false;
                              setState(() {});
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 30,
                            )),
                        Spacer(),
                        ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStatePropertyAll(0),
                                backgroundColor: MaterialStatePropertyAll(Const.paigeColor),
                                foregroundColor: MaterialStatePropertyAll(Colors.white),
                            ),
                            onPressed: () {
                              isSettingOpened = false;
                              setState(() {});
                            },
                            child: Text("ok")),
                        SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )
          else
            Container(
              width: double.infinity,
              child: DefaultTabController(
                  length: 5,
                  child: TabBar(
                    padding: EdgeInsets.zero,
                    tabAlignment: TabAlignment.start,
                    onTap: null,
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    isScrollable: true,
                    tabs: [
                      tabItem( "Car Type", (){
                        showCarTypeModalBottom();
                      }),
                      tabItem( "Seats", (){
                        showSeatsModalBottom();
                      }),
                      tabItem( "Transmission", (){
                        showTransmissionModalBottom();
                      }),
                      tabItem( "Brand", (){
                        showBrandTypeModalBottom();
                      }),
                      tabItem( "Engine", (){
                        showEngineModalBottom();
                      }),
                    ],
                  )),
            ),
        ],
      ),
    );
  }
  tabItem(text ,onTap){
    return Tab(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(color: Const.mainColor, borderRadius: BorderRadius.circular(10)),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
               text,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  showEngineModalBottom() {
    List textList  =["3-4","6","8+"];
    List transmissionType  = [];
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Container(
              height: 200,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(color: Const.mainColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            ),
            Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                        "Engine Selender",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
                      )),
                  SizedBox(height: 20,),
                  StatefulBuilder(
                      builder: (context,setstate) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(textList.length, (index) => ButtonWidget(
                              borderRadius:15,
                              isSelected: transmissionType.contains(index),
                              height: 55,
                              width: 90,
                              onTap: (){
                                if(transmissionType.contains(index)){
                                  transmissionType.remove(index);
                                }else {
                                  transmissionType.add(index);
                                }
                                setstate((){});
                              },
                              child:  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text(textList[index],style: TextStyle(color: Colors.white,fontSize: 22),))
                              ),
                            ),)
                        );
                      }
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  showTransmissionModalBottom() {
    List textList  =["manual","Automatic"];
    List transmissionType  = [];
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Container(
              height: 200,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(color: Const.mainColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            ),
            Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                        "Transmission",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
                      )),
                  SizedBox(height: 20,),
                  StatefulBuilder(
                      builder: (context,setstate) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(textList.length, (index) => ButtonWidget(
                              borderRadius:15,
                              isSelected: transmissionType.contains(index),
                              height: 55,
                              width: 150,
                              onTap: (){
                                if(transmissionType.contains(index)){
                                  transmissionType.remove(index);
                                }else {
                                  transmissionType.add(index);
                                }
                                setstate((){});
                              },
                              child:  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text(textList[index],style: TextStyle(color: Colors.white,fontSize: 22),))
                              ),
                            ),)
                        );
                      }
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  showSeatsModalBottom() {
    List textList  =["1-2","3-4","6+"];
    int? numberOfSeats ;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Container(
              height: 200,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(color: Const.mainColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            ),
            Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                        "Seats",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
                      )),
                  SizedBox(height: 20,),
                  StatefulBuilder(
                    builder: (context,setstate) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(3, (index) => ButtonWidget(
                          borderRadius:15,
                          isSelected: numberOfSeats == index,
                          height: 55,
                          width: 75,
                          onTap: (){
                            if(numberOfSeats==index){
                              numberOfSeats=null;
                            }else {
                              numberOfSeats=index;
                            }
                            setstate((){});
                          },
                          child:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text(textList[index],style: TextStyle(color: Colors.white,fontSize: 22),))
                          ),
                        ),)
                      );
                    }
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  showCarTypeModalBottom() {
    List carList = [
      "small",
      "medium",
      "suv",
      "big",
      "luxury",
      "people",
    ];
    List textList = [
      "Small Car",
      "Medium Car",
      "SUV Car",
      "Big Car",
      "Luxury",
      "people Carrier",
    ];
    List selectedList = [];

    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setstate) {
          return Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(color: Const.mainColor, borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
            child: SingleChildScrollView(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Center(
                        child: Text(
                      "Type",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
                    )),
                  ),
                  SizedBox(
                    height: 20,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                  for (var i in List.generate(textList.length, (index) => index))
                    ButtonWidget(
                      borderRadius:30,
                      width: MediaQuery.sizeOf(context).width/2.5,
                      height: 165,
                        isSelected: selectedList.contains(i),
                        onTap: (){
                          if(selectedList.contains(i)){
                            selectedList.remove(i);
                          }else{
                            selectedList.add(i);
                          }
                          setstate((){});
                        },
                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Image.asset(
                              "assets/car/${carList[i]}.png",
                              width:  MediaQuery.sizeOf(context).width / 2.5,
                            ),
                            SizedBox(
                                height: 30,
                                child: Text(
                                  textList[i],
                                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
                                )),
                          ]),
                        ),
                      ),
          ),

                  SizedBox(
                    height: 20,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  showBrandTypeModalBottom() {
    List carList = [
    'Ford',
        'lexus',
        'gems',
        'AstonMartin',
        'path830',
        'Vector-1',
        'toyota',
        'Vector',
        'landrover',
        'audi',
        'honda',
        'Bugatti',
        'subaru',
        'Volkswagen_logo_2019',
        'jeep',
        'Volvo_logo1 1',
        'BMW',
       'mercedes',
       'jaguar',
        'mazda',
    ];
    List textList = [
      "Small Car",
      "Medium Car",
      "SUV Car",
      "Big Car",
      "Luxury",
      "people Carrier",
    ];
    List selectedList = [];

    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setstate) {
          return Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(color: Const.mainColor, borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
            child: SingleChildScrollView(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Center(
                        child: Text(
                          "Choose Car Type",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                  for (var i in List.generate(carList.length, (index) => index))
                    ButtonWidget(
                      borderRadius:30,
                      width: MediaQuery.sizeOf(context).width/2.5,
                      height: 165,
                      isSelected: selectedList.contains(i),
                      onTap: (){
                        if(selectedList.contains(i)){
                          selectedList.remove(i);
                        }else{
                          selectedList.add(i);
                        }
                        setstate((){});
                      },
                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Image.asset(
                              "assets/brand/${carList[i]}.png",
                              width:  MediaQuery.sizeOf(context).width / 4,
                            ),
                            // SizedBox(
                            //     height: 30,
                            //     child: Text(
                            //       textList[i],
                            //       style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
                            //     )),
                          ]),
                        ),
                      ),
                    ),

                  SizedBox(
                    height: 20,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
