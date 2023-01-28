import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:provider/provider.dart';

import '../../../animation/fade_animation.dart';
import '../../../controller/provider/sebha_provider.dart';

class SebhaImage extends StatelessWidget {
  const SebhaImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FadeAnimation(1.3, child:
    Stack(
      alignment: Alignment.center,
      children: [
 Positioned
  (
    bottom: MediaQuery.of(context).size.height*0.14,
    child: const Icon(Icons.fingerprint_sharp, size: 40, color: AppColorsConstant.grey)),
        Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
          child: GestureDetector(
            onTap: ( )  {
              Provider.of<SebhaProvider>(context,listen: false).changeAngle();
              Provider.of<SebhaProvider>(context,listen: false).sebhaName();
            },
            child: Transform.rotate(
                angle: Provider.of<SebhaProvider>(context).angle,
                child: const Image(image: AssetImage("assets/images/sebha_images/body of seb7a.png"))),
          ),
        ),

      ],
    )
    );
  }
}
