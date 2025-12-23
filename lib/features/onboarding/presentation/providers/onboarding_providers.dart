import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/business_info_controller.dart';
import '../state/business_info_state.dart';

final NotifierProvider<BusinessInfoNotifier, BusinessInfoState>
businessInfoProvider =
    NotifierProvider<BusinessInfoNotifier, BusinessInfoState>(
      () => BusinessInfoNotifier(),
    );
