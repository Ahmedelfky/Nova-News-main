import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_assets.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/features/home/presentation/ui/home_screen.dart';
import 'package:news_app/features/onboarding/data/model/on_boarding_model.dart';
import 'package:news_app/features/onboarding/presentation/widgets/dot_onboarding.dart';
import 'package:news_app/features/onboarding/presentation/widgets/floating_widget.dart';
import 'package:news_app/shared/widgets/custom_elvat_bt.dart';
import 'package:news_app/shared/widgets/custom_row_data.dart';
import 'package:news_app/shared/widgets/custom_text_bt.dart';

import '../widgets/onboarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();

  int currentPage = 0;
  final List<OnBoardingModel> pageContent = [
    OnBoardingModel(
      title: "Stay Updated with Breaking News",
      description:
          "Experience journalism redefined. Personalized, real-time insights for the modern professional.",
      image: Image(image: AssetImage(AppAssets.onboarding1)),
    ),
    OnBoardingModel(
      title: "Read Trusted Stories Daily with Precision.",
      description:
          "In an era of noise, we curate signals. Experience journalism redefined through expert sourcing, rigorous fact-checking, and editorial integrity that respects your intelligence.",
      image: Image(image: AssetImage(AppAssets.onboarding2)),
    ),
    OnBoardingModel(
      title: "Personalized\nNews Feed for\nYou.",
      titleStyle: AppTextStyles.bodyLarge.copyWith(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      description:
          "Experience a revolutionary way to digest information. NovaNews utilizes advanced neural patterns to curate high-signal intelligence specifically for your professional trajectory.",

      layoutAlignment: CrossAxisAlignment.start,
      textAlign: TextAlign.start,
      image: Stack(
        clipBehavior: Clip.none,
        children: [
          Image(image: AssetImage(AppAssets.onboarding3)),
          Positioned(
            top: 20,
            right: 10,
            child: FloatingWidget(
              delay: const Duration(microseconds: 200),

              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),
                child: Row(
                  children: [
                    Icon(Icons.bolt, color: Colors.brown),
                    SizedBox(width: 8),
                    Text(
                      'REAL-TIME\n+12UPDATES',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 15,
            child: FloatingWidget(
              delay: const Duration(microseconds: 400),

              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),
                child: Text(
                  "INTELLIGENCE HUB",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      minTitle: Text(
        "The Final Step -",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 10,
          letterSpacing: 2.0,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
      extraInfo: Row(
        children: [
          Image(image: AssetImage(AppAssets.aiIcon), width: 20, height: 20),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Curated by AI",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              Text(
                "Sophisticated filtering for high-value insights.",
                style: TextStyle(fontSize: 10, color: AppColors.secondary),
              ),
              SizedBox(height: 4),
            ],
          ),
        ],
      ),
      extraInfo2: Row(
        children: [
          Image(image: AssetImage(AppAssets.rocketIcon), width: 20, height: 20),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Trusted Sources",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "Intelligence delivered at the speed of thought.",
                style: TextStyle(fontSize: 10, color: AppColors.secondary),
              ),
            ],
          ),
        ],
      ),
      btTerms: CustomRowData(
        text:
            'Join the global community of leaders.\nBy continuing, you agree to our ',
        style: TextStyle(fontSize: 10, color: AppColors.secondary),
        textButton: 'Terms & Privacy.',
        btStyle: TextStyle(
          fontSize: 10,
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
        onPressed: () {},
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Align(
                alignment: Alignment.topRight,
                child: CustomTextBt(
                  text: "Skip",
                  onPressed: () {
                    pageController.animateToPage(
                      pageContent.length - 1,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                  colorText: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: pageContent.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingItem(model: pageContent[index]);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pageContent.length,
                (index) =>
                    DotOnboarding(currentPage: currentPage, index: index),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomButton(
                    text: currentPage == 0
                        ? 'Next'
                        : currentPage == 1
                        ? 'Continue to Feed'
                        : 'Get Started ->',
                    onPressed: () {
                      if (currentPage == pageContent.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      } else {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),

                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
