import 'package:flutter/material.dart';

class ReturnImage extends StatelessWidget {
  const ReturnImage({Key? key, required this.img}) : super(key: key);


  final String img ;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
     img,
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    );
  }
}