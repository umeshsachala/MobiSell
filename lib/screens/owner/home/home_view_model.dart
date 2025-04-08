import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  String message = "Hello";

  void updateMessage(String newMessage) {
    message = newMessage;
    notifyListeners();
  }
} 