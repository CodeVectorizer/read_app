import 'package:flutter/services.dart';

Future<String?> getImgUrl(String? imgUrl) async {
  try {
    Uint8List bytes =
        (await NetworkAssetBundle(Uri.parse(imgUrl!)).load(imgUrl))
            .buffer
            .asUint8List();
    print("The image exists!");
    return imgUrl;
  } catch (e) {
    print("Error: $e");
    return null;
  }
}
