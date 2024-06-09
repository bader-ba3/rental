import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/app_style.dart';
import '../../../utils/const.dart';

class ProviderProfileView extends StatefulWidget {
  const ProviderProfileView({super.key});

  @override
  State<ProviderProfileView> createState() => _ProviderProfileViewState();
}

class _ProviderProfileViewState extends State<ProviderProfileView> {
  List bankCard = [];
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Const.mainColor,
        body: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40), color: Colors.white),
          child: Stack(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  color: Const.mainColor,
                  height: 200,
                  child: const Center(
                    child: Text("aaaaa"),
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Name:",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                "Badr Aldin Almasri",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Number:",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                "+971562064458",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Id Number:",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                "123456789",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Address",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {},
                                      child: const CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Const.mainColor,
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              const Text(
                                "UAE, Dubai, 16 Street",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Commercial license",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "56456465, Expaired in 3 month",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {},
                                      child: const CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Const.mainColor,
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ImageOverlay(),

                              const SizedBox(
                                height: 25,
                              ),
                              Center(
                                child: Container(
                                  height: 60,
                                  width: MediaQuery.sizeOf(context).width / 1.1,
                                  decoration: BoxDecoration(
                                      color: Const.paigeColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Center(
                                    child: Text(
                                      "Sign Out",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Center(
                                child: Container(
                                  height: 60,
                                  width: MediaQuery.sizeOf(context).width / 1.1,
                                  decoration: BoxDecoration(
                                      color: Const.secColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Center(
                                    child: Text(
                                      "Delete Account",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Positioned(
                  top: 75,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 75,
                      backgroundColor: Const.paigeColor,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 100,
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.5, h - 100, w, h);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ImageOverlay extends StatefulWidget {
  @override
  _ImageOverlayState createState() => _ImageOverlayState();
}

class _ImageOverlayState extends State<ImageOverlay> {
  bool isOverlayVisible = true;

  double imageHeight=200;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isOverlayVisible = !isOverlayVisible;
            imageHeight==600?imageHeight=200.0:imageHeight=600.0;
          });
        },
        child: Stack(
          children: [
            Container(
              height: imageHeight,
              width: Get.width,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgVq8qdsC2hih6S4T-aqpV21W9DSznbV5xNZ9V9PV0Sy2Jcl0xZg0OA5dAj9FTHZXhgeBeK1dePoDek7hSMoH7lg615bZH7m-j1GBd0eb8kOSeXhitRpkvypnZZ0K1Fievlxe9S4JP7sGk_/s1600/%10D8%10B1%10D8%10AE%10D8%10B5%10D8%10A9+%10D8%25B4%25D8%25B1%25D9%2583%25D8%25A9+%25D8%25A7%25D9%2584%25D9%258A%25D8%25AF+%25D8%25A7%25D9%2584%25D8%25A3%25D9%2585%25D9%258A%25D9%2586%25D8%25A9+%25D9%2584%25D9%2585%25D9%2582%25D8%25A7%25D9%2588%25D9%2584%25D8%25A7%25D8%25AA+%25D8%25A7%25D9%2584%25D8%25A8%25D9%2586%25D8%25A7%25D8%25A1.bmp",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Positioned(
              height: 200,
              width: Get.width,
              child: AnimatedOpacity(
                duration: Durations.short4,
                opacity: isOverlayVisible ? 1 : 0,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(

                  ),
                  child: BackdropFilter(

                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Center(
                      child: Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),

                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
