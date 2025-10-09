import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';
import '../../exceptions/exceptions.dart';
import '../../utils/app_logger.dart';
import 'local_storage.dart';

/// Implementation of local storage using Sqflite (SQLite)
class SqfliteStorage implements LocalStorage {
  static SqfliteStorage? _instance;
  late Database _database;

  // Private constructor to prevent external instantiation
  SqfliteStorage._internal(){
    _initDatabase();
  }

  // Public factory constructor to return the same instance
  factory SqfliteStorage() {
    _instance ??= SqfliteStorage._internal();
    return _instance!;
  }

  // Initialize the SQLite database
  Future<void> _initDatabase() async {
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, 'app_storage.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE Storage (
          key TEXT PRIMARY KEY,
          value TEXT
        )
      ''');
      },
    );
  }

  // Initialize the database on first usage
  Future<void> init() async {
    await _initDatabase();
  }

  @override
  Future<void> saveData<T>(String key, T value) async {
    try {
      AppLogger().d('Saving data for key: $key');
      String jsonValue;

      // For complex objects, convert to JSON string
      if (value is Map || value is List) {
        jsonValue = jsonEncode(value);
        AppLogger().d('Saved complex object as JSON string');
      } else {
        jsonValue = value.toString();
        AppLogger().d('Saved primitive value');
      }

      final List<Map<String, Object?>> existing = await _database.query(
        'Storage',
        where: 'key = ?',
        whereArgs: <Object?>[key],
      );
      if (existing.isNotEmpty) {
        // Update existing record
        await _database.update(
          'Storage',
          <String, Object?>{'value': jsonValue},
          where: 'key = ?',
          whereArgs: <Object?>[key],
        );
      } else {
        // Insert new record
        await _database.insert(
          'Storage',
          <String, Object?>{'key': key, 'value': jsonValue},
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    } catch (e) {
      AppLogger().e('Error saving data for key: $key', error: e);
      throw LocalStorageException(
        message: 'Failed to save data for key $key: $e',
      );
    }
  }

  @override
  Future<T?> getData<T>(String key) async {
    try {
      AppLogger().d('Getting data for key: $key');
      final List<Map<String, dynamic>> result = await _database.query(
        'Storage',
        where: 'key = ?',
        whereArgs: <Object?>[key],
      );

      if (result.isEmpty) {
        AppLogger().d('No data found for key: $key');
        return null;
      }

      final String value = result.first['value'] as String;

      if (value.startsWith('{') || value.startsWith('[')) {
        try {
          AppLogger().d('Parsing JSON string for key: $key');
          return jsonDecode(value) as T;
        } catch (_) {
          AppLogger().d('Not a valid JSON string, returning as is');
          return value as T;
        }
      }

      AppLogger().d('Returning value as is for key: $key');
      return value as T;
    } catch (e) {
      AppLogger().e('Error getting data for key: $key', error: e);
      throw LocalStorageException(
        message: 'Failed to get data for key $key: $e',
      );
    }
  }

  @override
  Future<void> deleteData(String key) async {
    try {
      AppLogger().d('Deleting data for key: $key');
      await _database.delete(
        'Storage',
        where: 'key = ?',
        whereArgs: <Object?>[key],
      );
    } catch (e) {
      AppLogger().e('Error deleting data for key: $key', error: e);
      throw LocalStorageException(
        message: 'Failed to delete data for key $key: $e',
      );
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      AppLogger().d('Clearing all data from database');
      await _database.delete('Storage');
    } catch (e) {
      AppLogger().e('Error clearing database data', error: e);
      throw LocalStorageException(message: 'Failed to clear data: $e');
    }
  }

  @override
  Future<bool> hasData(String key) async {
    try {
      AppLogger().d('Checking if data exists for key: $key');
      final List<Map<String, Object?>> result = await _database.query(
        'Storage',
        where: 'key = ?',
        whereArgs: <Object?>[key],
      );
      return result.isNotEmpty;
    } catch (e) {
      AppLogger().e('Error checking data for key: $key', error: e);
      throw LocalStorageException(
        message: 'Failed to check data for key $key: $e',
      );
    }
  }
}
