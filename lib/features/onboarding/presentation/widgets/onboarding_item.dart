import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/features/onboarding/data/model/on_boarding_model.dart';

class OnboardingItem extends StatelessWidget {
  final OnBoardingModel model;

  const OnboardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: model.layoutAlignment,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: model.image,
              ),
              const SizedBox(height: 30),
              model.minTitle ?? SizedBox.shrink(),
              Text(
                model.title,
                textAlign: model.textAlign,
                style: AppTextStyles.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                model.description,
                textAlign: model.textAlign,
                style: AppTextStyles.labelLarge,
              ),
              const SizedBox(height: 30),
              model.extraInfo ?? SizedBox.shrink(),
              model.extraInfo2 ?? SizedBox.shrink(),
              const SizedBox(height: 30),
              const SizedBox(height: 20),
              const SizedBox(height: 16),
              model.btTerms ?? const SizedBox.shrink(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
