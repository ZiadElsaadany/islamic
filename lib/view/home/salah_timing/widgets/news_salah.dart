import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/constants/style_constant.dart';
import 'package:islami/controller/apis/api_salahTiming.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../../constants/color_constant.dart';
import '../../../../constants/images_constant.dart';

class NewsSalah extends StatefulWidget {
  const NewsSalah({Key? key}) : super(key: key);

  @override
  State<NewsSalah> createState() => _NewsSalahState();
}

class _NewsSalahState extends State<NewsSalah> {
  double ? indicatorValue;
  Timer? timer;
  String time ( ) {
    return "${DateTime.now().hour<10?"0${DateTime.now().hour}" : DateTime.now().hour}:${DateTime.now().minute<10?"0${DateTime.now().minute}" : DateTime.now().minute}:${DateTime.now().second<10?"0${DateTime.now().second}" : DateTime.now().second}" ;
  }
  updateSeconds(){
    timer =Timer.periodic(Duration(seconds: 1), (timer) {
      return setState(() {
        indicatorValue = DateTime.now().second/ 60 ;
      });
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    indicatorValue =DateTime.now().second/60;
    updateSeconds();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    timer!.cancel();
    super.dispose();
  }
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
                  Text('الصلاة التالية',
                  style: AppStyleConstant.style20WithWhiteColor.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                  ),
                  ),
                  Text('(${Provider.of<PrayingApi>(context,listen: false).getPrayingName()})',
                    style: TextStyle(
                        color: AppColorsConstant.yellow,
                        fontSize:15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text('${Provider.of<PrayingApi>(context).timeOfSalah}',
              style: TextStyle(
                color: AppColorsConstant.yellow,
                fontSize:15,
                fontWeight: FontWeight.bold
              ),
              ),

              SizedBox(
                height: 10,
              ),

            ],
          ),
          const Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              Text('${time()}',
              style: GoogleFonts.share(fontSize: 18.0,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400
                )
              ),
              ),
              CircularPercentIndicator(
                // foregroundColor: Colors.black,
                backgroundColor: AppColorsConstant.white,
                radius: MediaQuery.of(context).size.height*0.06,
                animation: true,
                animateFromLastPercent: true,
                curve: Curves.easeInToLinear,

                lineWidth: 4,

                percent: indicatorValue!,
                circularStrokeCap: CircularStrokeCap.butt,
                progressColor: AppColorsConstant.yellow,


              ),
            ],
          )
        ],
      ),
    );
  }
}
