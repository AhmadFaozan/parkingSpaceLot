import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  late Database _database;
  late String _path;

  Future<void> _createDatabase() async {
    _path = join(await getDatabasesPath(), 'space_parking');
    _database = await openDatabase(
      _path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE user (id INTEGER PRIMARY KEY, is_verified INTEGER)',
        );
      },
    );
  }

  Future<void> updateIsVerifiedInDatabase() async {
    await _createDatabase();

    final List<Map<String, dynamic>> records = await _database.query('user');
    if (records.isNotEmpty) {
      final int id = records[0]['id'];
      final int isVerified = 1; // Update the value to 1 for verification

      await _database.update(
        'user',
        {'is_verified': isVerified},
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }

  verifyOtp(String otp) {}

  static updateVerificationStatus({required bool isVerified}) {}
}
