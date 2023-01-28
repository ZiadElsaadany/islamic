import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';

class CustomTextFieldDoaa extends StatelessWidget {
  const CustomTextFieldDoaa({Key? key,  this.mxLine= 1, required this.hint}) : super(key: key);
final int mxLine;
final String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          cursorColor: AppColorsConstant.primaryColor,
          maxLines: mxLine,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 0.5
                )
          ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColorsConstant.primaryColor,
              )


            )
        ) ),
      ),
    ) ;
  }
}
