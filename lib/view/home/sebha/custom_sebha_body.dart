import 'package:flutter/material.dart';
import 'package:islami/view/home/sebha/sebha_image.dart';
import 'package:islami/view/home/sebha/sebha_text.dart';
import 'package:provider/provider.dart';

import '../../../animation/fade_animation.dart';
import '../../../constants/color_constant.dart';
import '../../../controller/provider/sebha_provider.dart';

class CustomSebhaBody extends StatelessWidget {
  const CustomSebhaBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
         const SebhaImage(),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0),
            child:SebhaText(),
          ),

        ],
      ),
    );
  }
}
/*
*   Text(  '${Provider.of<SebhaProvider>(context).counter}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              )*/