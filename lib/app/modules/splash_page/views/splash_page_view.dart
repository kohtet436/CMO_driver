import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/assets_manager.dart';
import '../../../core/values/color_manager.dart';
import '../controllers/splash_page_controller.dart';

class SplashPageView extends StatelessWidget {
  final controller = Get.put(SplashPageController());

  SplashPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondaryColor,
      body: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Hero(
            tag: 'AppLogo',
            child: Image.asset(ImageAssets.splashLogo),
          ),
        ),
      ),
    );
  }
}
