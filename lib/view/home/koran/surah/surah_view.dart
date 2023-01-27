
import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/view/home/custom_app_bar.dart';

import 'package:islami/view/home/koran/surah/koran_widget.dart';

import '../../../../constants/sowar.dart';
import 'custom_surah_view_body.dart';

class SurahView extends StatelessWidget {
  const SurahView({Key? key, required this.indx}) : super(key: key);
  static const String id = 'KoranScreen';
  final int indx; // الفاتحة
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar:CustomAppBar(
            widget: Text('  سورة ${Sowar.sowar['sowar']![indx]['name']}',
                style:const TextStyle(
                  fontSize: 20,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500 ,


                )),
          ),
          backgroundColor: const Color.fromARGB(255, 253, 247, 230),
          body: CustomSurahViewBody(indx: indx) ,
        ),
      ),
    );
  }
}
