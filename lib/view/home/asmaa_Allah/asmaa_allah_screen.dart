import 'package:flutter/material.dart';
import 'package:islami/view/home/asmaa_Allah/item_name.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/images_constant.dart';

import '../../../constants/style_constant.dart';

class AsmaaAllahScreen extends StatelessWidget {
  const AsmaaAllahScreen({Key? key}) : super(key: key);
static const String id = 'asmaaAllah';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            ImageConstant.bg2,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.transparent,


              appBar:  AppBar(
      //       title: Text(
      // 'أسماء الله الحسنى',
      // style: AppStyleConstant.style24WithBlackColor,
      // ),
      // centerTitle: true,
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: AppColorsConstant.black,
      ),
              body: Padding(
                padding:  EdgeInsets.all(
                  MediaQuery.of(context).size.height*0.02
                ),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder( //<-- SEE HERE
                      borderRadius: BorderRadius.circular(15)
                  ) ,
                  child: Padding(
                    padding:  EdgeInsets.all(
                      MediaQuery.of(context).size.height*0.02

                    ),
                    child: ListView.separated(
                      separatorBuilder: (ctx,index){
                        return SizedBox(
                          height: 5,
                        );
                      },
                     itemBuilder:(ctx,index) {
                       return NameItem();
                     }   ,
                      physics: BouncingScrollPhysics( ) ,
                      itemCount:99 ,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
