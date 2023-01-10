import 'package:flutter/material.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/sowar.dart';
import '../../../constants/style_constant.dart';

class KoranWidget extends StatelessWidget {
  const KoranWidget({Key? key,required this.index1,required this.index2}) : super(key: key);
final int index1 ;
final int index2 ;
  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Container(

        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,width: 0.3) ,
            borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.03),
        child: Column(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  child: Text(' آية ${Sowar.sowar['sowar']![index1]['verses'][index2]['verse_number']}' ,
                    style: AppStyleConstant.style15WithPrimaryColorAndBold,
                  ),
                ),
                SizedBox( width: 10,) ,
                Icon(Icons.star,
                  color: AppColorsConstant.primaryColor,
                ),
                Icon(Icons.save,
                  color: AppColorsConstant.primaryColor,
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Text(
              ' ${ Sowar.sowar['sowar']![index1]['verses'][index2]['content']}  {${ Sowar.sowar['sowar']![index1]['verses'][index2]['verse_number']}}' ,
              style: TextStyle(
                  fontSize: 22,

                  letterSpacing: 0.5,
                  wordSpacing: 10
              ),
            ),
          ],
        ),
      ),
    );
  }
}
