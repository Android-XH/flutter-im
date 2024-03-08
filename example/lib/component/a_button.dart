import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../page/api_detail/logic.dart';

class AButton {
  static MaterialButton build({required VoidCallback onPressed}) {
    return MaterialButton(
        onPressed: onPressed,
        color: Colors.blue,
        height: 44.0,
        minWidth: 140,
        child: const Text(
          "试一试",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ));
  }
}
