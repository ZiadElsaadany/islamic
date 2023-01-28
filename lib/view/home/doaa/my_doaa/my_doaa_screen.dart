import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/constants/color_constant.dart';
import 'package:islami/constants/images_constant.dart';
import 'package:islami/constants/style_constant.dart';
import 'package:islami/view/home/doaa/custom_text_form_Filed_doaa.dart';
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                      ),
                      context: context,
                      isScrollControlled: true,
                      // backgroundColor: Colors.transparent,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            color: const Color.fromRGBO(0, 0, 0, 0.001),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: SingleChildScrollView(

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.remove,
                                      color: Colors.grey[600],
                                    ),
                                    Text('اضافة دعاء جديد' ,
                                    style: AppStyleConstant.style20WithBlackColor,
                                      textAlign: TextAlign.center,
                                    ),
                                    const CustomTextFieldDoaa(hint: 'اسم الدعاء'),

                                const CustomTextFieldDoaa(hint: 'كلمات الدعاء',mxLine:3,),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColorsConstant.primaryColor
                ),
                child: Text('اضافة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22
                ),
                ),
              ),
            )

                                  ],
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
