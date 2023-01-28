import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/view/home/custom_app_bar.dart';
import 'package:islami/view/home/return_image.dart';
import 'package:islami/view/home/sebha/custom_sebha_body.dart';

import '../../../constants/images_constant.dart';
class SebhaScreen extends StatelessWidget {
  const SebhaScreen({Key? key}) : super(key: key);
static const String id = 'sebhaScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
        const ReturnImage(img: ImageConstant.bg),
      Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.transparent,
              appBar:CustomAppBar(
                widget: const Text( 'التسبيح',
                style: TextStyle(
                  fontWeight: FontWeight.w600
                ),
                )
              ),
          body: const CustomSebhaBody(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColorsConstant.primaryColor,
            child: const Icon(Icons.add,size: 30),
            onPressed: ( ){ } ,

          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
            ),
      ),
        ],
      ),
    );
  }
}
