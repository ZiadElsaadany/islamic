import 'package:flutter/material.dart';

class ReturnImage extends StatelessWidget {
  const ReturnImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/bg3.png',
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    );
  }
}