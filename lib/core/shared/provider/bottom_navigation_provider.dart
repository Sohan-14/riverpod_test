import 'package:flutter_riverpod/flutter_riverpod.dart';

final NotifierProvider<SelectedBottomTabNotifier, int> selectedBottomTabProvider =
    NotifierProvider<SelectedBottomTabNotifier, int>(
      () => SelectedBottomTabNotifier(),
    );

class SelectedBottomTabNotifier extends Notifier<int> {
  @override
  int build() => 0;

  // Method to update the selected tab index
  set setSelectedTab(int index) {
    state = index;
  }

  set setPageIndex(int index) {
    state = index;
  }
}
