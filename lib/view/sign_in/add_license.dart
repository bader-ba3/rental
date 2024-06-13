import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rental/utils/hive.dart';
import 'package:rental/view/sign_in/add_passport.dart';
import 'package:whatsapp_camera/camera/camera_whatsapp.dart';

import '../../utils/const.dart';
import '../home_page/home_page_view.dart';

class AddLicense extends StatefulWidget {
  const AddLicense({super.key});

  @override
  State<AddLicense> createState() => _AddLicenseState();
}

class _AddLicenseState extends State<AddLicense> {
  Future<File?> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 25,
            ),
            Image.asset("assets/card.png"),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Add Your Driving License",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 100,
            ),
            const SizedBox(
              height: 100,
            ),
            !isLoading
                ? InkWell(
                    onTap: () async {
                      isLoading = true;
                      setState(() {});
                      _pickImage().then((image) async {
                        if (image?.exists() != null) {
                          final storageRef = FirebaseStorage.instance.ref().child('uploads/${DateTime.now().millisecondsSinceEpoch}.jpg');
                          await storageRef.putFile(image!);
                          final licenseImage = await storageRef.getDownloadURL();
                          HiveDataBase.setUserLicenseImageData(licenseImage);
                          Get.offAll(() => const HomePageView(
                                isUser: true,
                              ));
                        }
                      });
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width / 1.2,
                      height: 65,
                      decoration: BoxDecoration(color: Const.mainColor, borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                          child: Text(
                        "Capture",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
                      )),
                    ),
                  )
                : const CircularProgressIndicator(),
            const SizedBox(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
