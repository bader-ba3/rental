import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:rental/controller/home_page_view_model.dart';
import 'package:rental/view/home/home_view.dart';
import 'package:rental/view/profile/profile_view.dart';
import 'package:rental/view/trip/trip_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../utils/const.dart';
import '../history/history_view.dart';
import '../onboarding/onboarding.dart';
import '../provider/home/provider_home.dart';
import '../provider/logs/logs_view.dart';
import '../provider/profile/profile_view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    bool isUser = true;
    return Scaffold(
      backgroundColor: Color(0xff3d0312),
      appBar: AppBar(toolbarHeight: 0,),
      body: SafeArea(
        child: GetBuilder<HomePageViewModel>(builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: _currentIndex,
                  children:
                  isUser
                  ?[
                    HomeView(),
                    TripView(),
                    HistoryView(),
                   ProfileView()
                  ]:[
                    ProviderHomeView(),
                    ProviderLogsView(),
                    ProviderProfileView(),
                    OnboardingView(),
                  ],
                ),
              ),
              // Spacer(),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  height: 50,
                  child: Center(
                    child: SalomonBottomBar(
                      selectedItemColor:Const.paigeColor,
                      unselectedItemColor: Const.brownColor,
                      selectedColorOpacity: 0,
                      currentIndex: _currentIndex,
                      backgroundColor: Colors.transparent,
                      onTap: (i) => setState(() => _currentIndex = i),
                      items:isUser
                      ?[
                        SalomonBottomBarItem(
                          icon: Icon(Icons.home_outlined),
                          title: Text("Home"),
                        ),
                        SalomonBottomBarItem(
                          icon: Icon(Icons.card_travel),
                          title: Text("Trip"),
                        ),
                        SalomonBottomBarItem(
                          icon: Icon(Icons.emoji_transportation),
                          title: Text("History"),
                        ),
                        SalomonBottomBarItem(
                          icon: Icon(Icons.person),
                          title: Text("Profile"),
                        ),
                      ]
                      :[
                        SalomonBottomBarItem(
                          icon: Icon(Icons.home_outlined),
                          title: Text("Home"),
                        ),
                        SalomonBottomBarItem(
                          icon: Icon(Icons.card_travel),
                          title: Text("Likes"),
                        ),
                        SalomonBottomBarItem(
                          icon: Icon(Icons.emoji_transportation),
                          title: Text("History"),
                        ),
                        SalomonBottomBarItem(
                          icon: Icon(Icons.person),
                          title: Text("Profile"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
            ],
          );
        }),
      ),
    );
  }
}
