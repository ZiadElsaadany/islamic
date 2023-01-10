import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/constants/style_constant.dart';
import 'package:islami/controller/provider/doaa_provider.dart';
import 'package:provider/provider.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height*0.07,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColorsConstant.primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*0.035,),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Provider.of<DoaaProvider>(context, listen: false).changeCheck(state: true);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Provider.of<DoaaProvider>(context).checkClick
                      ? AppColorsConstant.primaryColor
                      : Colors.transparent,
                  borderRadius: Provider.of<DoaaProvider>(context).checkClick
                      ?  BorderRadius.circular( MediaQuery.of(context).size.height*0.035,)
                      : null,
                ),
                child: Text('الادعية',
                  style: AppStyleConstant.style20WithWhiteColor,

                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Provider.of<DoaaProvider>(context, listen: false).changeCheck(state: false);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: !Provider.of<DoaaProvider>(context).checkClick
                      ? AppColorsConstant.primaryColor
                      : Colors.transparent,
                  borderRadius: !Provider.of<DoaaProvider>(context).checkClick
                      ?  BorderRadius.circular( MediaQuery.of(context).size.height*0.035,)
                      : null,
                ),
                child: Text('دعائي',
                  style:AppStyleConstant.style20WithWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
