import 'package:flutter/material.dart';
import 'package:islami/view/home/azkar/azkar_names/zekr_card.dart';
import '../zekr_details/azkar_details_view.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(
          bottom:  MediaQuery.of(context).size.height * 0.05,
          top: MediaQuery.of(context).size.height * 0.04,
          left: MediaQuery.of(context).size.height * 0.04,
          right: MediaQuery.of(context).size.height * 0.04
      ),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (ctx,index) {
            return const SizedBox(height: 10,);
          } ,

          itemCount: 7,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: ( )  {
                Navigator.pushNamed(context, AzkarDetailsScreen.id,
                    arguments:  index
                );
              }  ,
              child: CustomZekrCard(index: index),
            );
          }),
    );
  }
}
