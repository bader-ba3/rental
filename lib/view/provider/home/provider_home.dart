import 'package:flutter/material.dart';

import '../../../Utils/app_style.dart';
import '../../../utils/const.dart';
import 'tapWidget.dart';


class ProviderHomeView extends StatelessWidget {
  const ProviderHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 0,
          centerTitle: true,
          backgroundColor:Const.mainColor,
          leading: const SizedBox(),
          bottom: TabBar(
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 5.0, color: Const.paigeColor),
            ),
            tabs: <Widget>[
              Tab(
                icon: Text(
                  "Active",
                  style: Styles.headLineStyle3.copyWith(color: Colors.white),
                ),
              ),
              Tab(
                icon: Text(
                  "Available",
                  style: Styles.headLineStyle3.copyWith(color: Colors.white),
                ),
              ),
              Tab(
                icon: Text(
                  "Maintenance",
                  style: Styles.headLineStyle3.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: TapWidget(tapIndex: 0),
            ),
            Center(
              child: TapWidget(tapIndex: 1),
            ),
            Center(
              child: TapWidget(tapIndex: 2),
            ),
          ],
        ),
      ),
    );
  }
}
