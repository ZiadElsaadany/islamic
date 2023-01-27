

import 'package:flutter/material.dart';

import '../../constants/color_constant.dart';

PreferredSizeWidget CustomAppBar( {
  Widget?  widget
}) {
  return AppBar(
    centerTitle: true,
    title: widget?? const SizedBox(),
  foregroundColor: AppColorsConstant.black,
  backgroundColor: Colors.white,
  elevation: 0,
  );
}