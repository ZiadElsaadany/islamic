import 'package:flutter/material.dart';
import 'package:islami/constants/images_constant.dart';
import 'package:islami/controller/provider/quran_provider.dart';
import 'package:islami/view/home/custom_app_bar.dart';

import 'package:islami/view/home/koran/custom_text_field.dart';

import 'package:islami/view/home/return_image.dart';
import 'package:provider/provider.dart';

import 'all_names.dart';
import 'names_from_search.dart';
class SurahNameScreen extends StatelessWidget {
  const SurahNameScreen({Key? key}) : super(key: key);
  static const String id = 'SurahNameScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
       const ReturnImage(img: ImageConstant.bg),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar:CustomAppBar(),
backgroundColor: Colors.transparent,
              body: Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.04,
                  left: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child:CustomTextFormFiled()
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    !Provider.of<KoranProvider>(context).search? const AllNames()
                        : Provider.of<KoranProvider>(context).lst.isNotEmpty?

                    const NamesFromSearch():
                    const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


