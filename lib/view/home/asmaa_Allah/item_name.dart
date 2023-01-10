import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/constants/images_constant.dart';
import 'package:islami/constants/style_constant.dart';

class NameItem extends StatelessWidget {
  const NameItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
Stack(
  alignment: Alignment.center,
  children: [
        ImageIcon(
      const AssetImage(
        ImageConstant.itar
      ),
      color: AppColorsConstant.yellow,
      size: 50,
    ),
    const Text('1',style: TextStyle (
      color: AppColorsConstant.grey,
      fontSize: 10
    ),)
  ],
),
            Expanded(
              child: Card(
                color: AppColorsConstant.primaryColor,
                elevation: 10,
                shape: RoundedRectangleBorder( //<-- SEE HERE
                    borderRadius: BorderRadius.circular(10)
                ) ,
                child: Text('الرحمن' ,style: AppStyleConstant.style20WithWhiteColor.copyWith(
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,),

              ),
            )
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.007,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.15),
          child: Text('المنعم بجلائل النعم'),
        )
      ],
    );
  }
}
