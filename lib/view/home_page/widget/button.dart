import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../../../utils/const.dart';

class ButtonWidget extends StatelessWidget {
  final bool isSelected ;
  final Widget child ;
  final double borderRadius  ;
  final double height  ;
  final double width  ;
  final void Function()? onTap;
  const ButtonWidget({super.key, required this.isSelected, required this.child, required this.onTap, this.borderRadius =0, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return   Builder(
        builder: (context) {
          Offset distance = isSelected ? Offset(5, 5):Offset(5, 5);
          double blur = isSelected?5:10 ;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 20),
            child: SizedBox(
              width: width,
              height: height,
              child: Center(
                child: InkWell(
                  onTap: onTap,
                  child: AnimatedContainer(
                      duration: Duration(microseconds: 100),
                      decoration: BoxDecoration(
                        color:Const.mainColor,
                        borderRadius: BorderRadius.circular(borderRadius),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: blur,
                              offset:  -distance,
                              color: Color(0xff772035),
                              inset: isSelected
                          ),
                          BoxShadow(
                              blurRadius: blur,
                              offset:distance ,
                              color: Color(0xff150106),
                              inset: isSelected
                          ),

                        ],
                      ),
                      child:  Transform.scale(
                          scale:isSelected? 0.9:1,
                          child: child)
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
