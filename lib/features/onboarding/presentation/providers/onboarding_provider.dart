import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/repositories/profile_repository.dart';

final profileRepositoryProvider =
    Provider<ProfileRepository>(
  (ref) => ProfileRepository(),
);