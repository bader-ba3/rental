import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../utils/app_style.dart';
import '../../../utils/const.dart';
import '../../../utils/data.dart';

class TapWidget extends StatefulWidget {
  TapWidget({super.key, required this.tapIndex});

  int tapIndex;

  @override
  State<TapWidget> createState() => _TapWidgetState();
}

class _TapWidgetState extends State<TapWidget> {
  List<bool> expand = List.generate(
    6,
    (index) => false,
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carList.length,
      itemBuilder: (BuildContext context, int index) {
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
                    height: widget.tapIndex == 0
                        ? 120
                        : widget.tapIndex == 2
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
                              if (widget.tapIndex == 0)
                                Text(
                                  "Add-ons" /*widget.carModel.carModule!*/,
                                  maxLines: 1,
                                  style: Styles.headLineStyle4.copyWith(
                                      color: Const.paigeToBrownColor),
                                ),
                              if (widget.tapIndex == 0)
                                Text(
                                  "With three suitcases and a refrigerator",
                                  maxLines: 2,
                                  style: Styles.headLineStyle4.copyWith(),
                                ),
                              if (widget.tapIndex == 2)
                                Text(
                                  "Crashed" /*widget.carModel.carModule!*/,
                                  maxLines: 1,
                                  style: Styles.headLineStyle4.copyWith(
                                      color: Const.paigeToBrownColor),
                                ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -40,
                          right: -50,
                          child: SizedBox(
                            height: 135,
                            child: Image.network(
                              carList[index].carColor![0].images![3],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  AnimatedCrossFade(
                    firstChild: widget.tapIndex == 0
                        ? Column(
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
                                          "Ali Dabol",
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
                                  const TextIconWidget(
                                    icon: Icons.location_on_outlined,
                                    text: "RAK",
                                  ),
                                  const Spacer(),
                                  TextIconWidget(
                                    icon: Icons.access_time_outlined,
                                    text: "${Random().nextInt(8)} day",
                                  ),
                                  const Spacer(),
                                  TextIconWidget(
                                    icon: Icons.credit_card_outlined,
                                    text: "\$ ${Random().nextInt(350)}",
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
                                    "15/7/2024",
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
                                    "20/7/2024",
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
                                    "REV11788468453",
                                    style: Styles.headLineStyle4
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : widget.tapIndex == 2
                            ? Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    color: Const.mainColor.withOpacity(0.3),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        style: Styles.headLineStyle4
                                            .copyWith(color: Colors.black),
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
                                        style: Styles.headLineStyle4
                                            .copyWith(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 180,
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
                                          color:Colors.greenAccent,
                                        ),
                                      ],
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
                                    Container(
                                      width: 180,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Const.paigeColor,
                                        border: Border.all(
                                            color: Const.paigeColor),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.car_repair_outlined,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(width: 5,),
                                          Text(
                                            "Maintenance",
                                            style: Styles.headLineStyle2.copyWith(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                    secondChild: widget.tapIndex == 0
                        ? Center(
                            child: Image.asset(
                              "assets/arrowDown.png",
                              height: 20,
                              color: Const.paigeColor,
                            ),
                          )
                        : const SizedBox(),
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
