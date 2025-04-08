import 'package:flutter/material.dart';
import 'package:mobisell/core/navigation/navigator.dart';

import '../../owner/home/home_view.dart';


class LoginViewModel extends ChangeNotifier {
  BuildContext? context;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void initialize(BuildContext context) {
    this.context = context;
  }

  void navigateToHome() {
    if (context != null) {
      Navigation.removeAllPreviousAndPush(context!, const HomeView());
    }
  }
} 