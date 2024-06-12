import 'dart:ffi';

import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:fast_ui_kit/ui/widgets/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rental/controller/home_page_view_model.dart';
import 'package:rental/controller/place_view_model.dart';
import 'package:rental/view/home/widget/button.dart';
import '../../../utils/const.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  HomePageViewModel homePageViewModel = Get.find<HomePageViewModel>();
  ({DateTime start, DateTime end})? tempDate = null;

  @override
  void initState() {
    if (homePageViewModel.startAndEndDate != null) {
      tempDate = homePageViewModel.startAndEndDate;
    }
    super.initState();
  }

  TextEditingController searchTextController = TextEditingController();
  bool isSettingOpened = false;
  bool isSearchOpened = false;
  List placeSearchList = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<HomePageViewModel>(builder: (controller) {
        return Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 65,
                    child: isSearchOpened
                        ? Container(
                            decoration: BoxDecoration(color: Const.mainColor, borderRadius: isSearchOpened ? BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)) : BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    autofocus: true,
                                    style: TextStyle(color: Colors.white),
                                    controller: searchTextController,
                                    onChanged: (_) async {
                                      PlaceViewModel placeViewModel = Get.find();
                                      placeSearchList = await placeViewModel.getPlace(_) ?? [];
                                      print(placeSearchList);
                                      setState(() {});
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      isSearchOpened = false;
                                      searchTextController.clear();
                                      setState(() {});
                                    },
                                    child: Icon(Icons.close, color: Colors.white)),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              isSearchOpened = !isSearchOpened;
                              if (isSettingOpened) {
                                isSettingOpened = false;
                              }
                              setState(() {});
                            },
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(color: Const.mainColor, borderRadius: isSearchOpened ? BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)) : BorderRadius.circular(15)),
                              // borderRadius: BorderRadius.circular(15)),
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
                                  Expanded(
                                    child: Text(
                                      controller.address ?? "search Location",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                                    ),
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
                    if (isSearchOpened) {
                      isSearchOpened = false;
                    }
                    setState(() {});
                  },
                  child: Container(
                    child: Icon(
                      Icons.settings,
                      color: controller.startAndEndDate != null ? Colors.green.shade700 : Colors.white,
                    ),
                    height: 65,
                    width: 55,
                    decoration: BoxDecoration(color: Const.mainColor, borderRadius: isSettingOpened ? BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)) : BorderRadius.circular(15)),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        color: isSearchOpened ? Const.mainColor : Colors.transparent,
                      ) // borderRadius: BorderRadius.circular(15)),
                      ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                    height: 5,
                    width: 55,
                    decoration: BoxDecoration(
                      color: isSettingOpened ? Const.mainColor : Colors.transparent,
                    )),
              ],
            ),
            if (isSettingOpened)
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(color: Const.mainColor, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topLeft: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: FastCalendar(
                          initialSelectedFirstDate: controller.startAndEndDate?.start,
                          initialSelectedLastDate: controller.startAndEndDate?.end,
                          onRangeSelected: (DateTime? start, DateTime? end) {
                            if (start != null && end != null) {
                              tempDate = (start: start, end: end);
                            }
                          },
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
                                tempDate = null;
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
                                if (tempDate != null) {
                                  controller.startAndEndDate = tempDate;
                                }
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
            else if (isSearchOpened)
              Container(
                height: 400,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(color: Const.mainColor, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topRight: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListView.builder(
                    itemCount: placeSearchList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            isSearchOpened = false;
                            controller.address = placeSearchList[index];
                            controller.markers.removeWhere((key, value) => value.markerId.value == 'marker_from');
                            controller.update();
                            setState(() {});
                          },
                          child: Container(
                              height: 50,
                              color: Colors.white12,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.sizeOf(context).width - 50,
                                      child: Text(
                                        placeSearchList[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ],
                              )),
                        ),
                      );
                    },
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
                        tabItem("Car Type", () {
                          showCarTypeModalBottom(controller);
                        }),
                        tabItem("Seats", () {
                          showSeatsModalBottom();
                        }),
                        tabItem("Transmission", () {
                          showTransmissionModalBottom();
                        }),
                        tabItem("Brand", () {
                          showBrandTypeModalBottom();
                        }),
                        tabItem("Engine", () {
                          showEngineModalBottom();
                        }),
                      ],
                    )),
              ),
          ],
        );
      }),
    );
  }

  tabItem(text, onTap) {
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
    List textList = ["3-4", "6", "8+"];
    List transmissionType = [];
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
                  SizedBox(
                    height: 20,
                  ),
                  StatefulBuilder(builder: (context, setstate) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          textList.length,
                          (index) => ButtonWidget(
                            borderRadius: 15,
                            isSelected: transmissionType.contains(index),
                            height: 55,
                            width: 90,
                            onTap: () {
                              if (transmissionType.contains(index)) {
                                transmissionType.remove(index);
                              } else {
                                transmissionType.add(index);
                              }
                              setstate(() {});
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  textList[index],
                                  style: TextStyle(color: Colors.white, fontSize: 22),
                                ))),
                          ),
                        ));
                  }),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  showTransmissionModalBottom() {
    List textList = ["manual", "Automatic"];
    List transmissionType = [];
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
                  SizedBox(
                    height: 20,
                  ),
                  StatefulBuilder(builder: (context, setstate) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          textList.length,
                          (index) => ButtonWidget(
                            borderRadius: 15,
                            isSelected: transmissionType.contains(index),
                            height: 55,
                            width: 150,
                            onTap: () {
                              if (transmissionType.contains(index)) {
                                transmissionType.remove(index);
                              } else {
                                transmissionType.add(index);
                              }
                              setstate(() {});
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  textList[index],
                                  style: TextStyle(color: Colors.white, fontSize: 22),
                                ))),
                          ),
                        ));
                  }),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  showSeatsModalBottom() {
    List textList = ["1-2", "3-4", "6+"];
    int? numberOfSeats;
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
                  SizedBox(
                    height: 20,
                  ),
                  StatefulBuilder(builder: (context, setstate) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          3,
                          (index) => ButtonWidget(
                            borderRadius: 15,
                            isSelected: numberOfSeats == index,
                            height: 55,
                            width: 75,
                            onTap: () {
                              if (numberOfSeats == index) {
                                numberOfSeats = null;
                              } else {
                                numberOfSeats = index;
                              }
                              setstate(() {});
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  textList[index],
                                  style: TextStyle(color: Colors.white, fontSize: 22),
                                ))),
                          ),
                        ));
                  }),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  showCarTypeModalBottom(controller) {
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
                        child: Row(
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        Text(
                          "Type",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
                        ),
                        Spacer(),
                        ElevatedButton(
                            onPressed: () {
                              controller;
                              Get.back();
                            },
                            child: Text(
                              "ok",
                              style: TextStyle(color: Colors.white),
                            )),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    )),
                  ),
                  SizedBox(
                    height: 20,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                  for (var i in List.generate(textList.length, (index) => index))
                    ButtonWidget(
                      borderRadius: 30,
                      width: MediaQuery.sizeOf(context).width / 2.5,
                      height: 165,
                      isSelected: selectedList.contains(i),
                      onTap: () {
                        if (selectedList.contains(i)) {
                          selectedList.remove(i);
                        } else {
                          selectedList.add(i);
                        }
                        setstate(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Image.asset(
                              "assets/car/${carList[i]}.png",
                              width: MediaQuery.sizeOf(context).width / 2.5,
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
                      borderRadius: 30,
                      width: MediaQuery.sizeOf(context).width / 2.5,
                      height: 165,
                      isSelected: selectedList.contains(i),
                      onTap: () {
                        if (selectedList.contains(i)) {
                          selectedList.remove(i);
                        } else {
                          selectedList.add(i);
                        }
                        setstate(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Image.asset(
                              "assets/brand/${carList[i]}.png",
                              width: MediaQuery.sizeOf(context).width / 4,
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
