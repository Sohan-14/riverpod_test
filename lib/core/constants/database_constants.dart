/// [DatabaseConstants] Database related constants
class DatabaseConstants {
  // Database name and version
  static const String databaseName = 'app_database.db';
  static const int databaseVersion = 1;
  
  // Tables
  static const String userTable = 'users';
  
  // User table columns
  static const String columnId = 'id';
  static const String columnEmail = 'email';
  static const String columnName = 'name';
  static const String columnAvatar = 'avatar';
  static const String columnIsEmailVerified = 'is_email_verified';
}