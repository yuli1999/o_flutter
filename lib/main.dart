// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:one_flutter/common/Global.dart';
import 'package:one_flutter/page/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //接收原生值 通过invokeMethod唤起
  Future<dynamic> nativeCallHandler(MethodCall methodCall) async {
    switch (methodCall.method) {
      case "test":

        EasyLoading.showToast(methodCall.arguments["test"].toString());



        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    Global.method.setMethodCallHandler(nativeCallHandler);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Demo',
      home: const HomePage(),
      //路由
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => HomePage(),
      },
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
    );
  }
}
