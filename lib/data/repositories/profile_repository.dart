import 'package:isar/isar.dart';

import '../local/isar_service.dart';
import '../models/user_profile.dart';

class ProfileRepository {
  Future<UserProfile?> getProfile() async {
    final isar = await IsarService.instance();

    return isar.userProfiles.where().findFirst();
  }

  Future<void> saveProfile(
    UserProfile profile,
  ) async {
    final isar = await IsarService.instance();

    await isar.writeTxn(
      () async {
        await isar.userProfiles.put(profile);
      },
    );
  }

  Future<void> updateName(
    String name,
  ) async {
    final isar = await IsarService.instance();

    final profile =
        await isar.userProfiles.where().findFirst();

    if (profile == null) {
      return;
    }

    profile.name = name;

    await isar.writeTxn(
      () async {
        await isar.userProfiles.put(profile);
      },
    );
  }

  Future<void> updateImage(
    String imagePath,
  ) async {
    final isar = await IsarService.instance();

    final profile =
        await isar.userProfiles.where().findFirst();

    if (profile == null) {
      return;
    }

    profile.imagePath = imagePath;

    await isar.writeTxn(
      () async {
        await isar.userProfiles.put(profile);
      },
    );
  }
}