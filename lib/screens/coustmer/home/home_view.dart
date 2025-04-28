import 'package:flutter/material.dart';
import 'package:mobisell/screens/coustmer/home/widgets/smartphone_card.dart';
import 'package:mobisell/utils/app_colors/app_colors.dart';
import 'package:mobisell/utils/app_strings/app_strings.dart';
import 'package:mobisell/utils/local_images/local_images.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(backgroundColor: AppColors.white,
        title: const Text('Smartphones'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: smartphones.length,
        itemBuilder: (context, index) {
          return SmartphoneCard(smartphone: smartphones[index]);
        },
      ),
    );
  }
}

class Smartphone {
  final String name;
  final String image;
  final double price;
  final String description;

  Smartphone({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });
}

final List<Smartphone> smartphones = [
  Smartphone(
    name: AppStrings.iPhone15Pro,
    image: LocalImages.iphone15,
    price: 999.99,
    description: AppStrings.iPhoneDescription,
  ),
  Smartphone(
    name: AppStrings.SamsungGalaxyS24,
    image: LocalImages.samsungS24,
    price: 899.99,
    description: AppStrings.SamsungDescription,
  ),
  Smartphone(
    name: AppStrings.GooglePixel8,
    image: LocalImages.pixel9Pro,
    price: 699.99,
    description: AppStrings.GoogleDescription,
  ),
]; 