import 'package:flutter/material.dart';
import 'package:islami/controller/provider/quran_provider.dart';
import 'package:islami/view/home/azkar/all_azkar_screen.dart';
import 'package:islami/view/home/doaa/doaa_screen.dart';
import 'package:islami/view/home/home_card.dart';
import 'package:islami/view/home/koran/koran_display_screen.dart';

import 'package:islami/view/home/salah_timing/salah_timing_screen.dart';
import 'package:islami/view/home/sebha/sebha_screen.dart';
import 'package:islami/view/home/zakah_count/screen.dart';
import 'package:provider/provider.dart';
import '../../constants/data.dart';
import 'koran/quran/index_page.dart';
import 'koran/quran/my_drawer.dart';
import 'koran/surah_name_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<KoranProvider>(context, listen: false).makeList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg3.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Scaffold(
              drawer: const MyDrawer(),

              backgroundColor: Colors.transparent,
              appBar: AppBar (
                backgroundColor: Colors.transparent,
                elevation: 0 ,
                foregroundColor: Colors.black,
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          expandedHeight:
                              MediaQuery.of(context).size.height * 0.22,
                          backgroundColor: Colors.transparent,
                          // floating: false,
                          //pinned: false,
                          elevation: 0,
                          flexibleSpace:
                              Image.asset('assets/images/Screenshot (1).png'),
                        ),
                      ];
                    },
                    body: Row(
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
                    )),
              ),
              /*
                            Data.txtForHome[index]
                                , img: Data.imagesForHome[index]),*/
            )
          ],
        ),
      ),
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

/*


Expanded(
                    child: GridView.custom(
                      gridDelegate:SliverQuiltedGridDelegate(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 2),
                          QuiltedGridTile(1, 2),
                          QuiltedGridTile(2, 1),


                        ],
                      ),
                      childrenDelegate:   SliverChildBuilderDelegate(
                         childCount: 12,
                          (context, index) {
                          return   InkWell(
                              onTap:  ()  {
                                fun(index, context);
                              },
                              child: HomeCard(
                                txt:'${Data.imagesForHome[index]['name']}',
                                img:'${Data.imagesForHome[index]['img']}' ,
                              ),
                            );
                          })
                      ),

                    )
 */
