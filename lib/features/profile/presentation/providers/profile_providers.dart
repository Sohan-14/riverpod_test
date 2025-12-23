import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user_profile.dart';
import '../controllers/interest_controller.dart';
import '../controllers/profile_edit_controller.dart';
import '../controllers/user_profile_controller.dart';
import '../state/interest_state.dart';
import '../state/profile_edit_state.dart';

final NotifierProvider<InterestNotifier, InterestState> interestProvider =
    NotifierProvider<InterestNotifier, InterestState>(
      () => InterestNotifier(),
    );

final AsyncNotifierProvider<UserProfileNotifier, UserProfile?>
userProfileProvider = AsyncNotifierProvider<UserProfileNotifier, UserProfile?>(
  UserProfileNotifier.new,
);

final NotifierProvider<ProfileEditNotifier, ProfileEditState>
profileEditProvider = NotifierProvider<ProfileEditNotifier, ProfileEditState>(
  ProfileEditNotifier.new,
);
