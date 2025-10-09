/// [LocalStorage] Interface for local storage using Hive
/// This is used for non-sensitive data like user preferences, app state, etc.
abstract class LocalStorage {
  Future<void> saveData<T>(String key, T value);
  Future<T?> getData<T>(String key);
  Future<void> deleteData(String key);
  Future<void> clearAll();
  Future<bool> hasData(String key);
}