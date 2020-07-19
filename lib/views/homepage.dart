import 'package:flutter/material.dart';
import 'package:flutter_change_notifier_sample/constants/theme_data.dart';
import 'package:flutter_change_notifier_sample/views/alarm_page.dart';
import 'package:provider/provider.dart';
import '../data.dart';
import '../enums.dart';
import '../menu_info.dart';
import 'clock_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItems
                  .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                  .toList(),
            ),
            VerticalDivider(color: Colors.white54, width: 1),
            Expanded(
              child: Consumer<MenuInfo>(builder:
                  (BuildContext context, MenuInfo value, Widget child) {
                if (value.menuType == MenuType.CLOCK)
                  return ClockPage();
                else if (value.menuType == MenuType.ALARM)
                  return AlarmPage();
                else
                  return Container();
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget child) {
        return FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
          color: currentMenuInfo.menuType == value.menuType
              ? CustomColors.menuBackgroundColor
              : Colors.transparent,
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenuInfo(currentMenuInfo);
          },
          child: Column(
            children: <Widget>[
              Image.asset(
                currentMenuInfo.imageSource,
                scale: 1.5,
              ),
              SizedBox(height: 16),
              Text(
                currentMenuInfo.title,
                style: TextStyle(
                    fontFamily: 'avenir', color: Colors.white, fontSize: 14),
              )
            ],
          ),
        );
      },
    );
  }
}
