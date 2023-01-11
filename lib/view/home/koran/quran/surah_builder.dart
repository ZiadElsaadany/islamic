import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/controller/provider/quran_provider.dart';
import 'package:provider/provider.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

class SurahBuilder extends StatefulWidget {
  final surah;
  final arabic;
  final surahName;
  int ayah;

  SurahBuilder({
    Key? key,
    this.surah,
    this.arabic,
    this.surahName,
    required this.ayah,
  }) : super(key: key);

  @override
  State<SurahBuilder> createState() => _SurahBuilderState();
}

class _SurahBuilderState extends State<SurahBuilder> {


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => jumbToAyah());
    super.initState();
  }

  jumbToAyah() {
    if (fabIsClicked) {
      itemScrollController.scrollTo(
        index: widget.ayah,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic,
      );
    }
    fabIsClicked = false;
  }

  saveBookMark(surah, ayah) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("surah", surah);
    await prefs.setInt("ayah", ayah);
  }

//
  Row verseBuilder(int index, previousVerses) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.arabic[index + previousVerses]['aya_text'],
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: arabicFontSize,
                  fontFamily: arabicFont,
                  color: const Color.fromARGB(196, 0, 0, 0),
                ),
              ),


      ],
    )  )  ] ) ;
  }

  SafeArea singleSuraBuilder(LenghtOfSurah) {
    String fullSura = "";
    int previousVerses = 0;
    try {
      Provider.of<KoranProvider>(context,listen: false).statusOfMushafView = true;
      if (widget.surah + 1 != 1) {
        for (int i = widget.surah - 1; i >= 0; i--) {
          previousVerses = previousVerses + noOfVerses[i];
        }
      }
      if (!Provider
          .of<KoranProvider>(context)
          .view) {
        for (int i = 0; i < LenghtOfSurah; i++) {
          fullSura += (widget.arabic[i + previousVerses]['aya_text']);
        }
      }
      Provider.of<KoranProvider>(context,listen: false).statusOfMushafView = false;

    }catch(e) {

      print (e.toString());
    }

    return SafeArea(
      child: Container(
          color: Color.fromARGB(255, 253, 251, 240),
          child: Provider.of<KoranProvider>(context).view
              ? ScrollablePositionedList.builder(
                  itemCount: LenghtOfSurah,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        (index != 0) ||
                                (widget.surah == 0) ||
                                (widget.surah == 8)
                            ? const Text("")
                            : const ReturnBasmalah(),
                        Container(
                          color: index % 2 != 0
                              ? const Color.fromARGB(255, 253, 251, 240)
                              : const Color.fromARGB(255, 253, 247, 230),
                          child: PopupMenuButton(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: verseBuilder(index, previousVerses),
                            ),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                onTap: () {
                                  saveBookMark(widget.surah + 1, index);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.bookmark_add,
                                      color: Color.fromARGB(255, 56, 115, 59),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "حفظ الأية",
                                      textDirection: TextDirection.rtl,
                                    )
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.share,
                                      color: Color.fromARGB(255, 56, 115, 59),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "مشاركه",
                                      textDirection: TextDirection.rtl,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                )
              :
          Provider.of<KoranProvider>(context,listen: false).statusOfMushafView ==true?
              Center(
                child: CircularProgressIndicator(
                  color: AppColorsConstant.primaryColor,
                ),
              ) :

        ListView(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.03,
                              ),
                              widget.surah + 1 != 1 && widget.surah + 1 != 9
                                  ? const ReturnBasmalah()
                                  : const Text(''),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.01,
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  fullSura,
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: musahfFontSize,
                                    fontFamily: arabicFont,
                                    color: Color.fromARGB(196, 44, 44, 55),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
    );
  }

  @override
  Widget build(BuildContext context) {
    int LengthOfSurah = noOfVerses[widget.surah];

    return
    SafeArea(
      child: Scaffold(
            appBar: AppBar(
              leading: Tooltip(
                message: 'Mushaf Mode',
                child: TextButton(
                  child: const Icon(
                    Icons.chrome_reader_mode,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Provider.of<KoranProvider>(context,listen: false).changeView(!Provider.of<KoranProvider>(context,listen: false).view);
                  },
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(icon:Icon( Icons.arrow_forward), onPressed: (){
                  Navigator.pop(context);
                },)
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
              backgroundColor:AppColorsConstant.primaryColor,
              foregroundColor: Colors.black,
              elevation: 0,
            ),
            body: singleSuraBuilder(LengthOfSurah),
          ),
    );
  }
}

class ReturnBasmalah extends StatelessWidget {
  const ReturnBasmalah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ ',
        style: TextStyle(
          fontFamily: "me_quran",
          fontSize: 25,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
