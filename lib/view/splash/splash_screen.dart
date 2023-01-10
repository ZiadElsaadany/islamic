import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/constants/color_constant.dart';

import '../../constants/images_constant.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id=  'Splash' ;

  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer ;

  goNext( )=> Navigator.pushReplacementNamed(context,HomeScreen.id );

  startDelay(){
    timer=Timer(const Duration(
        milliseconds: 3000
    ), ()=> goNext()
    );
  }
  @override
  void initState() {
    super.initState();
    startDelay()  ;
  }
  @override
  void dispose() {
    timer.cancel() ;
    super.dispose();
  }

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
          Scaffold(
            backgroundColor: Colors.transparent,
           body :  Center(
             child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 4,
                  ),
                  Image.asset(ImageConstant.logo,
                  width: MediaQuery.of(context).size.width*0.5,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  CircularProgressIndicator(
                    color: AppColorsConstant.primaryColor,
                  ),
                  Spacer(flex: 3,),
                  Text('Developed By Ziad Al-saadany' ,
                  style: GoogleFonts.share(),
                  ),
                  Spacer(flex: 1,),

                ],
              ),
           )
          )
        ],
      ),
    ) ;
  }
}