// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

abstract class GlobalInfoLocalDatasource {
  Future<String?> getLangCode();
  Future<bool> setSavedLocale(String langCode);
}

class GlobalInfoLocalDataSourceImpl implements GlobalInfoLocalDatasource {
  final SharedPreferences sharedPreferences;
  GlobalInfoLocalDataSourceImpl({
    required this.sharedPreferences,
  });
  @override
  Future<String?> getLangCode() async {
    return sharedPreferences.getString('SAVED_LANGUAGE');
  }

  @override
  Future<bool> setSavedLocale(String langCode) {
    return sharedPreferences.setString('SAVED_LANGUAGE', langCode);
  }
}
