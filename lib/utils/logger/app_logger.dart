import 'dart:developer';

import 'package:flutter/foundation.dart';

class AppLogger {
  static logData({
    String name = 'log',
    required String message,
  }) {
    if (kDebugMode) {
      log(message, name: name);
    }
  }

  static printData({
    required String message,
  }) {
    if (kDebugMode) {
      print(message);
    }
  }
}
