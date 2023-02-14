// @dart=2.9
import 'package:flutter/services.dart';

class Global {
  factory Global() => _getInstance();

  static Global get instance => _getInstance();
  static Global _instance;

  Global._internal() {
    // 初始化
  }

  static Global _getInstance() {
    _instance ??= Global._internal();
    return _instance;
  }

  static const method = MethodChannel('samples.flutter.dev/battery');
}
