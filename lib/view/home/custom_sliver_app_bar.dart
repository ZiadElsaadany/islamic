import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      expandedHeight:
      MediaQuery.of(context).size.height * 0.22,
      backgroundColor: Colors.transparent,
      // floating: false,
      //pinned: false,
      elevation: 0,
      flexibleSpace:
      Image.asset('assets/images/Screenshot (1).png'),
    );
  }
}