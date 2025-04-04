import 'package:flutter/material.dart';
import 'package:mobisell/utils/app_colors/app_colors.dart';
import 'package:mobisell/utils/app_strings/app_strings.dart';
import 'package:mobisell/utils/local_images/local_images.dart';
import 'package:mobisell/utils/text_style/text_style.dart';
import 'package:mobisell/utils/common_widgets/common_button.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
            vertical: size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.05),
              Text(
                AppStrings.getstarted,
                style: CommonStyle.getInterFont(
                  fontSize: size.width * 0.1, // Responsive font size
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                AppStrings.getstartedDescription,
                style: CommonStyle.getInterFont(
                  fontSize: size.width * 0.04, // Responsive font size
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.2),
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size.width * 0.2),
                    child: Image.asset(
                      LocalImages.getStartedImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommonButton(
                      text: AppStrings.shopOwner,
                      backgroundColor: AppColors.white,
                      textColor: AppColors.black,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w600,
                      onPressed: () {},
                    ),
                    SizedBox(height: size.height * 0.02),
                    CommonButton(
                      text: AppStrings.customer,
                      backgroundColor: AppColors.grey,
                      textColor: AppColors.white,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w600,
                      onPressed: () {},
                    ),
                    SizedBox(height: padding.bottom + size.height * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
