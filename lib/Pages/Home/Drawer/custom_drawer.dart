import 'package:flutter/material.dart';
import 'package:pos/Pages/Home/Drawer/drawerConst.dart';
import 'package:pos/Utils/colors.dart';
import 'drawer_header.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomDrawer extends StatefulWidget {
  final currentPage;

  CustomDrawer({Key? key, required this.currentPage}) : super(key: key);

  @override
  _CustomDrawerState createState() {
    return _CustomDrawerState();
  }
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  void initState() {
    super.initState();
    currentPage = widget.currentPage;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  var currentPage = DrawerSections.home;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: MyDrawerList(),
          ),
        ],
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(0),
        //shrinkWrap: true,
        // shows the list of menu drawer
        children: [
          MyHeaderDrawer(),
          SizedBox(
            height: 12,
          ),
          menuItem(DrawerConsts.home, "home".tr(), Icons.dashboard_outlined,
              currentPage == DrawerSections.home ? true : false),
          menuItem(
              DrawerConsts.setting,
              "settings1".tr(),
              Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          Divider(color: helperColor),
          menuItem(DrawerConsts.contact, "contact_us".tr(), Icons.call,
              currentPage == DrawerSections.contact ? true : false),
          menuItem(DrawerConsts.lang, "changelang".tr(), Icons.language,
              currentPage == DrawerSections.lang ? true : false),
          Divider(color: helperColor),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? primaryColor : Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black, fontSize: 16, fontFamily: sofia),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  changeScreen(var page) async {}

  changeToPage(var page) {}
}

enum DrawerSections {
  home,
  settings,
  import_data,
  contact,
  lang,
  statistics,
  control,
  clearData,
  printer
}
