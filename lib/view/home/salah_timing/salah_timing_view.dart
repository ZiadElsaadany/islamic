
import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/constants/style_constant.dart';
import 'package:islami/controller/apis/api_salahTiming.dart';
import 'package:islami/view/home/return_image.dart';
import 'package:islami/view/home/salah_timing/widgets/news_salah.dart';
import 'package:islami/view/home/salah_timing/widgets/time_container.dart';
import 'package:provider/provider.dart';

import '../../../constants/images_constant.dart';
import '../custom_app_bar.dart';

class SalahTimingScreen extends StatefulWidget {
  const SalahTimingScreen({Key? key}) : super(key: key);
static const String id= 'salahTime';

  @override
  State<SalahTimingScreen> createState() => _SalahTimingScreenState();
}

class _SalahTimingScreenState extends State<SalahTimingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero , ( ) async {
      Provider.of<PrayingApi>(context, listen: false).getTimeApi() ;
    } )  ;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
        const ReturnImage(img: ImageConstant.bg),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Consumer<PrayingApi>(
              builder: (context,provider,_) {
                return Scaffold(
                  appBar: CustomAppBar(widget: const Text(

                    'مواعيد الصلاة'
                  )),
                  backgroundColor: Colors.transparent,
                  body:         Provider.of<PrayingApi>(context).isGetTime ? const Center(child: CircularProgressIndicator(
                    color: AppColorsConstant.primaryColor,
                  )): Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView (
                        physics: const BouncingScrollPhysics(),
                        children: [
                         const NewsSalah(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.02,
                          ),
                          Text('المواعيد في مدينة طنطا',
                          style:AppStyleConstant.style18WithPrimaryColor.copyWith(
                            fontFamily: 'cairo'
                          ),
                            textAlign: TextAlign.center,
                          ),
                          Text(' ${provider.jsonRes['data']['date']['hijri']['weekday']['ar']} ${provider.jsonRes['data']['date']['readable']}',

                          textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style: TextStyle(

                              color: AppColorsConstant.black.withOpacity(0.5)
                            ),
                          ),
                          TimeContainer(
                            img:ImageConstant.sleeping ,
                            salahName: 'صلاة الفجر',
                            salahTime: provider.salahTime?.fajr ?? '' ,
                          ),
                          TimeContainer(
                            img:ImageConstant.sleeping ,
                            salahName: '  صلاة الضهر',
                            salahTime:provider.salahTime?.dhuhr??'' ,
                          ),
                          TimeContainer(
                            img:ImageConstant.sleeping ,
                            salahName: 'صلاة العصر',
                            salahTime: provider.salahTime?.asr??'' ,
                          ),
                          TimeContainer(
                            img:ImageConstant.sleeping ,
                            salahName: 'صلاة المغرب',
                            salahTime: provider.salahTime?.maghrib??''  ,
                          ),
                          TimeContainer(
                            img:ImageConstant.sleeping ,
                            salahName: 'صلاة العشاء',
                            salahTime: provider.salahTime?.isha??''  ,
                          ),



                        ],
                      ),
                    ),

                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
