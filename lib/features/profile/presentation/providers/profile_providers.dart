import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/interest_controller.dart';
import '../state/interest_state.dart';

final NotifierProvider<InterestNotifier, InterestState> interestProvider =
    NotifierProvider<InterestNotifier, InterestState>(
      () => InterestNotifier(),
    );
