
import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';

import 'package:islami/view/home/koran/koran_widget.dart';

import '../../../constants/sowar.dart';

class KoranScreen extends StatelessWidget {
  KoranScreen({Key? key, required this.indx}) : super(key: key);
  static const String id = 'KoranScreen';
  final int indx; // الفاتحة
  List<String> content = [];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(

            foregroundColor: AppColorsConstant.black,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text('  سورة${Sowar.sowar['sowar']![indx]['name']}',

                style:const TextStyle(
                  fontSize: 22,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500 ,
                  fontFamily: 'HafsSmart_08.ttf',

                )),
            centerTitle: true,
            // toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          ),
          backgroundColor: const Color.fromARGB(255, 253, 247, 230),
          body: Padding(
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
           const Center(
                      child: Text(
                        'بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ ',
                        style: TextStyle(
                            fontFamily: 'me_quran.ttf',
                            fontSize: 22,
                            color: Colors.grey
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Container(
                        color: index % 2 == 0
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
          ),
        ),
      ),
    );
  }
}
