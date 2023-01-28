import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/color_constant.dart';
import '../../../../constants/style_constant.dart';
import '../../../../controller/provider/azkar_provider.dart';

class CustomZekrCard extends StatelessWidget {
  const CustomZekrCard({Key? key, required this.index}) : super(key: key);
final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder( //<-- SEE HERE
          borderRadius: BorderRadius.circular(15)
      ) ,
      elevation: 5,
      color: AppColorsConstant.white,

      child: Padding(
        padding:  EdgeInsets.all(
            MediaQuery.of(context).size.height*0.035

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              Provider.of<AzkarProvider>(context).azkarList[index]['name'],
              style: AppStyleConstant.style20WithBlackColor.copyWith(
                  color: AppColorsConstant.black.withOpacity(0.7)
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset( Provider.of<AzkarProvider>(context).azkarList[index]['image']),
          ],
        ),
      ),
    );
  }
}
