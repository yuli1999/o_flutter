import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_flutter/common/Global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
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
              child: Text("点击"),
            ),
          )
        ],
      ),
    );
  }

  // 获取原生的值 向原生发送消息
  invokeNativeMethod(String method, Map<String, Object> map) async {
    dynamic args;
    try {
      args = await Global.method.invokeMethod(method, map);
    } on PlatformException catch (e) {}
  }
}
