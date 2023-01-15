import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/view/home/koran/quran/settings.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Image.asset(
              "assets/images/Screenshot (1).png",
              height: MediaQuery.of(context).size.height*0.2,
            ),
               const SizedBox(height: 10,),
            const Text(
              "اسلامي",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            ListTile(
              leading: const Icon(Icons.settings,color: AppColorsConstant.primaryColor,),
              title: const Text(
                "الاعدادت",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.share,color: AppColorsConstant.primaryColor,),
              title: const Text(
                "مشاركة التطبيق",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),
              ),
              onTap: () {
              // Share.share(
              //
              // );
              },
            ),
            ListTile(
              leading: const Icon(Icons.rate_review, color: AppColorsConstant.primaryColor,),
              title: const Text(
                "تقييم التطبيق",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),
              ),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const SettingsScreen(),
                //   ),
                //
              },
            ),
          ],
        ),
      ),
    );
  }
}
