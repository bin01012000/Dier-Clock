import 'package:dier_clock/models/alarm_info.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

const String tableAlarm = 'alarm';
const String columnId = 'id';
const String columnTitle = 'title';
const String columnDateTime = 'alarmDateTime';
const String columnPending = 'isPending';
const String columnColorIndex = 'gradientColorIndex';

class AlarmHelper {
  static Database? _database;
  static AlarmHelper? _alarmHelper;

  AlarmHelper._createInstance();

  factory AlarmHelper() {
    return _alarmHelper ??= AlarmHelper._createInstance();
  }

  Future<Database> get database async {
    return _database ??= await initializeDataBase();
  }

  static Future<Database> initializeDataBase() async {
    var dir = await getDatabasesPath();
    String path = p.join(dir, "alarm.db");
    await deleteDatabase(path);

    var database =
        openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE $tableAlarm (
          $columnId integer primary key autoincrement,
          $columnTitle text not null,
          $columnDateTime text not null,
          $columnPending integer,
          $columnColorIndex integer)
        ''');
    });
    return database;
  }

  void insertAlarm(AlarmInfo alarmInfo) async {
    var db = await database;
    var res = await db.insert(tableAlarm, alarmInfo.toMap());
    print('result: $res');
  }

  Future<List<AlarmInfo>> getAlarms() async {
    List<AlarmInfo> _alarms = [];
    var db = await database;
    var res = await db.query(tableAlarm);

    for (var el in res) {
      var alarmInfo = AlarmInfo.fromMap(el);
      _alarms.add(alarmInfo);
    }

    return _alarms;
  }

  Future<int> delete(int id) async {
    var db = await database;
    return await db.delete(tableAlarm, where: '$columnId = ?', whereArgs: [id]);
  }
}
