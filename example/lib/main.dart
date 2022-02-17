import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_beauty/filter/filter_plugin.dart';
import 'package:flutter_beauty_example/image_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String image64 = "";
  String originImage64 = "";
  var filterPlugin = FilterPlugin();

  @override
  void initState() {
    super.initState();
    initPhoto();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPhoto() async {
    originImage64 = await ImageUtils.assetsImage2Base64("images/bg.jpeg");
    await filterPlugin.setup(originImage64);
    print("flutter 初始化完成");
    image64 = await filterPlugin.filter();
    print("flutter 转换完成 $image64");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: image64 == ""
              ? Text(
                  "加载中",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.memory(base64.decode(originImage64)),
                      Container(
                          margin: EdgeInsets.only(top: 12),
                          child: Image.memory(base64.decode(image64)))
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
