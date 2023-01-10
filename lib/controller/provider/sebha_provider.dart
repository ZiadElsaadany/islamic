import 'package:flutter/material.dart';

class SebhaProvider  extends ChangeNotifier{
double angle  = 0 ;
  changeAngle ( )  {
    angle  +=15;
    notifyListeners();
  }


  int counter = 0 ;
  int index = 0;
  List<String> tasbehList=['سبحان الله','الحمدلله','الله أكبر','لا اله الا الله','لا حول ولا قوةالا بالله'] ;
  void sebhaName(){
    counter ++ ;
    if(counter %33== 0){
      index++ ;
    }
    if(counter%165== 0){
      index= 0 ;
    }
  notifyListeners() ;
  }

  zero( )  {
    counter = 0 ;
    index= 0 ;
    notifyListeners();
  }

}