import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobisell/core/navigation/navigator.dart';
import 'package:mobisell/screens/Onboarding/onboarding_screen.dart';
import 'package:mobisell/screens/get_started/get_started_view.dart';

class SplashViewModel with ChangeNotifier {
  BuildContext? context;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  void initialize(BuildContext context) {
    this.context = context;
    _loadData();
  }

  Future<void> _loadData() async {
    // Simulate loading time
    await Future.delayed(const Duration(seconds: 3));
    _isLoading = false;
    notifyListeners();
    
    if (context != null) {
      Navigation.pushReplacement(context!,  OnboardingScreen());
    }
  }
}
