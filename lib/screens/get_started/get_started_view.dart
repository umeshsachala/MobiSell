import 'package:flutter/material.dart';
import 'package:mobisell/utils/app_colors/app_colors.dart';
import 'package:mobisell/utils/text_style/text_style.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
              children: [
                Text('Get Started',style: CommonStyle.getInterFont(),)
              ]
          ),
        )
    );
  }
}
