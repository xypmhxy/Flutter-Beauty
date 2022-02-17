import 'package:flutter/services.dart';

class FilterPlugin{
  static const MethodChannel _methodChannel = MethodChannel("flutter_beauty");
  
  Future<void> setup(String image64)async{
    await _methodChannel.invokeMethod("setupOriginImage",image64);
  }

  Future<String> filter()async{
    var image64 = await _methodChannel.invokeMethod("setFilter");
    return image64;
  }
}