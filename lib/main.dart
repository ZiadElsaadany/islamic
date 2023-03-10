
import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';

import 'package:islami/controller/apis/api_salahTiming.dart';
import 'package:islami/controller/provider/azkar_provider.dart';
import 'package:islami/controller/provider/doaa_provider.dart';
import 'package:islami/controller/provider/quran_provider.dart';
import 'package:islami/controller/provider/sebha_provider.dart';
import 'package:islami/view/home/asmaa_Allah/asmaa_allah_screen.dart';
import 'package:islami/view/home/azkar/azkar_names/azkar_view.dart';
import 'package:islami/view/home/azkar/zekr_details/azkar_details_view.dart';
import 'package:islami/view/home/doaa/doaa_view.dart';
import 'package:islami/view/home/home_screen.dart';
import 'package:islami/view/home/koran/names/names_view.dart';
import 'package:islami/view/home/salah_timing/salah_timing_view.dart';
import 'package:islami/view/home/sebha/sebha_view.dart';
import 'package:islami/view/home/zakah_count/screen.dart';
import 'package:islami/view/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main ( )  {
  runApp(
      MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create:( ctx) {
              return SebhaProvider() ;
            }) ,
        ChangeNotifierProvider(
            create:( ctx) {
              return AzkarProvider() ;
            }) ,
        ChangeNotifierProvider(
            create:( ctx) {
              return KoranProvider() ;
            }) ,
        ChangeNotifierProvider(
            create:( ctx) {
              return DoaaProvider() ;
            }) ,
        ChangeNotifierProvider(
            create:( ctx) {
              return PrayingApi() ;
            }) ,
      ],
      child:  IslamyApp())
  ) ;
}




class IslamyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
theme: ThemeData (
  fontFamily: 'cairo',
  brightness: Brightness.light,
  primaryColor: AppColorsConstant.primaryColor
),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes:   {
HomeScreen.id:(ctx) =>const HomeScreen( ),
        SurahNameScreen.id : (ctx)=>const SurahNameScreen() ,
AllAzkarScreen.id : (ctx) =>const AllAzkarScreen() ,
        AzkarDetailsScreen.id:(ctx)=>const AzkarDetailsScreen(),
        SebhaScreen.id:(ctx)=>const SebhaScreen() ,
        DoaaScreen.id:(ctx) =>const DoaaScreen(),
        AsmaaAllahScreen.id:(ctx)=>const AsmaaAllahScreen(),
        SalahTimingScreen.id:(ctx)=>const SalahTimingScreen(),
        ZakatCount.id:(ctx)=> const ZakatCount(),
        SplashScreen.id:(ctx)=> const SplashScreen()
      },
    );
  }
}

