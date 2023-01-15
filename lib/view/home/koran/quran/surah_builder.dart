import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/controller/provider/quran_provider.dart';
import 'package:provider/provider.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'constant.dart';
class SurahBuilder extends StatefulWidget {
  final surah;

  final surahName;

  const SurahBuilder({
    Key? key,
    this.surah, // index of surahName

    this.surahName, // surah name
  }) : super(key: key);

  @override
  State<SurahBuilder> createState() => _SurahBuilderState();
}

class _SurahBuilderState extends State<SurahBuilder> {

  @override
  void initState() {
    Future.delayed(Duration.zero,()async {
      Provider
          .of<KoranProvider>(context, listen: false).showAya(widget.surah);
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: const SizedBox(),
            actions: [
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
            title: Text(
             widget.surahName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: 'quran',
              ),
            ),
            backgroundColor: AppColorsConstant.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          body:Provider.of<KoranProvider>(context).s ||Provider.of<KoranProvider>(context).previousVerses  == 0   ?  const Center(
            child: CircularProgressIndicator(),
          ): Container(
                  color: const Color.fromARGB(255, 253, 251, 240),
                  child: ListView.builder(
                    itemCount: noOfVerses[widget.surah],
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          (index != 0) ||
                              (widget.surah == 0) ||
                              (widget.surah == 8)
                              ? const Text("")
                              : const Center(
                            child: Text(
                              'بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ ',
                              style: TextStyle(
                                fontFamily: "me_quran",
                                fontSize: 25,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          Container(
                            color: index % 2 != 0
                                ? const Color.fromARGB(255, 253, 251, 240)
                                : const Color.fromARGB(255, 253, 247, 230),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      Provider
                                          .of<KoranProvider>(context, listen: false)
                                          .arabicQuranList[index +
                                          Provider.of<KoranProvider>(context)
                                              .previousVerses]['aya_text'],
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontSize: arabicFontSize,
                                        fontFamily: arabicFont,
                                        color: const Color.fromARGB(
                                            196, 0, 0, 0),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      );
                    },
                  )
              )



              ),
    );
  }
}
