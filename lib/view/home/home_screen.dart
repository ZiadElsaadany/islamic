import 'package:flutter/material.dart';
import 'package:islami/controller/provider/quran_provider.dart';
import 'package:islami/view/home/home_screen_body.dart';
import 'package:islami/view/home/return_image.dart';
import 'package:provider/provider.dart';
import 'custom_sliver_app_bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<KoranProvider>(context, listen: false).makeList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            const ReturnImage( img :'assets/images/bg3.png'),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: NestedScrollView(
             body:  const CustomHomeScreenBody(),
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                    const CustomSliverAppBar()
                    ];
                  },)




                ) ,
              ),

          ],
        ),
      ),
    );
  }


}





