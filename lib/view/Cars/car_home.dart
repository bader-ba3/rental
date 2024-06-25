import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:rental/controller/home_page_view_model.dart';
import 'package:rental/model/small_car_model.dart';

import '../../Utils/app_style.dart';
import '../../utils/const.dart';
import '../../utils/data.dart';
import '../home/widget/button.dart';
import 'Car_list.dart';


class CarHome extends StatefulWidget {
  const CarHome({
    super.key,
  });

  @override
  State<CarHome> createState() => _CarHomeState();
}

class _CarHomeState extends State<CarHome> {

  bool isPriceFiltered = false;
  bool isDateFiltered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.mainColor,
      body: GetBuilder<HomePageViewModel>(builder: (controller) {
        List<SmallCarModel> dataList = controller.allCars.where((element) => element.status == Const.carStatusIdle).toList();
        return SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  const BackButton(color: Colors.white,),
                  const Spacer(),
                  ButtonWidget(
                    borderRadius: 15,
                    isSelected: isPriceFiltered,
                    height: 35,
                    width: 90,
                    onTap: () {
                      isPriceFiltered = !isPriceFiltered;
                      setState(() {});
                    },
                    child: const Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Price", style: TextStyle(color: Colors.white, fontSize: 16),),
                        Icon(Icons.arrow_drop_down_sharp, color: Colors.white,)
                      ],
                    )),
                  ),
                  Spacer(),
                  ButtonWidget(
                    borderRadius: 15,
                    isSelected: isDateFiltered,
                    height: 35,
                    width: 150,
                    onTap: () {
                      isDateFiltered = !isDateFiltered;
                      setState(() {});
                    },
                    child: const Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("relese date", style: TextStyle(color: Colors.white, fontSize: 16),),
                        Icon(Icons.arrow_drop_down_sharp, color: Colors.white,)
                      ],
                    )),
                  ),
                  Spacer(),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 50),
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CarViewWidget(carId: dataList[index].id!, index: 0,),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 20,),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}