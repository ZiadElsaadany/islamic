import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/color_constant.dart';
import '../../../controller/provider/sebha_provider.dart';

class SebhaText extends StatelessWidget {
  const SebhaText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: AppColorsConstant.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        //set border radius more than 50% of height and width to make circle
      ),
      child: Padding(
        padding:  EdgeInsets.all(MediaQuery.of(context).size.height*0.015),
        child: Text(Provider.of<SebhaProvider>(context).tasbehList[Provider.of<SebhaProvider>(context).index] ,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: AppColorsConstant.white ,
              fontWeight:  FontWeight.bold ,
              fontSize: 20
          ),
        ),
      ) ,
    );
  }
}
