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
    return Stack(
      children: [
        GestureDetector(
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
        Positioned(
          top: 100,
          left: 60,
          child: GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Image(
              width: 80,
              height: 80,
              image: AssetImage('assets/images/ic_head.png'),
            ),
          ),
        ),
      ],
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
