import 'package:flutter/material.dart';

import '../home_page/widget/home_app_bar_widget.dart';
import '../home_page/widget/home_button_widget.dart';
import '../home_page/widget/map_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        MapWidget(),
        ExamplePage(),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  GlowingButton(),
                  SizedBox(height: 20,)
                ],
              ),
            )
        )
      ],
    );
  }
}
