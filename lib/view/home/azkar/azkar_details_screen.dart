import 'package:flutter/material.dart';
import 'package:islami/animation/fade_animation.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/constants/data.dart';
import 'package:islami/constants/style_constant.dart';
import 'package:islami/controller/provider/azkar_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/images_constant.dart';

class AzkarDetailsScreen extends StatelessWidget {
  static const String id = 'AzkarDetailsScreen';

  Widget build(BuildContext context) {
    int args = ModalRoute.of(context)!.settings.arguments as int;
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

              body: FadeAnimation(1.1, child:  NestedScrollView(

                headerSliverBuilder:  (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: MediaQuery.of(context).size.height*0.15,
                      backgroundColor: Colors.transparent,
                      floating: false,
                  pinned: false,
                  elevation: 0,
                  foregroundColor: Colors.black,
                  leading: SizedBox(),



                  //     title: AppBar(
                  // toolbarHeight: MediaQuery.of(context).size.height * 0.16,
                  // foregroundColor: AppColorsConstant.black,
                  // elevation: 0,
                  // backgroundColor: Colors.transparent,
                  // title: Text(
                  // Provider.of<AzkarProvider>(context).azkarList[args]['name'],
                  // style: AppStyleConstant.style24WithBlackColor,
                  // ),
                  // // leading: SizedBox(),
                  // centerTitle: true,
                  // ),
                      // pinned: true,
                      // elevation: 0,
                      flexibleSpace:  AppBar(
                  toolbarHeight: MediaQuery.of(context).size.height * 0.16,
                  foregroundColor: AppColorsConstant.black,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Text(
                  Provider.of<AzkarProvider>(context).azkarList[args]['name'],
                  style: AppStyleConstant.style24WithBlackColor,
                  ),
                  centerTitle: true,
                  ),

                    ),
                  ];
                },
                body: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount:  Provider.of<AzkarProvider>(context).azkarList[args]['azkar1'].length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                            //<-- SEE HERE
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(ImageConstant.bg3 ,
                                  height: MediaQuery.of(context).size.height*0.4,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
                                  child: Column(
                                    children: [
                                      Text(
                                        '${ Provider.of<AzkarProvider>(context).azkarList[args]['azkar1'].length} / ${index +  1}',
                                        style: AppStyleConstant.style15WithPrimaryColorAndBold,

                                      ),
                                      Provider.of<AzkarProvider>(context).azkarList[args]['azkar1'][index]['adi1']!=null?         Text(
                                        Provider.of<AzkarProvider>(context).azkarList[args]['azkar1'][index]['adi1'],
                                        style: AppStyleConstant.style14WithGreyColor,
                                      ) : SizedBox() ,
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height*0.05,
                                      ),
                                      Text( Provider.of<AzkarProvider>(context).azkarList[args]['azkar1'][index]['adi'],
                                          style: TextStyle(
                                              color: AppColorsConstant.black
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22
                                          )),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      // Text(Data.azkarList[args]['azkar1'][index]['end'],
                                      //     style: AppStyleConstant
                                      //         .style15WithPrimaryColorAndBold),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height*0.05,
                                      ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(

                                              style: ButtonStyle(
                                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15)
                                                )),
                                                backgroundColor:
                                                MaterialStateProperty.all(     Provider.of<AzkarProvider>(context).azkarList[args]['azkar1'][index]['number']==0?

                                                Colors.red : AppColorsConstant.green)

                                              ),
                                              onPressed: ( ) {
                                                Provider.of<AzkarProvider>(context,listen: false).changeCounterOfZekr(

                                                    index:index,
                                                    args: args
                                                ) ;
                                                Provider.of<AzkarProvider>(context,listen: false).setFinish(args: args);
                                              } , child: Text(
                                            '${Provider.of<AzkarProvider>(context).azkarList[args]['azkar1'][index]['number']}'
                                          )),
                                        )
                                      /*  onTap: ( ) {
                                          Provider.of<AzkarProvider>(context,listen: false).changeCounterOfZekr(

                                              index:index,
                                          args: args
                                          ) ;
                                          Provider.of<AzkarProvider>(context,listen: false).setFinish(args: args);

                                        }*/

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
