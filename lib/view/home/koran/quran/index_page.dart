import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/controller/provider/quran_provider.dart';
import 'package:islami/view/home/koran/koran_display_screen.dart';
import 'package:provider/provider.dart';

import '../../../../constants/color_constant.dart';
import '../../../../constants/images_constant.dart';
import 'arabic_surah_number.dart';

import 'surah_builder.dart';
import 'constant.dart';


class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  @override
  void initState() {
     Future.delayed(Duration.zero,()async {
       Provider
           .of<KoranProvider>(context, listen: false).readJson();
     });
     super.initState();

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
            backgroundColor:Colors.transparent,

            appBar: AppBar(
              foregroundColor: Colors.black,
              leading: const SizedBox(),
              elevation: 0,
              actions: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                } , icon: Icon( Icons.arrow_forward) )
              ],
              centerTitle: true,
              title: const Text(
                //"القرآن",
                "القرآن الكريم",
                style: TextStyle(
                  //fontFamily: 'quran',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(0.1, 0.1),
                        blurRadius: 1.0,
                        color: Color.fromARGB(254, 0, 0, 0),
                      ),
                    ]),
              ),
              backgroundColor:  Colors.transparent
            ),
            body:  Provider
                .of<KoranProvider>(context).c? const Center(
              child: CircularProgressIndicator(
                color: AppColorsConstant.primaryColor,
              ),
            ) :ListView.builder(

              physics: const BouncingScrollPhysics(),
              itemBuilder: (
                  context ,index
                  ){
                return  Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: index % 2 == 0
                      ? Colors.white.withOpacity(0.9)
                      : const Color.fromARGB(255, 253, 251, 240),
                  margin: const EdgeInsets.all(10),
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ArabicSurahNumber(i: index),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            arabicName[index]['name'],
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black87,
                              fontFamily: 'quran',
                            ),
                            textDirection: TextDirection.rtl,
                          ),

                          const ImageIcon(
                            AssetImage(
                              ImageConstant.itar,
                            ),
                            size: 30,
                            color: AppColorsConstant.primaryColor,

                          ),
                        ],
                      ),
                    ),
                    onTap: () {

                      Navigator.pushNamed(context, KoranScreen.id);
                    },
                  ),
                );

              }  ,itemCount: 114,)
          ),
        ],
      ),
    );
  }
}
