import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class ImageUtils {
  static Future<String> assetsImage2Base64(String path) async {
    ByteData bytes = await rootBundle.load(path);
    var buffer = bytes.buffer;
    String imageBase64 = base64.encode(Uint8List.view(buffer));
    return imageBase64;
  }
}
