import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvUtil {
  static String get apiKey => dotenv.env['THE_MOVIE_API_KEY'] ?? '';
  static String get apiVesion => dotenv.env['API_VERSION'] ?? '';
  static String get hostApi => dotenv.env['HOST_API'] ?? '';
  static Future<void> initDotEnv() async {
    await dotenv.load(fileName: '.env');
  }
}
