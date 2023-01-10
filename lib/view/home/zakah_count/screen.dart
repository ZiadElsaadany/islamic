import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/constants/style_constant.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/images_constant.dart';

class ZakatCount extends StatefulWidget {
  const ZakatCount({Key? key}) : super(key: key);
  static const String id = 'zakat' ;

  @override
  State<ZakatCount> createState() => _ZakatCountState();
}

class _ZakatCountState extends State<ZakatCount> {
  bool _customTileExpanded = false;
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
                body:NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                          toolbarHeight:  MediaQuery.of(context).size.height * 0.13,
                          backgroundColor: Colors.transparent,
                          // floating: false,
                          pinned: true,
                          elevation: 0,
                          foregroundColor: AppColorsConstant.black

                      ),
                    ];
                  },
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.05,
                        ),
                        Text('اختر نوع الزكاة:',
                        style: AppStyleConstant.style18WithPrimaryColor,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.05,
                        ),
                        Container(
                          decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColorsConstant.grey)

                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.18,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20) ,
                                      bottomRight: Radius.circular(20)
                                    ),
                                    color: AppColorsConstant.primaryColor ,

                                  ),
                                  child: Image.asset(ImageConstant.money),
                                ),
                              ) ,
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.04,
                              ),
                              Text('زكاة المال',
                              style: AppStyleConstant.style14WithBlackColor.copyWith(
                                fontSize: 18
                              ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.05,
                        ),

                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(20),
                           border: Border.all(color: AppColorsConstant.grey)

                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.18,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration (
                            color: AppColorsConstant.primaryColor ,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20) ,
                                        bottomRight: Radius.circular(20)
                                    ),

                          ),
                                  child: Image.asset(ImageConstant.business),
                                ),
                              ) ,
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.04,
                              ),
                              Text('الجنية المصري',
                                style: AppStyleConstant.style14WithBlackColor.copyWith(
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        )

                      ],

                    ),
                  )
                ),

            ),
          ),
        ],
      ),
    );
  }
}
