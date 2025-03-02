import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor() {
    // Initialize ffi for Windows
    //print("Initializing ffi..."); // Debugging
    sqfliteFfiInit();
  }

  Future<Database> get database async {
    // print("Getting database..."); // Debugging
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'app.db');

    // print('Database path: $path'); // Debugging

    // Use ffi database factory for Windows
    var databaseFactory = databaseFactoryFfi;

    Database database = await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(version: 1, onCreate: _onCreate),
    );

    return database;
  }

  Future<void> _onCreate(Database db, int version) async {
    // Crear base de datos de usuarios
    await _createUserTable(db);

    // Seed database
    await _seedDatabase(db);
  }

  Future<void> close() async {
    var database = await instance.database;
    database.close();
  }

  Future<void> delete() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'app.db');
    await deleteDatabase(path);
  }

  Future<void> _createUserTable(Database db) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        email TEXT NOT NULL,
        token TEXT NOT NULL,
        refreshToken TEXT NOT NULL
      )
    ''');
  }

  Future<void> _seedDatabase(Database db) async {
    // print("Seeding database..."); // Debugging
    // Seed database from JSON
    //await _seedDroneDatabaseFromJson(db);
    //await _seedProtocolDatabaseFromJson(db);
  }
}
