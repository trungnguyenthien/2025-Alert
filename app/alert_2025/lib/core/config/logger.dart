import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 1),
  );

  static void logInfo(String message) {
    _logger.i(message);
  }

  static void logError(String message, {dynamic error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  static void logDebug(String message) {
    _logger.d(message);
  }
}
