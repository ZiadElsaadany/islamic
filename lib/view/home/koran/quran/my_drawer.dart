import 'package:flutter/material.dart';
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
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Image.asset(
                    "assets/icons/koran.png",
                    height: 80.0,
                  ),
                 const SizedBox(height: 10,),
                  const Text(
                    "اسلامي",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                "الاعدادت",
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
              leading: const Icon(Icons.share),
              title: const Text(
                "مشاركة التطبيق",
              ),
              onTap: () {
              // Share.share(
              //
              // );
              },
            ),
            ListTile(
              leading: const Icon(Icons.rate_review),
              title: const Text(
                "تقييم التطبيق",
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
