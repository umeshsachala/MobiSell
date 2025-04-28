import 'package:flutter/material.dart';
import 'package:mobisell/screens/coustmer/home/home_view.dart';
import 'package:mobisell/utils/app_colors/app_colors.dart';
import 'package:mobisell/utils/app_strings/app_strings.dart';
import 'package:mobisell/utils/text_style/text_style.dart';

class SmartphoneDetailsView extends StatefulWidget {
  final Smartphone smartphone;

  const SmartphoneDetailsView({
    super.key,
    required this.smartphone,
  });

  @override
  State<SmartphoneDetailsView> createState() => _SmartphoneDetailsViewState();
}

class _SmartphoneDetailsViewState extends State<SmartphoneDetailsView> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          widget.smartphone.name,
          style: CommonStyle.getInterFont(
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel
            SizedBox(
              height: size.height * 0.4,
              child: PageView.builder(
                itemCount: 3,
                onPageChanged: (index) {
                  setState(() {
                    _currentImageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    widget.smartphone.image,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            // Image Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImageIndex == index
                        ? AppColors.orange
                        : Colors.grey,
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.smartphone.name,
                    style: CommonStyle.getInterFont(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${widget.smartphone.price.toStringAsFixed(2)}',
                    style: CommonStyle.getInterFont(
                      fontSize: size.width * 0.05,
                      color: AppColors.orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Description',
                    style: CommonStyle.getInterFont(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.smartphone.description,
                    style: CommonStyle.getInterFont(
                      fontSize: size.width * 0.04,
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Shop Information
                  Text(
                    'Shop Information',
                    style: CommonStyle.getInterFont(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(
                    context,
                    size,
                    Icons.location_on,
                    'Shop Location',
                    '123 Mobile Street, City',
                  ),
                  _buildInfoRow(
                    context,
                    size,
                    Icons.phone,
                    'Contact Number',
                    '+1234567890',
                  ),
                  _buildInfoRow(
                    context,
                    size,
                    Icons.access_time,
                    'Working Hours',
                    '9:00 AM - 8:00 PM',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    Size size,
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.black,
            size: 24,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CommonStyle.getInterFont(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: CommonStyle.getInterFont(
                  fontSize: size.width * 0.04,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 