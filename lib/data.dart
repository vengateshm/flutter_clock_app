import 'constants/theme_data.dart';
import 'enums.dart';
import 'menu_info.dart';
import 'models/alarm_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.CLOCK,
      title: 'Clock', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.ALARM,
      title: 'Alarm', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.TIMER,
      title: 'Timer', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.STOPWATCH,
      title: 'Stopwatch', imageSource: 'assets/clock_icon.png')
];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)),
      description: 'Office', gradientColors: GradientColors.sky),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)),
      description: 'Sport', gradientColors: GradientColors.sunset),
];