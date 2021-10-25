import 'package:flutter/foundation.dart';

class JoinOrLogin extends ChangeNotifier{ // Check if Join or Login
  bool _isJoin = false; // make private (change should be notified by ChangeNotifier)

  bool get isJoin => _isJoin;

  void toggle(){
    _isJoin = !_isJoin;
    notifyListeners();
  }
}