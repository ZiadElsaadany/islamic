
import 'package:flutter/material.dart';

import 'package:islami/constants/style_constant.dart';
import 'package:islami/controller/apis/api_salahTiming.dart';

import 'package:provider/provider.dart';

import '../../../../constants/color_constant.dart';
import '../../../../constants/images_constant.dart';

class NewsSalah extends StatelessWidget {
  const NewsSalah({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.015),
      padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.019),
      decoration: BoxDecoration(
          color: AppColorsConstant.primaryColor,
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage(
                ImageConstant.mosque,
              )
          )
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(ImageConstant.islamic),
                  SizedBox(width: 10,),
                  Text('الصلاة التالية   ',
                  style: AppStyleConstant.style20WithWhiteColor.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                  ),
                  ),
                  Text('( ${Provider.of<PrayingApi>(context,listen: false).getPrayingName()} )',
                    style: TextStyle(
                        color: AppColorsConstant.yellow,
                        fontSize:15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text('${Provider.of<PrayingApi>(context).timeOfSalah}',
              style: const TextStyle(
                color: AppColorsConstant.white,
                fontSize:15,
                fontWeight: FontWeight.bold
              ),
              ),

              const SizedBox(
                height: 10,
              ),

            ],
          ),
          const Spacer(),

        ],
      ),
    );
  }
}
