import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'productivity.db');
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT, priority TEXT)");
    await db.execute(
        "CREATE TABLE habits(id INTEGER PRIMARY KEY, name TEXT, streak INTEGER)");
    await db.execute(
        "CREATE TABLE moods(id INTEGER PRIMARY KEY, date TEXT, mood TEXT)");
  }
}