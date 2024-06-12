import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rental/core/binding.dart';
import 'package:rental/firebase_options.dart';
import 'package:rental/utils/const.dart';
import 'package:rental/utils/hive.dart';
import 'package:rental/view/home_page/home_page_view.dart';
import 'package:rental/view/onboarding/onboarding.dart';
import 'package:rental/view/profile/profile_view.dart';
import 'package:rental/view/sign_in/sign_in_view.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Permission.location.request();
  await Permission.storage.request();
  await Permission.photos.request();
  await Permission.locationAlways.request();
  await Permission.locationWhenInUse.request();
  await Permission.mediaLibrary.request();
  await HiveDataBase.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light,backgroundColor: Const.mainColor),
        primaryColor: Const.paigeColor,
        colorScheme: ColorScheme.dark(primary: Const.paigeColor)
      ),
      initialBinding: GetBinding(),
      // home: OnboardingView()
      home: HomePageView(isUser: true,),
    );
  }
}
