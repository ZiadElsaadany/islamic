import 'package:flutter/material.dart';
import 'package:islami/view/home/salah_timing/salah_timing_screen.dart';
import 'package:islami/view/home/sebha/sebha_view.dart';
import 'package:islami/view/home/zakah_count/screen.dart';
import 'package:provider/provider.dart';

import '../../constants/data.dart';
import '../../controller/provider/quran_provider.dart';
import 'azkar/azkar_names/azkar_view.dart';
import 'doaa/doaa_view.dart';
import 'home_card.dart';
import 'koran/names/names_view.dart';

class CustomHomeScreenBody extends StatelessWidget {
  const CustomHomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              for (int index = 0;
              index < Data.imagesForHome1.length;
              index += 1)
                SizedBox(
                  height: index % 2 != 0
                      ? MediaQuery.of(context).size.width *
                      0.4 -
                      (MediaQuery.of(context).size.width *
                          0.04)
                      : MediaQuery.of(context).size.width *
                      0.55 -
                      (MediaQuery.of(context).size.width *
                          0.04),
                  width:
                  MediaQuery.of(context).size.width * 0.5 -
                      (MediaQuery.of(context).size.width *
                          0.04),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Provider.of<KoranProvider>(context,
                          listen: false)
                          .changeSearchState(state: false);
                      fun(index, context,from: true);
                    },
                    child: HomeCard(
                      txt:
                      '${Data.imagesForHome1[index]['name']}',
                      img:
                      '${Data.imagesForHome1[index]['img']}',
                    ),
                  ),
                ),
            ],
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Column(
            children: [
              for (int index = 0;
              index < Data.imagesForHome2.length;
              index += 1)
                SizedBox(
                  height: index % 2 == 0
                      ? MediaQuery.of(context).size.width *
                      0.4 -
                      (MediaQuery.of(context).size.width *
                          0.04)
                      : MediaQuery.of(context).size.width *
                      0.55 -
                      (MediaQuery.of(context).size.width *
                          0.04),
                  width:
                  MediaQuery.of(context).size.width * 0.5 -
                      (MediaQuery.of(context).size.width *
                          0.04),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),

                    onTap: () {
                      Provider.of<KoranProvider>(context,
                          listen: false)
                          .changeSearchState(state: false);
                      fun(index, context,from: false);
                    },
                    child: HomeCard(
                      txt:
                      '${Data.imagesForHome2[index]['name']}',
                      img:
                      '${Data.imagesForHome2[index]['img']}',
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
  fun(index, context, {required bool from}) {
    if (index == 0&&from) {
      Navigator.pushNamed(context, SurahNameScreen.id);
    } else if (index == 0&&!from) {
      Navigator.pushNamed(context, AllAzkarScreen.id);
    } else if (index == 1&&from) {
      Navigator.pushNamed(context, SebhaScreen.id);
    } else if (index == 1&&!from) {
      Navigator.pushNamed(context, DoaaScreen.id);
    } else if( index == 5 && from){
      Navigator.pushNamed(context, ZakatCount.id);
    }else if(index== 3 && from) {
      Navigator.pushNamed(context, SalahTimingScreen.id);

    }
  }
}
