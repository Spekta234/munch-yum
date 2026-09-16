import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

void mBack<T>({T? result}) { // CHANGED: safe replacement for Get.back() across the app
  final navigator = Navigator.of(Get.context!);
  if (navigator.canPop()) {
    navigator.pop(result);
  }
}