import 'package:flutter/material.dart';
import 'package:mobisell/core/navigation/navigator.dart';
import 'package:mobisell/screens/get_started/get_started_view.dart';

class ProfileViewModel extends ChangeNotifier {
  BuildContext? context;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void initialize(BuildContext context) {
    this.context = context;
  }

  void logout() {
    if (context != null) {
      Navigation.removeAllPreviousAndPush(context!, const GetStartedView());
    }
  }

  void navigateToEditProfile() {
    // TODO: Implement navigation to edit profile
  }

  void navigateToSavedAddresses() {
    // TODO: Implement navigation to saved addresses
  }

  void navigateToOrderHistory() {
    // TODO: Implement navigation to order history
  }

  void navigateToSettings() {
    // TODO: Implement navigation to settings
  }
} 