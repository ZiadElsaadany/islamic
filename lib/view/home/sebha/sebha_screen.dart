import 'package:flutter/material.dart';
import 'package:islami/animation/fade_animation.dart';
import 'package:islami/controller/provider/sebha_provider.dart';
import 'package:provider/provider.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/images_constant.dart';
import '../../../constants/style_constant.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({Key? key}) : super(key: key);
static const String id = 'sebhaScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
        Image.asset(

        ImageConstant.bg2,
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
      Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  'التسبيح',
                  style: AppStyleConstant.style24WithBlackColor,
                ),
                centerTitle: true,
                toolbarHeight: MediaQuery.of(context).size.height * 0.15,
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: AppColorsConstant.black,
              ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right:  12,
                        // bottom: 8
                    ),
                    child: Row(
                      children: [
                        Column (
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: AppColorsConstant.primaryColor)
                              ) ,


                                child: const Icon(Icons.add,color: AppColorsConstant.primaryColor),

                            ),
                            const SizedBox(height: 10,),
                            GestureDetector

                              (
                                onTap: ( )  {
                                  Provider.of<SebhaProvider>(context,listen: false).zero();

                                },
                                child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                  border:  Border.all(color: AppColorsConstant.primaryColor),
                                  borderRadius: BorderRadius.circular(50)
                                )
                                ,child: const Icon ( Icons.restart_alt,color: AppColorsConstant.primaryColor)))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
               FadeAnimation(1.3, child:  Positioned(
                 top: -10,
                 child: Stack(
                   alignment: Alignment.topCenter,
                   children: [
                     const Image(
                       image: AssetImage("assets/images/sebha_images/head of seb7a.png"),
                     ),
                     Container(
                       padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
                       child: GestureDetector(
                         onTap: ( )  {
                           Provider.of<SebhaProvider>(context,listen: false).changeAngle();
                           Provider.of<SebhaProvider>(context,listen: false).sebhaName();
                         },
                         child: Transform.rotate(
                             angle: Provider.of<SebhaProvider>(context).angle,
                             child: const Image(image: AssetImage("assets/images/sebha_images/body of seb7a.png"))),
                       ),
                     ),
                     Positioned(
                         bottom:MediaQuery.of(context).size.height*0.15,
                         child: Text(  '${Provider.of<SebhaProvider>(context).counter}',
                         style: const TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.bold
                         ),
                         ))
                   ],
                 ),
               ) ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    color: AppColorsConstant.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      //set border radius more than 50% of height and width to make circle
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(MediaQuery.of(context).size.height*0.015),
                      child: Text(Provider.of<SebhaProvider>(context).tasbehList[Provider.of<SebhaProvider>(context).index] ,
                      style: const TextStyle(
                        color: AppColorsConstant.white ,
                        fontWeight:  FontWeight.bold ,
                        fontSize: 20
                      ),
                      ),
                    ) ,
                  ),
                ),

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
