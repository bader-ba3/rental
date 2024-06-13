import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/controller/home_page_view_model.dart';
import 'package:rental/view/provider/home/carTapWidget.dart';

import '../../../Utils/app_style.dart';
import '../../../utils/const.dart';
import '../../home/widget/button.dart';
import 'tapWidget.dart';


class ProviderHomeView extends StatefulWidget {
  const ProviderHomeView({
    super.key,
  });

  @override
  State<ProviderHomeView> createState() => _ProviderHomeViewState();
}

class _ProviderHomeViewState extends State<ProviderHomeView> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List text = ["pending", "Active","Available", "Maintenance",];
    return GetBuilder<HomePageViewModel>(builder: (controller) {
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 0,
            centerTitle: true,
            backgroundColor: Const.mainColor,
            leading: const SizedBox(),
          ),
          body: Column(
            children: [
              Container(
                color: Const.mainColor,
                child: TabBar(
                  indicatorPadding: EdgeInsets.zero,
                  dividerHeight: 0,
                  isScrollable: true,
                  indicator: BoxDecoration(),
                  controller: tabController,
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs:List.generate(4, (index) =>
                      ButtonWidget(
                        borderRadius: 15,
                        isSelected: tabController.index == index,
                        height: 40,
                        width: 140,
                        onTap: () {
                          tabController.animateTo(index, duration: Duration(milliseconds: 300), curve: Curves.linear);
                          setState(() {});
                        },
                        child: Center(
                          child: Text(text[index], style: TextStyle(color: Colors.white, fontSize: 22)
                          ),
                        ),
                      ),),
                  // tabs: <Widget>[
                  //   Tab(
                  //     icon: Text(
                  //       "pending",
                  //       style: Styles.headLineStyle3.copyWith(color: Colors.white),
                  //     ),
                  //   ),
                  //   Tab(
                  //     icon: Text(
                  //       "Active",
                  //       style: Styles.headLineStyle3.copyWith(color: Colors.white),
                  //     ),
                  //   ),
                  //   Tab(
                  //     icon: Text(
                  //       "Available",
                  //       style: Styles.headLineStyle3.copyWith(color: Colors.white),
                  //     ),
                  //   ),
                  //   Tab(
                  //     icon: Text(
                  //       "Maintenance",
                  //       style: Styles.headLineStyle3.copyWith(color: Colors.white),
                  //     ),
                  //   ),
                  // ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    Center(
                      child: TapWidget(dataType: Const.reservationPending),
                    ),
                    Center(
                      child: TapWidget(dataType: Const.reservationStarted),
                    ),
                    Center(
                      child: CarTapWidget(dataType:Const.carStatusIdle ),
                    ),
                    Center(
                      child: CarTapWidget(dataType:  Const.carStatusMaintenance),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
