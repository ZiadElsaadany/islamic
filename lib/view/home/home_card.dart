import 'package:flutter/material.dart';
import 'package:islami/constants/style_constant.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.txt , required this.img}) : super(key: key);
final String img ;
final String txt ;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        //set border radius more than 50% of height and width to make circle
      ),
      child: Column (
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          Expanded(
              flex:3,
              child: Image.asset(img)) ,

          const Spacer(),
          Expanded(
            flex: 2,
            child: Text(txt ,
          style:AppStyleConstant.style18WithPrimaryColor.copyWith(
            fontFamily: 'cairo',
            fontSize: 17,
            color: Colors.black.withOpacity(0.4),
            fontWeight: FontWeight.w600
          ),
          ) ,

          ) ,
          const SizedBox(height: 5,),
        ],
      ),
    );
  }
}
