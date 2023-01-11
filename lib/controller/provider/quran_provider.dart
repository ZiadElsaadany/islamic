import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:islami/constants/sowar.dart';

import '../../constants/data.dart';

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


  changeView( bool check1)  {
    view = check1 ;
    notifyListeners() ;
  }

}
