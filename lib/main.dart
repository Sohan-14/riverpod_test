import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'app.dart';
import 'core/utils/app_logger.dart';

// lib/main.dart (continued)
Future<void> main() async {
  // Initialize Flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  // Create a logger for initialization
  AppLogger().i('Starting application initialization');

  try {
    // Initialize secure storage
    AppLogger().i('Initializing secure storage');
    const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ),
    );

    // Create ProviderContainer with overrides
    // AppLogger().i('Creating provider container with overrides');
    // final ProviderContainer container = ProviderContainer(
    //   overrides:[
    //     secureTokenStorageProvider.overrideWithValue(
    //       SecureTokenStorageImpl(secureStorage),
    //     ),
    //   ],
    // );

    AppLogger().i('App initialization complete, launching app');

    // Run the app
    runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  } catch (e, stackTrace) {
    // Log any initialization errors
    AppLogger().e(
      'Error during initialization',
      error: e,
      stackTrace: stackTrace,
    );
    rethrow;
  }
}
