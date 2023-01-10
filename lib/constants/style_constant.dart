import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constant.dart';

class AppStyleConstant {

  static  TextStyle  style24WithPrimaryColor=GoogleFonts.alata(
    color: AppColorsConstant.primaryColor,
    fontSize:  24 ,
    fontWeight: FontWeight.bold

  );
  static  TextStyle  style18WithPrimaryColor=GoogleFonts.aladin(
      color: AppColorsConstant.primaryColor,
      fontSize:  18 ,


  );
  static  TextStyle  style24WithWhite=TextStyle(
    color: AppColorsConstant.white,
    fontSize:  24 ,

  );
  static  TextStyle  style15WithPrimaryColorAndBold=TextStyle(
    color: AppColorsConstant.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize:  15 ,

  );
  static  TextStyle  style24WithBlackColor=TextStyle(
color: AppColorsConstant.black,
    fontWeight: FontWeight.bold,
    fontSize:  24 ,

  );
  static  TextStyle  style20WithWhiteColor=TextStyle(
    color: AppColorsConstant.white,
    fontWeight: FontWeight.bold,
    fontSize:  20 ,

  );
  static  TextStyle  style20WithBlackColor=TextStyle(
    color: Colors.black,
    fontSize:  20 ,

  );
  static  TextStyle  style14WithBlackColor=TextStyle(
    color: Colors.black,
    fontSize:  14 ,

  );
  static  TextStyle  style14WithGreyColor=TextStyle(
    color: Colors.grey,
    fontSize:  14 ,
    fontWeight: FontWeight.bold

  );
}