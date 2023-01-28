import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/constants/style_constant.dart';
import 'package:islami/controller/provider/azkar_provider.dart';
import 'package:islami/view/home/azkar/zekr_details/azkar_details_view.dart';
import 'package:islami/view/home/custom_sliver_app_bar.dart';
import 'package:islami/view/home/return_image.dart';
import 'package:provider/provider.dart';

import '../../../../constants/images_constant.dart';
import '../../custom_app_bar.dart';
import 'azkar_view_body.dart';

class AllAzkarScreen extends StatelessWidget {
  const AllAzkarScreen({Key? key}) : super(key: key);
  static const String id = 'AllAzkar';
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
           appBar: CustomAppBar(widget: const Text('الأذكار')),
           body:   const AzkarViewBody(),


            ),
          ),
        ],
      ),
    );
  }
}
