import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Utils/app_style.dart';
import '../../../utils/const.dart';
import 'widget/chrts.dart';

class ProviderLogsView extends StatefulWidget {
  const ProviderLogsView({
    super.key,
  });

  @override
  State<ProviderLogsView> createState() => _ProviderLogsViewState();
}
bool first=true;
class _ProviderLogsViewState extends State<ProviderLogsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25,),
              Container(
                width: 200,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.shade300,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        first=true;
                        setState(() {});
                      },
                      child: AnimatedContainer(height: 35,width: 100,
                        duration: Durations.short1,
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color:first? Const.mainColor:Colors.grey.shade300
                        ),
                        child: Center(
                          child: Text(
                            "Last 7 day",style: Styles.headLineStyle4.copyWith(color:first? Colors.white:Const.mainColor),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        first=false;
                        setState(() {

                        });
                      },
                      child:AnimatedContainer(height: 35,width: 100,
                        duration: Durations.short1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color:!first? Const.mainColor:Colors.grey.shade300
                        ),
                        child: Center(
                          child: Text(
                            "Last 30 day",style: Styles.headLineStyle4.copyWith(color:!first? Colors.white:Const.mainColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Orders AVG",style: Styles.headLineStyle3,),
                          const SizedBox(width: 15,),
                          const Icon(Icons.area_chart,color: Colors.grey,)
                        ],
                      ),
                      Text("${Random().nextInt(50)}",style: Styles.headLineStyle2,),
                    ],
                  ),
                  const Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.refresh_thick))
                ],),
              ),
               LineChartWidget(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("Amount AVG",style: Styles.headLineStyle3,),
                          const SizedBox(width: 15,),
                          const Icon(Icons.area_chart,color: Colors.grey,)
                        ],
                      ),
                      Text("${Random().nextInt(100000)} AED",style: Styles.headLineStyle2,),
                    ],
                  ),
                  const Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.refresh_thick))
                ],),
              ),
               LineChartWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
