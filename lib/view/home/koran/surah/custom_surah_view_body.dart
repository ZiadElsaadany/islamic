import 'package:flutter/material.dart';
import 'package:islami/view/home/koran/surah/return_basmala.dart';

import '../../../../constants/sowar.dart';
import 'koran_widget.dart';

class CustomSurahViewBody extends StatelessWidget {
  const CustomSurahViewBody({Key? key,required this.indx}) : super(key: key);

  final int indx;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.02),
      child: ListView.separated(

        physics: const BouncingScrollPhysics(),
        separatorBuilder: (ctx, index) {
          return  SizedBox(
            height: MediaQuery.of(context).size.height*0.04,
          );
        },
        itemBuilder: (ctx, index) {
          return     indx!= 0 && indx!= 8 &&index==0?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ReturnBasmala(),
              Container(
                  color: index %1 == 0
                      ? const Color.fromARGB(255, 253, 251, 240)
                      : const Color.fromARGB(255, 253, 247, 230),
                  child: KoranWidget(index1: indx, index2: index))
            ],
          ) : Container(
              color: index % 2 == 0
                  ? const Color.fromARGB(255, 253, 251, 240)
                  : const Color.fromARGB(255, 253, 247, 230),
              child: KoranWidget(index1: indx, index2: index));
        },
        itemCount: Sowar.sowar['sowar']![indx]['verses'].length,
      ),
    );
  }
}
