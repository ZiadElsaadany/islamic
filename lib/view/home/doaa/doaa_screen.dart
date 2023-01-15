import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:islami/animation/fade_animation.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/controller/provider/doaa_provider.dart';
import 'package:islami/view/home/doaa/doaa_card.dart';
import 'package:islami/view/home/doaa/switch_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/data.dart';
import '../../../constants/images_constant.dart';
import '../../../constants/style_constant.dart';
import 'my_doaa/my_doaa_screen.dart';

class DoaaScreen extends StatelessWidget {
   DoaaScreen({Key? key}) : super(key: key);
static const String id= 'doaa';
   double num  = 1.2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(ImageConstant.bg2,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  'الأدعية',
                  style: AppStyleConstant.style24WithBlackColor,
                ),
                centerTitle: true,
                toolbarHeight: MediaQuery.of(context).size.height * 0.15,
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: AppColorsConstant.black,
              ),
              body: Center(
                child: Column(
                  children: [
                    SwitchWidget(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.03,
                    ),

                    Provider.of<DoaaProvider>(context).checkClick?
                    Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3 ,
                      ),
                      physics: const BouncingScrollPhysics(),

                      itemCount:
                      Provider.of<DoaaProvider>(context).doaa.length,


                      itemBuilder: (ctx,index )  {
                        num = num+.1;
                        return  FadeAnimation(

                            num, child: GestureDetector
                          (
                            onTap: ( )  {
                              AwesomeDialog(

// buttonsTextStyle: AppStyleConstant.style18WithPrimaryColor,
//                           barrierColor: Colors.red,

                                  buttonsBorderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide (
                                      color: AppColorsConstant.primaryColor
                                  ),
                                  context: context,

                                  animType: AnimType.bottomSlide,
                                  dialogType: DialogType.noHeader,
                                  dialogBackgroundColor: AppColorsConstant.primaryColor,
                                  body: Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                        // Color(0xff19a777)
                                        AppColorsConstant.primaryColor.withOpacity(0.8)
                                    ),
                                    child: Text(
                                       Provider.of<DoaaProvider>(context,listen: false).doaa[index]['text'] ,
                                        textAlign: TextAlign.start,
                                        textDirection: TextDirection.rtl,
                                        style: AppStyleConstant.style20WithWhiteColor
                                    ),
                                  ),

                                  btnCancel: GestureDetector(
                                    onTap: ( ) {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon( Icons.cancel,
                                      size: 40,
                                      color: AppColorsConstant.white,
                                    ),
                                  )
                                // btnOkOnPress: () {},
                              ).show();
                            } ,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height*0.001,
                                  horizontal: MediaQuery.of(context).size.width*0.024
                              ),
                              child: DoaaCard(index: index,),
                            )))  ;
                      })
                ) : MyDoaa()
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
