import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Future<Database> get database async {
    final String path = join(await getDatabasesPath(), 'space_parking.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS user (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            password TEXT,
            otp TEXT,
            is_verified INTEGER DEFAULT 0
          )
        ''');
      },
    );
  }
}
