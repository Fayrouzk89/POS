import 'package:flutter/material.dart';
import 'package:pos/Utils/colors.dart';
import 'package:pos/Utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double barHeight = 50.0;
  MainAppBar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight );
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: AppBar(
            elevation: 0,
            backgroundColor: bgColor,
            leading: Container(),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                      size: 26.0,
                    ),
                  )),
            ],
            leadingWidth: 0,
            primary: true,
            title: Text(
              'app_name'.tr(),
              style: h3,
            )),
        preferredSize: Size.fromHeight(kToolbarHeight));
  }
}



