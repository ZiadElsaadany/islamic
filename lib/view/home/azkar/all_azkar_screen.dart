import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/constants/style_constant.dart';
import 'package:islami/controller/provider/azkar_provider.dart';
import 'package:islami/view/home/azkar/azkar_details_screen.dart';
import 'package:provider/provider.dart';

import '../../../constants/images_constant.dart';

class AllAzkarScreen extends StatelessWidget {
  const AllAzkarScreen({Key? key}) : super(key: key);
  static const String id = 'AllAzkar';
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
           body:  NestedScrollView(
             headerSliverBuilder:
                 (BuildContext context, bool innerBoxIsScrolled) {
               return <Widget>[
                 SliverAppBar(
                     toolbarHeight:  MediaQuery.of(context).size.height * 0.15,
                   title: Text('الأذكار',
                   style: AppStyleConstant.style20WithBlackColor.copyWith(
                     fontWeight: FontWeight.w500,
                     fontSize: 22
                   ),
                   ),
                     centerTitle: true,
                     backgroundColor: Colors.transparent,
                     // floating: false,
                     pinned: false,
                     elevation: 0,
                     foregroundColor: AppColorsConstant.black

                 ),
               ];
             },
           body: Padding(
             padding:
             EdgeInsets.only(
                 bottom:  MediaQuery.of(context).size.height * 0.05,
                 top: MediaQuery.of(context).size.height * 0.04,
                 left: MediaQuery.of(context).size.height * 0.04,
                 right: MediaQuery.of(context).size.height * 0.04
             ),
             child: ListView.separated(
                 physics: BouncingScrollPhysics(),
                 separatorBuilder: (ctx,index) {
                   return SizedBox(height: 10,);
                 } ,

                 itemCount: 7,
                 itemBuilder: (ctx, index) {
                   return GestureDetector(
                     onTap: ( )  {
                       Navigator.pushNamed(context, AzkarDetailsScreen.id,
                           arguments:  index
                       );
                     }  ,
                     child: Card(
                       shape: RoundedRectangleBorder( //<-- SEE HERE
                           borderRadius: BorderRadius.circular(15)
                       ) ,
                       elevation: 5,
                       color: AppColorsConstant.white,

                       child: Padding(
                         padding:  EdgeInsets.all(
                             MediaQuery.of(context).size.height*0.035

                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Text(
                               Provider.of<AzkarProvider>(context).azkarList[index]['name'],
                               style: AppStyleConstant.style20WithBlackColor.copyWith(
                                   color: AppColorsConstant.black.withOpacity(0.7)
                               ),
                               textAlign: TextAlign.center,
                             ),
                             Image.asset( Provider.of<AzkarProvider>(context).azkarList[index]['image']),
                           ],
                         ),
                       ),
                     ),
                   );
                 }),
           ),
           ),

            ),
          ),
        ],
      ),
    );
  }
}
