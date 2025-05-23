import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobisell/utils/app_strings/app_strings.dart';
import 'package:provider/provider.dart';
import 'package:mobisell/utils/app_colors/app_colors.dart';
import 'package:mobisell/utils/text_style/text_style.dart';
import 'package:mobisell/utils/common_widgets/common_button.dart';
import 'package:mobisell/screens/coustmer/bottom_nav/customer_bottom_nav.dart';

import 'login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final viewModel = Provider.of<LoginViewModel>(context);
    viewModel.initialize(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('Customer Login'),
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
              SizedBox(height: size.height * 0.05),
              Text(
                AppStrings.login,
                style: CommonStyle.getInterFont(
                  fontSize: size.width * 0.1,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                AppStrings.welcomeback,
                style: CommonStyle.getInterFont(fontSize: size.width * 0.04),
              ),
              SizedBox(height: size.height * 0.04),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              CommonButton(
                text: 'Continue',
                backgroundColor: AppColors.grey,
                textColor: AppColors.white,
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomerBottomNav(),
                    ),
                  );
                },
              ),
              SizedBox(height: padding.bottom + size.height * 0.02),
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: CommonStyle.getInterFont(
                    color: AppColors.black,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: CommonStyle.getInterFont(
                        color: AppColors.orange,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {},
                    ),
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
