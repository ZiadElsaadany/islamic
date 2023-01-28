import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key, required this.widget}) : super(key: key);
final Widget widget;
  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      foregroundColor: Colors.black,
      expandedHeight:
      MediaQuery.of(context).size.height * 0.22,
      backgroundColor: Colors.transparent,
      // floating: false,
      //pinned: false,
      elevation: 0,
      flexibleSpace:
     widget
    );
  }
}