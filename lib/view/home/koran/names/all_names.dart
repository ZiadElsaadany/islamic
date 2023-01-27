import 'package:flutter/material.dart';
import 'package:islami/view/home/koran/names/name_widget.dart';

import '../../../../constants/sowar.dart';
import '../surah/surah_view.dart';

class AllNames extends StatelessWidget {
  const AllNames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    return SurahView(indx: index);
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
    );
  }
}
