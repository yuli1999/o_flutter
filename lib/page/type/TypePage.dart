// @dart=2.9
import 'package:flutter/material.dart';

class TypePage extends StatefulWidget {
  const TypePage({Key key}) : super(key: key);

  @override
  State<TypePage> createState() => _TypePageState();
}

class _TypePageState extends State<TypePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("分类"),
    );
  }
}
