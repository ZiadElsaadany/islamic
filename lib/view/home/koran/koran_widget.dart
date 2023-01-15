import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/view/home/koran/quran/arabic_number_converter.dart';
import 'package:islami/view/home/koran/quran/arabic_surah_number.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/sowar.dart';
import '../../../constants/style_constant.dart';

class KoranWidget extends StatelessWidget {
  const KoranWidget({Key? key,required this.index1,required this.index2}) : super(key: key);
final int index1 ;
final int index2 ;
  @override
  Widget build(BuildContext context) {
    return     Positioned(
      bottom: 0,
      top: -1,
      child: Text.rich(
          textDirection: TextDirection.rtl,

          textAlign: TextAlign.center,
          TextSpan(
            children: [
              TextSpan( text: '  ${ Sowar.sowar['sowar']![index1]['verses'][index2]['content']}   ',
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'me_quran.ttf',
                  color: Color.fromARGB(196, 0, 0, 0),
                ),
              ) ,
              WidgetSpan(child:   Stack(
                alignment: Alignment.center,
                children: [
                  ArabicSurahNumber(i:Sowar.sowar['sowar']![index1]['verses'][index2]['verse_number'] ),
                  const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan( text: ' ۝ ', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'me_quran.ttf',

                            color: AppColorsConstant.primaryColor
                            // color: Color.fromARGB(196, 0, 0, 0),
                          ),) ,

                        ],

                      )


                  ),
                ],
              ))

            ],

          )


      ),
    ) ;



  }
}
