import 'package:flutter/material.dart';

import 'color_constant.dart';

class AppStyleConstant {

  static  TextStyle  style24WithPrimaryColor=const TextStyle(
    color: AppColorsConstant.primaryColor,
    fontSize:  24 ,

    fontWeight: FontWeight.bold,


  );
  static  TextStyle  style18WithPrimaryColor=const TextStyle(
      color: AppColorsConstant.primaryColor,
      fontSize:  18 ,


  );
  static  TextStyle  style24WithWhite=const TextStyle(
    color: AppColorsConstant.white,
    fontSize:  24 ,

  );
  static  TextStyle  style15WithPrimaryColorAndBold=const TextStyle(
    color: AppColorsConstant.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize:  15 ,

  );
  static  TextStyle  style24WithBlackColor=const TextStyle(
color: AppColorsConstant.black,
    fontWeight: FontWeight.bold,
    fontSize:  24 ,

  );
  static  TextStyle  style20WithWhiteColor=const TextStyle(
    color: AppColorsConstant.white,
    fontWeight: FontWeight.bold,
    fontSize:  20 ,

  );
  static  TextStyle  style20WithBlackColor=const TextStyle(
    color: Colors.black,
    fontSize:  20 ,

  );
  static  TextStyle  style14WithBlackColor=const TextStyle(
    color: Colors.black,
    fontSize:  14 ,

  );
  static  TextStyle  style14WithGreyColor=const TextStyle(
    color: Colors.grey,
    fontSize:  14 ,
    fontWeight: FontWeight.bold

  );
}