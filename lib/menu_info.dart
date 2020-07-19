import 'package:flutter/foundation.dart';

import 'enums.dart';

class MenuInfo extends ChangeNotifier{
  String title;
  String  imageSource;
  MenuType menuType;

  MenuInfo(this.menuType, {this.title, this.imageSource});

  updateMenuInfo(MenuInfo menuInfo){
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.imageSource= menuInfo.imageSource;

    notifyListeners();
  }
}