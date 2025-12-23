import 'package:app/core/constants/storage_keys.dart';
import 'package:app/core/storage/secure_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part '../enums/role.dart';

// Change provider to AsyncNotifier
final AsyncNotifierProvider<SelectedRoleNotifier, Role> selectedRoleProvider =
    AsyncNotifierProvider<SelectedRoleNotifier, Role>(
      () => SelectedRoleNotifier(),
    );

class SelectedRoleNotifier extends AsyncNotifier<Role> {
  @override
  Future<Role> build() async {
    final Role role = await _readRoleFromStorage();
    state = AsyncData<Role>(role);
    return role;
  }

  Future<Role> _readRoleFromStorage() async {
    final String? roleStr = await SecureStorageService().read(StorageKeys.role);

    Role role;
    switch (roleStr) {
      case 'creator':
        role = Role.creator;
        break;
      case 'seller':
        role = Role.seller;
        break;
      case 'driver':
        role = Role.driver;
        break;
      case 'user':
      default:
        role = Role.user;
    }

    // Optionally re-save to ensure consistency (e.g., if null)
    await SecureStorageService().write(StorageKeys.role, role.name);
    return role;
  }

  Future<void> setRole(Role role) async {
    await SecureStorageService().write(StorageKeys.role, role.name);
    state = AsyncData<Role>(role);
  }
}
