import 'package:flutter/material.dart';
import 'package:islami/view/home/koran/arabic_number_converter.dart';
import '../../../../constants/color_constant.dart';
import '../../../../constants/images_constant.dart';
import '../arabic_surah_number.dart';

class SurahNameDisplay extends StatelessWidget {
  const SurahNameDisplay({Key? key,required this.num,required this.place,required this.surahName,required this.index}) : super(key: key);
final String surahName ;
final String place;
final int  num ;
final int index ;
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.white.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        //set border radius more than 50% of height and width to make circle
      ),
      elevation: 3,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 5.0, horizontal:
        MediaQuery.of(context).size.height*0.025
        ),
        child: Row(
          children: [
           Stack(
             alignment: Alignment.center,
             children: [

             Image.asset(ImageConstant.itar,
                 height: MediaQuery.of(context).size.height*0.1,
                 color: AppColorsConstant.primaryColor,
             ),



               ArabicSurahNumber(i:index ),
             ],
           ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 5,),
                Text(
                  ' سورة $surahName',style: TextStyle (

                  color: AppColorsConstant.black.withOpacity(0.5),
                  fontSize: MediaQuery.of(context).size.height*0.025,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'me_quran.ttf',
                ),),
                // SizedBox(height:2,),


                Text( '  آيـــات   ${num.toString().toArabicNumbers}   ' ,
textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    color: AppColorsConstant.grey,
                    fontWeight: FontWeight.bold,
                    // fontFamily: 'me_quran.ttf',
                    fontSize: 14


                  ),
                ),
                const SizedBox(height: 5,),

              ],
            ) ,
            const Spacer(flex: 3,),
            Text( place , style: const TextStyle(
                fontFamily: 'me_quran.ttf',
              color: AppColorsConstant.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14
            ),),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios ,color: AppColorsConstant.grey,size: 22,)
          ],
        ),
      ),
    );
  }
}
