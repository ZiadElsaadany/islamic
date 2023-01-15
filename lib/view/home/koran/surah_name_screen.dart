import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/constants/images_constant.dart';
import 'package:islami/constants/sowar.dart';
import 'package:islami/controller/provider/quran_provider.dart';
import 'package:islami/view/home/koran/koran_display_screen.dart';
import 'package:islami/view/home/koran/surah_name_display.dart';
import 'package:provider/provider.dart';
class SurahNameScreen extends StatelessWidget {
  const SurahNameScreen({Key? key}) : super(key: key);
  static const String id = 'SurahNameScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            ImageConstant.bg,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                foregroundColor: AppColorsConstant.black,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.04,
                  left: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        onChanged: (value) {
                          Provider.of<KoranProvider>(context, listen: false)
                              .getNameOfKoran(word: value);
                        },
                        decoration: InputDecoration(
                          iconColor: Colors.black,
                          icon: const Icon(Icons.search,
                          color: AppColorsConstant.primaryColor,
                            size: 30,
                          ),

                          hintText: 'ابحث   عن   السورة   التي   تريدها...',
                          hintStyle:  const TextStyle(
                            color: AppColorsConstant.grey,
                            // fontWeight: FontWeight.bold,
                            fontFamily: 'me_quran.ttf',
                            fontSize: 14,
                          ),
                         // suffixIcon: const Icon(Icons.search,
                         //      size: 30, color: AppColorsConstant.primaryColor),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: AppColorsConstant.grey,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: AppColorsConstant.primaryColor,
                              )),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.02,
                    // ),
                    !Provider.of<KoranProvider>(context).search
                        ? Expanded(
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListView.separated(
                                separatorBuilder: (ctx, index) =>
                                const SizedBox(
                                  height: 8,
                                ),
                                physics: const BouncingScrollPhysics(),
                                itemCount: 114,
                                itemBuilder: (ctx, index) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (ctx) {
                                      return KoranScreen(indx: index);
                                    }));
                                  },
                                  child: SurahNameDisplay(
                                    index:Sowar.sowar['sowar']![index]['verses'][0]['surah_number'],
                                    num: Sowar.sowar['sowar']![index]['ayat'],
                                    place: Sowar.sowar['sowar']![index]['place'],
                                    surahName: Sowar.sowar['sowar']![index]['name'],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Provider.of<KoranProvider>(context).lst.isNotEmpty?Expanded(
                            child: Consumer<KoranProvider>(
                                builder: (context, provider, _) {
                              return Directionality(
                                textDirection: TextDirection.rtl,
                                child: ListView.separated(
                                  separatorBuilder: (ctx, index) =>
                                      const SizedBox(
                                    height: 8,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: provider.lst.length,
                                  itemBuilder: (ctx, index) => GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (ctx) {
                                        return KoranScreen(indx:
                                        provider.lst[index]['verses'][0]['surah_number']-1
                                        );
                                      }));
                                    },
                                    child: SurahNameDisplay(
                                      index: provider.lst[index]['verses'][0]['surah_number'],
                                      num: provider.lst[index]['ayat'],
                                      place: provider.lst[index]['place'],
                                      surahName: provider.lst[index]['name'],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ):
                      Expanded(child: Image.asset('assets/images/bg3.png'))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
