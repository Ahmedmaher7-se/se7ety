import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int milliseconds;
  Function? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  //abcd

  void run(VoidCallback action) {
    _timer?.cancel();

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
