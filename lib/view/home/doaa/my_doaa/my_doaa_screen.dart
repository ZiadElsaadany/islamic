import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/constants/images_constant.dart';
import 'package:islami/constants/style_constant.dart';
import 'package:islami/view/home/doaa/my_doaa/add_Doaa_widget.dart';

class MyDoaa extends StatelessWidget {
  const MyDoaa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column
        (

        children: [
          Padding(
            padding:   EdgeInsets.only(       left:MediaQuery.of(context).size.height*0.02,
      right: MediaQuery.of(context).size.height*0.02,
      top: MediaQuery.of(context).size.height*0.02,
      bottom: MediaQuery.of(context).size.height*0.05
            ) ,
            child: Row(
              children: [
                GestureDetector(
                  child: Icon(
                   Icons.add,
                    color: AppColorsConstant.primaryColor,

                  ),
                  onTap: (){
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      // backgroundColor: Colors.transparent,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            color: Color.fromRGBO(0, 0, 0, 0.001),
                            child: GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                child: SingleChildScrollView(

                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.remove,
                                        color: Colors.grey[600],
                                      ),
                                      Text('اضافة دعاء جديد' ,
                                      style: AppStyleConstant.style20WithBlackColor,
                                        textAlign: TextAlign.center,
                                      ),
                                       Text('اسم الدعاء'),
                                       TextFormField(
                                         maxLines: 1,
                                       ),
                                       Text('كلمات الدعاء'),
                                       TextFormField(
                                         maxLines: 3,
textDirection: TextDirection.rtl,

                                       ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Image.asset(ImageConstant.noDoaa),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          Text('لم تقم باضافة اى ادعية جديدة',
          style:TextStyle(
            color:AppColorsConstant.black,
            fontSize: MediaQuery.of(context).size.width*0.045,

          ),
          )
        ],
      ),
    );
  }
}
