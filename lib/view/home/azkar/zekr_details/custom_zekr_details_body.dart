import 'package:flutter/material.dart';
import 'package:islami/view/home/azkar/zekr_details/zekr_details_card.dart';
import 'package:provider/provider.dart';

import '../../../../controller/provider/azkar_provider.dart';

class CustomZekrDetailsBody extends StatelessWidget {
  const CustomZekrDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int args = ModalRoute.of(context)!.settings.arguments as int;

    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount:  Provider.of<AzkarProvider>(context).azkarList[args]['azkar1'].length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child:ZekrDetailsCard(index: index) ,
          );
        });
  }
}
