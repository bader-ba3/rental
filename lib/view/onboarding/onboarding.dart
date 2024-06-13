import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/Utils/app_style.dart';
import 'package:rental/view/sign_in/sign_in_view.dart';
import 'package:video_player/video_player.dart';

import '../../utils/const.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late VideoPlayerController _controller;

  int index = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        "assets/onboarding/onboarding.mp4" /*Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')*/
        )
      ..initialize().then((_) async {
        _controller.play();
        await Future.delayed(const Duration(milliseconds: 1500));
        _controller.pause();
        // _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff180002),
      body: Stack(
        alignment: Alignment.center,
        children: [
          _controller.value.isInitialized
              ? Positioned(
                  bottom: 0,
                  width: Get.width,
                  child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller)),
                )
              : const Center(
              ),
          Positioned(
              bottom: 50,
              right: 20,
              child: Visibility(
                visible: !_controller.value.isPlaying,
                child: GestureDetector(
                  onTap: () async {
                    if(!_controller.value.isPlaying) {
                      _controller.play();
                      setState(() {

                      });
                      index++;
                      await Future.delayed(const Duration(milliseconds: 4600));
                      _controller.pause();
                      setState(() {

                      });
                      if (index == 3) {
                        Get.offAll(const SignInView());
                      }


                    }
                  },
                  child:
                  const Icon(Icons.double_arrow_outlined,color: Const.paigeColor,size: 34,),
                ),
              ))
        ],
      ),
    );
  }
}
