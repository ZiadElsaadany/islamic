import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/color_constant.dart';
import '../../../../constants/style_constant.dart';
import '../../../../controller/provider/azkar_provider.dart';

class ZekrDetailsCard extends StatelessWidget {
  const ZekrDetailsCard({Key? key, required this.index}) : super(key: key);
final int index;
  @override
  Widget build(BuildContext context) {
    int args = ModalRoute.of(context)!.settings.arguments as int;
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(
        //<-- SEE HERE
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
          child: Column(
            children: [
              Text(
                '${ Provider.of<AzkarProvider>(context).azkarList[args]['azkar1'].length} / ${index +  1}',
                style: AppStyleConstant.style15WithPrimaryColorAndBold,

              ),
              Provider.of<AzkarProvider>(context).azkarList[args]['azkar1'][index]['adi1']!=null?         Text(
                Provider.of<AzkarProvider>(context).azkarList[args]['azkar1'][index]['adi1'],
                style: AppStyleConstant.style14WithGreyColor,
              ) : const SizedBox() ,
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              Text( Provider.of<AzkarProvider>(context).azkarList[args]['azkar1'][index]['adi'],
                  style: const TextStyle(
                      color: AppColorsConstant.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 22,
                    fontFamily: 'AmiriQuran-Regular.ttf'
                  )),
              const SizedBox(
                height: 4,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        )),
                        backgroundColor:
                        MaterialStateProperty.all(     Provider.of<AzkarProvider>(context).azkarList[args]['azkar1'][index]['number']==0?

                        Colors.red : AppColorsConstant.green)

                    ),
                    onPressed: ( ) {
                      Provider.of<AzkarProvider>(context,listen: false).changeCounterOfZekr(

                          index:index,
                          args: args
                      ) ;
                      Provider.of<AzkarProvider>(context,listen: false).setFinish(args: args);
                    } , child: Text(
                    '${Provider.of<AzkarProvider>(context).azkarList[args]['azkar1'][index]['number']}'
                )),
              )

            ],
          ),
        ),
      ),
    );
  }
}
