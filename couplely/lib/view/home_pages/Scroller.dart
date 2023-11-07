import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Scroller with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isScrolled = false;

  bool get isScrolled => _isScrolled;

  void down() {
    _isScrolled = false;
    notifyListeners();
  }

  void up() {
    _isScrolled = true;
    notifyListeners();
  }
}
