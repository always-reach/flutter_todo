import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static const _databaseName = "sample.dbb";
  static const _databaseVersion = 4;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    var currentDB = _database;
    currentDB ??= await _initDatabase();
    return currentDB;
  }

  Future<Database> _initDatabase() async {
    final dbDirectory = await getApplicationSupportDirectory();
    final dbFilePath = dbDirectory.path;
    final path = join(dbFilePath, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUPgrade);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        isComplete INTEGER NOT NULL,
        point INTEGER NOT NULL,
        taskType INTEGER NOT NULL,
        atComplete TEXT
      );
      CREATE TABLE rewords(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        point INTEGER NOT NULL
      );
      CREATE TABLE points(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        point INTEGER NOT NULL
      );
    ''');
    await db.insert("points", {"point": 0});
  }

  Future _onUPgrade(Database db, int oldVersion, int newVersion) async {}
}
