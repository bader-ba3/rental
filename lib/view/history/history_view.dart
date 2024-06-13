import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rental/controller/home_page_view_model.dart';
import 'package:rental/view/history/widget/car_item.dart';

import '../../Utils/app_style.dart';
import '../../model/reservation_model.dart';
import '../../utils/const.dart';
import '../../utils/data.dart';
import '../home/widget/button.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> with SingleTickerProviderStateMixin {
  late TabController tabController;

  int selectedTab = 0;
  List text = ["Currently", "Pending","Finished", "Canceled"];

  @override
  void initState() {
    tabController = TabController(length: text.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageViewModel>(builder: (controller) {
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(color: Const.mainColor,
                width: MediaQuery.sizeOf(context).width,
                child: TabBar(
                  indicatorPadding: EdgeInsets.zero,
                  dividerHeight: 0,
                  isScrollable: true,
                  indicator: BoxDecoration(),
                  controller: tabController,
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  onTap: (_) {
                    setState(() {});
                  },
                  tabs: List.generate(text.length, (index) =>
                      ButtonWidget(
                        borderRadius: 15,
                        isSelected: tabController.index == index,
                        height: 40,
                        width: 120,
                        onTap: () {
                          tabController.animateTo(index, duration: Duration(milliseconds: 300), curve: Curves.linear);
                          setState(() {});
                        },
                        child: Center(
                          child: Text(text[index], style: TextStyle(color: Colors.white, fontSize: 22)
                          ),
                        ),
                      ),),
                ),
              ),
              Expanded(
                child: IndexedStack(
                  index: tabController.index,
                  children: [
                    page(controller.allReservation.where((element) => element.reservationStatus ==Const.reservationStarted).toList() ),
                    page(controller.allReservation.where((element) => element.reservationStatus ==Const.reservationPending).toList() ),
                    page(controller.allReservation.where((element) => element.reservationStatus ==Const.reservationEnded).toList() ),
                    page(controller.allReservation.where((element) => element.reservationStatus ==Const.reservationCanceled).toList() ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget page(List<ReservationModel> list) {
    return Container(
      child: list.isEmpty
      ?Center(child: Text("No Things to show",style: TextStyle(fontSize: 22,color: Colors.white),),)
      :ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return CarItemWidget(reservationModel: list[index]);
        },),
    );
  }


}
