import 'package:flutter_riverpod/flutter_riverpod.dart';

final NotifierProvider<ScrollNotifier, bool> scrollProvider =
    NotifierProvider<ScrollNotifier, bool>(
      () => ScrollNotifier(),
    );

class ScrollNotifier extends Notifier<bool> {
  @override
  bool build() => true;

  set setScroll(bool isScroll) {
    state = isScroll;
  }
}
