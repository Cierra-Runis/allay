import 'package:allay/index.dart';

import 'dart:developer' as devtools show log;

class Debug {
  static void printLog(dynamic newLog) {
    devtools.log('$newLog', name: Allay.name);
  }
}
