// @dart=2.9
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_flutter/common/Global.dart';
import 'package:one_flutter/page/home/MyHomePage.dart';
import 'package:one_flutter/page/type/TypePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<StatefulWidget> bodyList = [];
  List<BottomNavigationBarItem> items = [];
  int currentIndex = 0;

  //创建StreamController
  StreamController streamController;

  // 获取StreamSink用于发射事件
  StreamSink<int> get streamSink => streamController.sink;

  // 获取Stream用于监听
  Stream<int> get streamData => streamController.stream;
  final pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamController = StreamController<int>();

    items = [
      const BottomNavigationBarItem(
          icon: Image(
            width: 20,
            height: 20,
            image: AssetImage('assets/images/ic_home.png'),
          ),
          activeIcon: Image(
            width: 20,
            height: 20,
            image: AssetImage('assets/images/ic_home_s.png'),
          ),
          label: "首页"),
      const BottomNavigationBarItem(
          icon: Image(
            width: 20,
            height: 20,
            image: AssetImage('assets/images/ic_type.png'),
          ),
          activeIcon: Image(
            width: 20,
            height: 20,
            image: AssetImage('assets/images/ic_type_s.png'),
          ),
          label: "分类"),
    ];

    bodyList = [const MyHomePage(), const TypePage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: StreamBuilder<int>(
        initialData: 0,
        stream: streamData,
        builder: (BuildContext buildContext, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            currentIndex = snapshot.data;
            return Container(
              height: 60,
              child: BottomNavigationBar(
                items: items,
                currentIndex: currentIndex,
                onTap: (index) {
                  currentIndex = index;
                  pageController.jumpToPage(index);
                },
                selectedFontSize: 11,
                unselectedFontSize: 11,
                type: BottomNavigationBarType.fixed,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: pageController,
            onPageChanged: onPageChanged,
            children: bodyList,
          ),
        ],
      ),
    );
  }

  void onPageChanged(int index) {
    streamSink.add(index);
  }

  // 获取原生的值 向原生发送消息
  invokeNativeMethod(String method, Map<String, Object> map) async {
    dynamic args;
    try {
      args = await Global.method.invokeMethod(method, map);
    } on PlatformException catch (e) {}
  }
}
