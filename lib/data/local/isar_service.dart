import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/user_profile.dart';
import '../models/diagnosis_history.dart';

class IsarService {
  IsarService._();

  static Isar? _instance;

  static Future<Isar> instance() async {
    if (_instance != null) {
      return _instance!;
    }

    final directory = await getApplicationDocumentsDirectory();

    _instance = await Isar.open(
      [
        UserProfileSchema,
        DiagnosisHistorySchema,
      ],
      directory: directory.path,
    );

    return _instance!;
  }
}