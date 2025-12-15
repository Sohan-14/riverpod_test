import 'package:app/core/constants/storage_keys.dart';
import 'package:app/core/storage/secure_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part '../enums/role.dart';

final NotifierProvider<SelectedRoleNotifier, Role> selectedRoleProvider =
    NotifierProvider<SelectedRoleNotifier, Role>(
      () => SelectedRoleNotifier(),
    );


class SelectedRoleNotifier extends Notifier<Role> {
  @override
  Role build(){
    SecureStorageService().write(StorageKeys.role, Role.user.name);
    return Role.user;
  }

  // Method to update the set role
  set setRole(Role role) {
    SecureStorageService().write(StorageKeys.role, Role.user.name);
    state = role;
  }
}