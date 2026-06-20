import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/user_profile.dart';
import '../../../data/repositories/profile_repository.dart';

final profileRepositoryProvider =
    Provider<ProfileRepository>(
  (ref) => ProfileRepository(),
);

final profileProvider =
    FutureProvider<UserProfile?>(
  (ref) async {
    return ref
        .read(profileRepositoryProvider)
        .getProfile();
  },
);