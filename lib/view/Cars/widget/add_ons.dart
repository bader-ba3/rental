import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../utils/const.dart';

class AddOns extends StatefulWidget {
  final List<String> selectedItem;
  const AddOns({super.key, required this.selectedItem});

  @override
  State<AddOns> createState() => _AddOnsState();
}

class _AddOnsState extends State<AddOns> {
  List<String> selectedItem = [];

  @override
  void initState() {
    for (var element in widget.selectedItem) {
      selectedItem.add(element);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Addons"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         item("Child's Seat","car_seats"),
          item("GPS","gps"),
          item("Refrigerator","refrigerator"),
          item("Phone Holder","Phone_holder"),
          item("Unlimited Internet","wifi"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Get.back(result: selectedItem);
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width/1.2,
                height: 60,
               decoration: BoxDecoration( color: Const.mainColor,borderRadius: BorderRadius.circular(15)),
                child: Center(child: Text("Done",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),)),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget item(text,img){
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                  side: BorderSide(color: Colors.black),
                  value: selectedItem.contains(text), onChanged: (_){
                if(selectedItem.contains(text)){
                  selectedItem.remove(text);
                }else{
                  selectedItem.add(text);
                }
                setState(() {});
              }),
              SizedBox(width: 5,),
              Image.asset("assets/addons/${img}.png",width: 60,height: 60,),
              SizedBox(width: 10,),
              Text(text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
              Spacer(),
              Text("+200 AED"),
              SizedBox(width: 5,),
            ],
          ),
        ],
      ),
    );
  }
}
