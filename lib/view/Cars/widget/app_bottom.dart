import 'package:flutter/material.dart';

import '../../../Utils/app_style.dart';

class AppBottom extends StatelessWidget {
  const AppBottom({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color:Styles.mainColor ,width: 1),
          // color: Styles.mainColor,
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.headLineStyle2.copyWith(color: Styles.mainColor),
          ),
        ),
      ),
    );
  }
}
