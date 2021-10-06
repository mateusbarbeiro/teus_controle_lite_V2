import 'package:flutter/material.dart';

ImageProvider<Object> handleImage(String? scr) {
  if (scr == null || !Uri.tryParse(scr)!.isAbsolute) {
    return const AssetImage('assets/images/no-image.png');
  } else {
    return NetworkImage(scr);
  }
}
