import 'package:flutter/material.dart';

import 'package:islami/controller/provider/azkar_provider.dart';
import 'package:islami/view/home/azkar/zekr_details/custom_zekr_details_body.dart';
import 'package:islami/view/home/return_image.dart';
import 'package:provider/provider.dart';

import '../../../../constants/images_constant.dart';
import '../../custom_app_bar.dart';

class AzkarDetailsScreen extends StatelessWidget {
  static const String id = 'AzkarDetailsScreen';

  const AzkarDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int args = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Stack(
        children: [
         const ReturnImage(img: ImageConstant.bg),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.transparent,
appBar: CustomAppBar(
  widget: Text('${ Provider.of<AzkarProvider>(context).azkarList[args]['name']}' )
) ,
              body:const CustomZekrDetailsBody()

            ),
            ),

        ],
      ),
    );
  }
}
