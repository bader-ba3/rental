import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/const.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.mainColor,
      body: Column(
        children: [
          Spacer(),
         Text("Welcome",style: TextStyle(fontSize: 60,color: Const.paigeColor,fontWeight: FontWeight.bold),),
          Spacer(),
          Container(
             // color: Colors.red,
              child: Image.asset("assets/onboarding/test.png")),

        ],
      ),
    );
  }
}
