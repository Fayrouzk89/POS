import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pos/Utils/colors.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      width: double.infinity,
     // height: CustomSizeConfig().screenWidth*0.3+50,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: MediaQuery.of(context).size.width*0.2+50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white,width: 10),
              image: DecorationImage(
                image: AssetImage('assets/images/shop.jpg'),
              ),
            ),
          ),
          Text(
            "app_name".tr(),
            style: TextStyle(color: helperColor, fontSize:20,fontFamily: sofia),
          ),
          SizedBox(height: 12,),
        ],
      ),
    );
  }

}