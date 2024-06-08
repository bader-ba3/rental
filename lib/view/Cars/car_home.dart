import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Utils/app_style.dart';
import '../../utils/data.dart';
import '../home_page/widget/button.dart';
import 'Car_list.dart';


class CarHome extends StatefulWidget {
  const CarHome({
    super.key,
  });

  @override
  State<CarHome> createState() => _CarHomeState();
}

class _CarHomeState extends State<CarHome> {

bool isPriceFilterd = false;
bool isDateFilterd = false;
@override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.mainColor,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  BackButton(color: Colors.white,),
                  Spacer(),
                  ButtonWidget(
                    borderRadius:15,
                    isSelected: isPriceFilterd,
                    height: 35,
                    width: 90,
                    onTap: (){
                      isPriceFilterd=!isPriceFilterd;
                      setState((){});
                    },
                    child:  Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Price",style: TextStyle(color: Colors.white,fontSize: 16),),
                        Icon(Icons.arrow_drop_down_sharp,color: Colors.white,)
                      ],
                    )),
                  ),
                  Spacer(),
                  ButtonWidget(
                    borderRadius:15,
                    isSelected: isDateFilterd,
                    height: 35,
                    width: 150,
                    onTap: (){
                      isDateFilterd=!isDateFilterd;
                      setState((){});
                    },
                    child:  Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("relese date",style: TextStyle(color: Colors.white,fontSize: 16),),
                        Icon(Icons.arrow_drop_down_sharp,color: Colors.white,)
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
                  itemCount: carList.length,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CarViewWidget(carModel: carList[index],index: 0,),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 20,),
                ),
              ),
            ],
          ),
        ));
  }
}