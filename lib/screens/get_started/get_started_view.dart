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
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 35.0) +
            EdgeInsets.only(bottom: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 168),
            Text(
              AppStrings.getstarted,
              style: CommonStyle.getInterFont(
                fontSize: 40,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 30),
            Text(
              AppStrings.getstartedDescription,
              style: CommonStyle.getInterFont(),
            ),
            SizedBox(height: 80,),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Builder(
                builder: (context) {
                  return Image.asset(LocalImages.getStartedImage,fit: BoxFit.cover,);
                },
              ),
            ),
            Spacer(),
            CommonButton(
              text: AppStrings.shopOwner,
              backgroundColor: AppColors.white,
              textColor: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              onPressed: () {},
            ),
            SizedBox(height: 16),
            CommonButton(
              text: AppStrings.customer,
              backgroundColor: AppColors.grey,
              textColor: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
