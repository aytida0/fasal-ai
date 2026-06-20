import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/user_profile.dart';
import '../../../data/repositories/profile_repository.dart';

final homeProfileProvider =
    FutureProvider<UserProfile?>(
  (ref) async {
    return ProfileRepository()
        .getProfile();
  },
);