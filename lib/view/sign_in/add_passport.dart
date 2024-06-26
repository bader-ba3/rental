import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rental/view/sign_in/add_license.dart';
import 'package:whatsapp_camera/camera/camera_whatsapp.dart';

import '../../utils/const.dart';

class AddPassport extends StatefulWidget {
  const AddPassport({super.key});

  @override
  State<AddPassport> createState() => _AddPassportState();
}

class _AddPassportState extends State<AddPassport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 25,),
            Image.asset("assets/passport.png"),
            SizedBox(height: 40,),
            SizedBox(height: 25,),
            Text("Add Your Passport",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
            SizedBox(height: 100,),
            SizedBox(height: 100,),
            InkWell(
              onTap: () async {
                // List<File>? res = await Navigator.push(
                //   context, MaterialPageRoute(
                //   builder: (context) => const WhatsappCamera(multiple: false,),
                // ),
                // );
                // if(res?.isNotEmpty??false){
                  Get.to(()=>AddLicense());
                // }
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width/1.2,
                height: 65,
                decoration: BoxDecoration(color: Const.mainColor,borderRadius: BorderRadius.circular(15)),
                child: Center(child: const Text("Capture",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 22),)),
              ),
            ),
            SizedBox(height: 1,),
          ],
        ),
      ),
    );
  }
}
