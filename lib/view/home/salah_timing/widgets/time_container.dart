import 'package:flutter/material.dart';
import '../../../../constants/style_constant.dart';


class TimeContainer extends StatelessWidget {
  const TimeContainer({Key? key,

  required this.img,
    required this.salahName ,
    required this.salahTime
  }) : super(key: key);
final String img ;
final String salahName ;
final String salahTime ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(

       horizontal:MediaQuery.of(context).size.height*0.03,
       vertical:MediaQuery.of(context).size.height*0.004,
      ),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          //set border radius more than 50% of height and width to make circle
        ),
        child: Padding(
          padding:  EdgeInsets.all(
            MediaQuery.of(context).size.height*0.02
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset( img) ,
              Text(salahName,
style:AppStyleConstant.style18WithPrimaryColor

              ),
              Text(salahTime,
                style:AppStyleConstant.style18WithPrimaryColor.copyWith(
                    fontWeight: FontWeight.w400,
                  fontSize: 16
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
