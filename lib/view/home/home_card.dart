import 'package:flutter/material.dart';
import 'package:islami/constants/style_constant.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.txt , required this.img}) : super(key: key);
final String img ;
final String txt ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
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
      ),
    );
  }
}
