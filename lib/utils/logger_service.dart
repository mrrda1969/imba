class LoggerService {
  static void info(String message) {
    _log('INFO', message);
  }

  static void warning(String message) {
    _log('WARNING', message);
  }

  static void error(String message) {
    _log('ERROR', message);
  }

  static void debug(String message) {
    _log('DEBUG', message);
  }

  static void _log(String level, String message) {
    final now = DateTime.now().toIso8601String();
    print('[$now][$level] $message');
  }
}
