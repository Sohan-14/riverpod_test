import 'package:flutter_riverpod/flutter_riverpod.dart';
part '../enums/role.dart';

final NotifierProvider<SelectedRoleNotifier, Role> selectedRoleProvider =
    NotifierProvider<SelectedRoleNotifier, Role>(
      () => SelectedRoleNotifier(),
    );


class SelectedRoleNotifier extends Notifier<Role> {
  @override
  Role build() => Role.user;

  // Method to update the set role
  set setRole(Role role) {
    state = role;
  }
}