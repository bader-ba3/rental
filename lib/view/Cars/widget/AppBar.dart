import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_style.dart';
import '../../../model/Car_Model.dart';

buildCarAppBar(bool isPend,CarModel carModel) => AppBar(
  surfaceTintColor: Styles.bgColor,
  backgroundColor: Styles.bgColor,
  leading: IconButton(
    onPressed: () {
    },
    icon: const Icon(
      CupertinoIcons.back,
      color: Colors.black,
      size: 26,
    ),
  ),
  centerTitle: true,
  elevation: 0,
  title: AnimatedCrossFade(
    duration: Durations.short3,
    crossFadeState:
    isPend ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    firstChild:const SizedBox(),
    secondChild:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            carModel.carName.toString(),
            style: Styles.headLineStyle1,
          ),
          Text(
            carModel.carModule.toString(),
            style: Styles.headLineStyle4,
          ),
        ],
      ),
  ),
);