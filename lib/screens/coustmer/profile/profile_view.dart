import 'package:flutter/material.dart';
import 'package:mobisell/utils/app_colors/app_colors.dart';
import 'package:mobisell/utils/text_style/text_style.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Profile',
          style: CommonStyle.getInterFont(
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
            vertical: size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.02),
              // Profile Header
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey,
                        border: Border.all(
                          color: AppColors.black,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'John Doe',
                      style: CommonStyle.getInterFont(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'john.doe@example.com',
                      style: CommonStyle.getInterFont(
                        fontSize: size.width * 0.04,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.04),
              // Simple Menu Items
              _buildMenuItem(
                context,
                size,
                Icons.person_outline,
                'My Account',
              ),
              _buildMenuItem(
                context,
                size,
                Icons.shopping_bag_outlined,
                'My Orders',
              ),
              _buildMenuItem(
                context,
                size,
                Icons.favorite_border,
                'Wishlist',
              ),
              _buildMenuItem(
                context,
                size,
                Icons.help_outline,
                'Help & Support',
              ),
              const Spacer(),
              // Simple Logout Button
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: size.height * 0.02),
                child: ElevatedButton(
                  onPressed: () {
                    // Simple logout action
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/get_started',
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grey,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Logout',
                    style: CommonStyle.getInterFont(
                      fontSize: size.width * 0.04,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    Size size,
    IconData icon,
    String title,
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
          Text(
            title,
            style: CommonStyle.getInterFont(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.grey,
            size: 16,
          ),
        ],
      ),
    );
  }
} 