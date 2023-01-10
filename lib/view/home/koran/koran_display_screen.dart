import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/constants/style_constant.dart';
import 'package:islami/view/home/koran/koran_widget.dart';

import '../../../constants/images_constant.dart';
import '../../../constants/sowar.dart';

class KoranScreen extends StatelessWidget {
  KoranScreen({Key? key, required this.indx}) : super(key: key);
  static const String id = 'KoranScreen';
  final int indx; // الفاتحة
  List<String> content = [];
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
              appBar: AppBar(
                foregroundColor: AppColorsConstant.black,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(' سورة ${Sowar.sowar['sowar']![indx]['name']}',
                    style: AppStyleConstant.style24WithBlackColor),
                centerTitle: true,
                toolbarHeight: MediaQuery.of(context).size.height * 0.2,
              ),
              backgroundColor: Colors.transparent,
              body: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.02),
                child: ListView.separated(

                   addAutomaticKeepAlives: true,

                  separatorBuilder: (ctx, index) {
                    return const Divider(
                      color: AppColorsConstant.primaryColor,
                      thickness: 1,
                    );
                  },
                  itemBuilder: (ctx, index) {
                    return KoranWidget(index1: indx, index2: index);
                  },
                  itemCount: Sowar.sowar['sowar']![indx]['verses'].length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
