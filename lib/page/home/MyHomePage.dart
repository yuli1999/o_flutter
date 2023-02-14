// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_flutter/common/Global.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Map<String, Object> map = {
            "test": "555",
          };
          invokeNativeMethod("test", map);
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: const Text("点击"),
        ),
      ),
    );
  }
}

// 获取原生的值 向原生发送消息
invokeNativeMethod(String method, Map<String, Object> map) async {
  dynamic args;
  try {
    args = await Global.method.invokeMethod(method, map);
  } on PlatformException catch (e) {}
}
