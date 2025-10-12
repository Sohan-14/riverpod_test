import 'package:sqflite/sqflite.dart' hide DatabaseException;
import 'package:path/path.dart';
import '../constants/database_constants.dart';
import '../utils/app_logger.dart';
import '../exceptions/exceptions.dart';

/// Helper class for SQLite database operations
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  /// Get the database instance
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  /// Initialize the database
  Future<Database> _initDatabase() async {
    AppLogger().i('Initializing database');
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, DatabaseConstants.databaseName);

    return await openDatabase(
      path,
      version: DatabaseConstants.databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  /// Create database tables
  Future<void> _onCreate(Database db, int version) async {
    AppLogger().i('Creating database tables');

    // Create users table
    await db.execute('''
    CREATE TABLE ${DatabaseConstants.userTable} (
      ${DatabaseConstants.columnId} TEXT PRIMARY KEY,
      ${DatabaseConstants.columnEmail} TEXT NOT NULL,
      ${DatabaseConstants.columnName} TEXT,
      ${DatabaseConstants.columnAvatar} TEXT,
      ${DatabaseConstants.columnIsEmailVerified} INTEGER NOT NULL
    )
    ''');
  }

  /// Upgrade database
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    AppLogger().i('Upgrading database from $oldVersion to $newVersion');

    if (oldVersion < 2) {
      // Add migration code for version 2
    }
  }

  /// Insert a record
  Future<int> insert(String table, Map<String, dynamic> data) async {
    try {
      AppLogger().d('Inserting into $table: $data');
      final Database db = await database;
      return await db.insert(
        table,
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      AppLogger().e('Error inserting into $table', error: e);
      throw DatabaseException(message: 'Failed to insert data: $e');
    }
  }

  /// Query all records from a table
  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    try {
      AppLogger().d('Querying all rows from $table');
      final Database db = await database;
      return await db.query(table);
    } catch (e) {
      AppLogger().e('Error querying all rows from $table', error: e);
      throw DatabaseException(message: 'Failed to query data: $e');
    }
  }

  /// Query a single record by ID
  Future<Map<String, dynamic>?> queryById(String table, String id) async {
    try {
      AppLogger().d('Querying $table by ID: $id');
      final Database db = await database;
      final List<Map<String, dynamic>> result = await db.query(
        table,
        where: '${DatabaseConstants.columnId} = ?',
        whereArgs: <Object?>[id],
      );

      if (result.isNotEmpty) {
        return result.first;
      } else {
        return null;
      }
    } catch (e) {
      AppLogger().e('Error querying $table by ID', error: e);
      throw DatabaseException(message: 'Failed to query data: $e');
    }
  }

  /// Update a record
  Future<int> update(String table, Map<String, dynamic> data) async {
    try {
      AppLogger().d('Updating $table: $data');
      final Database db = await database;
      // ignore: always_specify_types
      final id = data[DatabaseConstants.columnId];
      return await db.update(
        table,
        data,
        where: '${DatabaseConstants.columnId} = ?',
        whereArgs: <Object?>[id],
      );
    } catch (e) {
      AppLogger().e('Error updating $table', error: e);
      throw DatabaseException(message: 'Failed to update data: $e');
    }
  }

  /// Delete a record
  Future<int> delete(String table, String id) async {
    try {
      AppLogger().d('Deleting from $table: $id');
      final Database db = await database;
      return await db.delete(
        table,
        where: '${DatabaseConstants.columnId} = ?',
        whereArgs: <Object?>[id],
      );
    } catch (e) {
      AppLogger().e('Error deleting from $table', error: e);
      throw DatabaseException(message: 'Failed to delete data: $e');
    }
  }

  /// Delete all records from a table
  Future<int> deleteAll(String table) async {
    try {
      AppLogger().d('Deleting all records from $table');
      final Database db = await database;
      return await db.delete(table);
    } catch (e) {
      AppLogger().e('Error deleting all records from $table', error: e);
      throw DatabaseException(message: 'Failed to delete data: $e');
    }
  }
}
