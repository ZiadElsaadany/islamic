import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/color_constant.dart';
import '../../../controller/provider/quran_provider.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColorsConstant.primaryColor,
      onChanged: (value) {
        Provider.of<KoranProvider>(context, listen: false)
            .getNameOfKoran(word: value);
      },
      decoration: InputDecoration(
        iconColor: Colors.black,
        icon: const Icon(Icons.search,
          color: AppColorsConstant.primaryColor,
          size: 30,
        ),

        hintText: 'ابحث   عن   السورة   التي   تريدها...',
        hintStyle:  const TextStyle(
          color: AppColorsConstant.grey,
          // fontWeight: FontWeight.bold,
          fontFamily: 'me_quran.ttf',
          fontSize: 14,
        ),
        // suffixIcon: const Icon(Icons.search,
        //      size: 30, color: AppColorsConstant.primaryColor),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: AppColorsConstant.grey,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: AppColorsConstant.primaryColor,
            )),
      ),
    );
  }
}