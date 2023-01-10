import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart' ;
import 'package:http/http.dart' as http;
import 'package:islami/models/praying_time_model.dart';

import '../../view/shared/toast.dart';
class PrayingApi extends ChangeNotifier {
bool isGetTime = false;
String ?  timeOfSalah;
int  hourOfNextSalah  = 0   ;
int ? minuteOfNextSalah    ;
PrayingTimeModel  ? salahTime ;
Map  jsonRes = { };
List<int> lstSalahHours = [ ];
List<int> lstSalahMinute = [ ];

   getTimeApi ( )  async{
      try {
         isGetTime =true;
         notifyListeners();
         http.Response res = await http.get(
             Uri.parse(
                 'http://api.aladhan.com/v1/timingsByCity?city=tanta&country=Egypt&method=8')
         );
         if(res.statusCode== 200 ) {
            print (json.decode(res.body)) ;
          salahTime =   PrayingTimeModel.frmojson(json.decode(res.body));
          jsonRes= json.decode(res.body) ;
          lstSalahHours.addAll([
            int.parse(salahTime!.fajr!.split(":")[0]),
            int.parse(  salahTime!.dhuhr!.split(":")[0] ) ,
            int.parse(  salahTime!.asr!.split(":")[0] )  ,
            int.parse(  salahTime!.maghrib!.split(":")[0] ),
            int.parse(  salahTime!.isha!.split(":")[0] )
          ]);
          lstSalahMinute.addAll([

            int.parse(salahTime!.fajr!.split(":")[1]),
            int.parse(  salahTime!.dhuhr!.split(":")[1] ) ,
            int.parse(  salahTime!.asr!.split(":")[1] )  ,
            int.parse(  salahTime!.maghrib!.split(":")[1] ),
            int.parse(  salahTime!.isha!.split(":")[1] )
          ] );
          print (lstSalahHours);

            isGetTime= false;
            notifyListeners() ;
         }else {
           Shared.returnToast('حدثت مشكلة ما بالرجاء اعادة المحاولة')   ;
           notifyListeners()  ;
         }
      }on SocketException{
Shared.returnToast('لا يوجد اتصال بالانترنت')   ;
         notifyListeners() ;
      }
      catch (E) {
         print (E.toString()) ;
         Shared.returnToast('حدثت مشكلة ما بالرجاء اعادة المحاولة')   ;
      notifyListeners()  ;
      }




   }

   getPrayingName (  )  {
   if( DateTime.now().hour <  lstSalahHours[0]  ) {
     timeOfSalah =  salahTime!.fajr;
       return 'الفجر';

   } else if( DateTime.now().hour <  lstSalahHours[1]  )  {



     timeOfSalah =  salahTime!.dhuhr;
     return 'الظهر';
   }
   else if( DateTime.now().hour < lstSalahHours[2]  )  {



     timeOfSalah =  salahTime!.asr;
     return 'العصر';
   }else if( DateTime.now().hour < lstSalahHours[3] )  {


     timeOfSalah =  salahTime!.maghrib;
     return 'المغرب';
   }else if( DateTime.now().hour < lstSalahHours[4] )  {

     timeOfSalah =  salahTime!.isha;
     return 'العشاء';
   }else{

     timeOfSalah =  salahTime!.fajr;
     return 'الفجر';
   }
   }

    timeForNextPrayingFun ( int hourForNextSalah) {
     int num = 24 -  DateTime.now().hour  ;

      // hourOfNextSalah = num + hourOfNextSalah;
     // notifyListeners() ;
   }

notifyListeners();


}
// 5  + 3