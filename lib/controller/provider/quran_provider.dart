import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/constants/sowar.dart';

import '../../constants/data.dart';
import '../../view/home/koran/quran/constant.dart';

class KoranProvider extends ChangeNotifier {
  List<Map<String, dynamic>> lst = [];
bool search =false;
  bool view = true;
  bool statusOfMushafView = true;
  Map<String, Map<String, dynamic>> lstSearch = {};

  getNameOfKoran({required String word}) {
    print('search');
    changeSearchState(state: true);
    lst=[];
    notifyListeners();
    for (int i = 0; i < lstSearch.length; i++) {
      if (lstSearch.keys.toList()[i].contains(word)) {
        lst.add(lstSearch.values.toList()[i]);
        notifyListeners();
      }
    }
    log(lst.toString());
    notifyListeners();
    print('search done');
  }

  changeSearchState({required bool state}){
    search = state;
    notifyListeners();
  }

  makeList() {
    // lstSearch = { } ;
    print('search');
    for (int i = 0; i < Sowar.sowar['sowar']!.length; i++) {
      lstSearch
          .addAll({Sowar.sowar['sowar']![i]['name']: Sowar.sowar['sowar']![i]});
      notifyListeners();
    }
  }
 // clean
  List arabicQuranList = [];
  bool c = true ;
late  int  lengthOfSurah   ;
  int previousVerses = 0;

  Future readJson() async{
    c= true ;
    notifyListeners();
    final String response = await rootBundle.loadString("assets/hafs_smart_v8.json");
    final data = json.decode(response);
    c= false;
    notifyListeners();
    arabicQuranList = data['quran'];
    notifyListeners();
  }
bool  s =false;
 showAya( index) {
previousVerses= 0;
s = true ;

   notifyListeners() ;
   if (index+ 1 != 1) {
    for (int i = index - 1; i >= 0; i--) {
      previousVerses =previousVerses  +  noOfVerses[i];
    }
  }
  s= false;

notifyListeners();
}


}
