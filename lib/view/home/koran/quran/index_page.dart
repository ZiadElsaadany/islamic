import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../constants/color_constant.dart';
import '../../../../constants/images_constant.dart';
import 'arabic_surah_number.dart';

import 'my_drawer.dart';
import 'surah_builder.dart';
import 'constant.dart';


Future readJson() async{
  final String response = await rootBundle.loadString("assets/hafs_smart_v8.json");
  final data = json.decode(response);
  arabic = data['quran'];
  malayalam = data['malayalam'];
  return quran = [arabic,malayalam];
}


List arabic = [];
List malayalam = [];
List quran = [];



class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      await readJson();
      await getSettings();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            ImageConstant.bg2,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Scaffold(
            backgroundColor: AppColorsConstant.primaryColor,
            floatingActionButton: FloatingActionButton(
              tooltip: 'Go to bookmark',
              child: const Icon(Icons.bookmark),
              backgroundColor: Colors.green,
              onPressed: () async {
                fabIsClicked = true;
                if (await readBookMark() == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SurahBuilder(
                            arabic: quran[0],
                            surah: bookMarkedSurah - 1,
                            surahName: arabicName[bookMarkedSurah - 1]['name'],
                            ayah: bookMarkedAyah,

                          )));
                }
              },
            ),
            appBar: AppBar(
              foregroundColor: Colors.black,
              leading: const SizedBox(),
              elevation: 0,
              actions: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                } , icon: Icon( Icons.arrow_forward) )
              ],
              centerTitle: true,
              title: const Text(
                //"القرآن",
                "القرآن الكريم",
                style: TextStyle(
                  //fontFamily: 'quran',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(0.1, 0.1),
                        blurRadius: 1.0,
                        color: Color.fromARGB(254, 0, 0, 0),
                      ),
                    ]),
              ),
              backgroundColor:  Colors.transparent
            ),
            body: FutureBuilder(
              future: readJson(),
              builder: (
                  BuildContext context,
                  AsyncSnapshot snapshot,
                  ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(
                    color: AppColorsConstant.white,
                  ));
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else if (snapshot.hasData) {
                    return indexCreator(snapshot.data, context);
                  } else {
                    return const Text('Empty data');
                  }
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Container indexCreator(quran, context) {
    return Container(
      // color: const Color.fromARGB(255, 221, 250, 236),
      child: ListView(
        children: [
          for (int i = 0; i < 114; i++)
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: i % 2 == 0
                    ? Colors.white.withOpacity(0.8)
                    : const Color.fromARGB(255, 253, 251, 240),
              ),

              child: TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ArabicSurahNumber(i: i),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                        ],
                      ),
                    ),
                    SizedBox(),
                    Text(
                      arabicName[i]['name'],
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontFamily: 'quran',
                          shadows: [
                            Shadow(
                              offset: Offset(.1, .1),
                              blurRadius: 1.0,
                              color: Color.fromARGB(255, 130, 130, 130),
                            )
                          ]),
                      textDirection: TextDirection.rtl,
                    ),

                    const ImageIcon(
                      AssetImage(
                        ImageConstant.itar,
                      ),
                      size: 50,
                      color: AppColorsConstant.primaryColor,

                    ),
                  ],
                ),
                onPressed: () {
                  fabIsClicked = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SurahBuilder(
                          arabic: quran[0],
                          surah: i,
                          surahName: arabicName[i]['name'],
                          ayah: 0,
                        )),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }


}
