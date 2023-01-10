import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/constants/style_constant.dart';
import 'package:islami/controller/apis/api_salahTiming.dart';
import 'package:islami/view/home/salah_timing/widgets/news_salah.dart';
import 'package:islami/view/home/salah_timing/widgets/time_container.dart';
import 'package:provider/provider.dart';

import '../../../constants/images_constant.dart';

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
          Image.asset(
           ImageConstant.bg2,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Consumer<PrayingApi>(
              builder: (context,provider,_) {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body:         Provider.of<PrayingApi>(context).isGetTime ? const Center(child: CircularProgressIndicator(
                    color: AppColorsConstant.primaryColor,
                  )):NestedScrollView(
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
                      child: ListView (
                        physics: const BouncingScrollPhysics(),
                        children: [
                         NewsSalah(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.02,
                          ),
                          Text('المواعيد في مدينة طنطا',
                          style:AppStyleConstant.style18WithPrimaryColor,
                            textAlign: TextAlign.center,
                          ),
                          Text(' ${provider.jsonRes['data']['date']['hijri']['weekday']['ar']} ${provider.jsonRes['data']['date']['readable']}',

                          textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.share(

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
