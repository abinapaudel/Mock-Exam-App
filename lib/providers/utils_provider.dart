import 'dart:async';

import 'package:flutter/material.dart';

class UtilsProvider extends ChangeNotifier {
  Duration _duration = const Duration(hours: 2);

  Duration get duration => _duration;
  Timer? _timer;

  void start() {
    // print(" Start is called ");
    if (_timer != null) return;
    // _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration.inSeconds > 0) {
        _duration = Duration(seconds: _duration.inSeconds - 1);
      } else {
        stop();
      }
      notifyListeners();
    });
    // notifyListeners();
  }

  void stop() {
    if (_timer == null) return;
    _timer!.cancel();
    _timer = null;

    // notifyListeners();
  }
}
