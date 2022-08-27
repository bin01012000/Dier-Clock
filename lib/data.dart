import 'package:dier_clock/constants/theme_data.dart';
import 'package:dier_clock/enums.dart';
import 'package:dier_clock/models/alarm_info.dart';
import 'package:dier_clock/models/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: 'Clock', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: 'Alarm', imageSource: 'assets/alarm_icon.png'),
  MenuInfo(MenuType.timer,
      title: 'Timer', imageSource: 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,
      title: 'Stopwatch', imageSource: 'assets/stopwatch_icon.png'),
];

List<AlarmInfo> alarmItems = [
  AlarmInfo(
      title: 'Office',
      isPending: false,
      alarmDateTime: DateTime.now(),
      gradientColorIndex: 1),
  AlarmInfo(
      title: 'Office',
      isPending: false,
      alarmDateTime: DateTime.now(),
      gradientColorIndex: 1),
];
