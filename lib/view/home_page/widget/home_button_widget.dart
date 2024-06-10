
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/controller/home_page_view_model.dart';
import 'package:rental/view/Cars/car_home.dart';

import '../../../utils/const.dart';

class GlowingButton extends StatefulWidget {

  const GlowingButton(
      {Key? key})
      : super(key: key);
  @override
  _GlowingButtonState createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  Color color1 =  Const.paigeToBrownColor;
  Color color2 = Const.paigeColor;
  var glowing = true;
  var scale = 1.0;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        if(Get.find<HomePageViewModel>().carIsLoading) {
          Get.to(const CarHome());
        }
      },
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: Duration(milliseconds: 200),
        height: 75,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: color1.withOpacity(0.6),
                spreadRadius: 0.7,
                blurRadius: 4,
                offset: Offset(-4, 0),
              ),
              BoxShadow(
                color: color2.withOpacity(0.6),
                spreadRadius: 0.7,
                blurRadius: 4,
                offset: Offset(4, 0),
              ),
              BoxShadow(
                color: color1.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 8,
                offset: Offset(-4, 0),
              ),
              BoxShadow(
                color: color2.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 8,
                offset: Offset(4, 0),
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search ,
              color: Colors.white,
              size: 30,
            ),
            Text(
              "Start" ,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
