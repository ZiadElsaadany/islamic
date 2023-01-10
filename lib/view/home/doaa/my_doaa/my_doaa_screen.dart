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
      child: Column(

        children: [
          Padding(
            padding:   EdgeInsets.only(       left:MediaQuery.of(context).size.height*0.02,
      right: MediaQuery.of(context).size.height*0.02,
      top: MediaQuery.of(context).size.height*0.02,
      bottom: MediaQuery.of(context).size.height*0.05
            ) ,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.03),
                  border: Border.all(color: AppColorsConstant.primaryColor)
                ),
                  // alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: Icon(
                     Icons.add,
                      color: AppColorsConstant.primaryColor,

                    ),
                    onTap: (){
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: false,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              color: Color.fromRGBO(0, 0, 0, 0.001),
                              child: GestureDetector(
                                onTap: () {},
                                child: DraggableScrollableSheet(
                                  initialChildSize: 0.8,
                                  minChildSize: 0.8,
                                  maxChildSize: 0.8,
                                  builder: (_, controller) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(25.0),
                                          topRight: const Radius.circular(25.0),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.remove,
                                            color: Colors.grey[600],
                                          ),
                                          Expanded(
                                            child: ListView(
                                            controller: controller,
                                              children: [
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
                                                  maxLines: 4,
                                                ),

                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
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
