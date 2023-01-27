import 'package:flutter/material.dart';
import 'package:islami/view/home/koran/names/name_widget.dart';
import 'package:provider/provider.dart';

import '../../../../controller/provider/quran_provider.dart';
import '../surah/surah_view.dart';


class NamesFromSearch extends StatelessWidget {
  const NamesFromSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                          return SurahView(indx:
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
    );
  }
}
