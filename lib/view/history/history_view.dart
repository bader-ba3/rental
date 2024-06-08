import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rental/view/history/widget/car_item.dart';

import '../../Utils/app_style.dart';
import '../../utils/const.dart';
import '../../utils/data.dart';
import '../home_page/widget/button.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView>with SingleTickerProviderStateMixin {
 late TabController tabController ;
 int selectedTab = 0;
 List a = ["Currently","Finished","Canceled"];
  @override
  void initState() {
    tabController =TabController(length: 3, vsync: this) ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        Container(color: Const.mainColor,
          child: TabBar(
            indicatorPadding: EdgeInsets.zero,
            dividerHeight: 0,
            indicator: BoxDecoration(),
            controller:tabController,
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              onTap: (_){
              setState(() {});
              },
            tabAlignment: TabAlignment.fill,
              tabs: List.generate(3, (index) =>   ButtonWidget(
                borderRadius:15,
                isSelected: tabController.index == index,
                height: 40,
                width: double.infinity,
                onTap: (){
                  tabController.animateTo(index,duration: Duration(milliseconds: 300),curve: Curves.linear);
                  setState(() {});
                },
                child: Center(
                  child: Text(a[index],style: TextStyle(color: Colors.white,fontSize: 22)
                  ),
                ),
              ),),
            ),
        ),
          Expanded(
            child: IndexedStack(
              index: tabController.index,
              children: [
                page1(),
                page2(),
                page3(),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget page1(){
    return Container(
      color: Const.mainColor,
      child: ListView.builder(
        itemCount: carList.length,
        itemBuilder: (context, index) {
        return CarItemWidget(carModel: carList[index]);
      },),
    );
  }

 Widget page2(){
   return Container(
     color: Const.mainColor,
     child: ListView.builder(
       itemCount: 2,
       itemBuilder: (context, index) {
         return CarItemWidget(carModel: carList.reversed.toList()[index]);
       },),
   );
 }

 Widget page3(){
   return Container(
     color: Const.mainColor,
     child: Center(child: Text("No Things to show",style: TextStyle(fontSize: 22,color: Colors.white),),),
   );
 }

}
