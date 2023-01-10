import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/constants/images_constant.dart';
import 'package:islami/controller/provider/doaa_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/data.dart';
import '../../../constants/style_constant.dart';

class DoaaCard extends StatelessWidget {
  const DoaaCard({Key? key,required this.index}) : super(key: key);
final int index ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
      index%2== 0 ?   Image.asset(ImageConstant.plygon2) :
      Image.asset(ImageConstant.plygon) ,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/doaa_images/mattar.png'),
            Text(Provider.of<DoaaProvider>(context).doaa[index]['name']),
          ],
        )
      ],
    );
  }
}
