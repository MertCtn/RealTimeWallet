import 'package:flutter/material.dart';

class BalanceProvider extends ChangeNotifier {
  double _balance = 0.0;
  bool _isListening = false;

  double get balance => _balance;
  bool get isListening => _isListening;

  void updateBalance(double newBalance) {
    _balance = newBalance;
    notifyListeners();
  }

  void setListening(bool value) {
    _isListening = value;
  }
}
