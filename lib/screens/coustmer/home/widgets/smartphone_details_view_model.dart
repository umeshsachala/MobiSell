import 'package:flutter/material.dart';
import 'package:mobisell/screens/coustmer/home/home_view.dart';

class SmartphoneDetailsViewModel extends ChangeNotifier {
  final Smartphone smartphone;
  List<String> _images = [];
  String _shopPhoneNumber = '+1234567890';
  double _shopLatitude = 37.42796133580664;
  double _shopLongitude = -122.085749655962;

  SmartphoneDetailsViewModel(this.smartphone) {
    _initializeImages();
  }

  void _initializeImages() {
    // In a real app, this would come from an API or database
    _images = List.generate(3, (index) => smartphone.image);
  }

  List<String> get images => _images;
  String get shopPhoneNumber => _shopPhoneNumber;
  double get shopLatitude => _shopLatitude;
  double get shopLongitude => _shopLongitude;
} 