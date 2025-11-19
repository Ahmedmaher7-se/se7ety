import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/components/buttons/main_button.dart';
import 'package:se7ety/core/routes/navigation.dart';
import 'package:se7ety/core/routes/routes.dart';
import 'package:se7ety/core/services/local/shared_pref.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';
import 'package:se7ety/features/intro/onboarding/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          if (currentIndex != onboardingList.length - 1)
            TextButton(
              onPressed: () {
                SharedPref.setOnboardingScreen();
              },
              child: Text('تخطي'),
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Spacer(),
                      SvgPicture.asset(
                        onboardingList[index].imagePath,
                        width: MediaQuery.sizeOf(context).width * 0.8,
                      ),
                      Spacer(),
                      Text(
                        onboardingList[index].title,
                        style: TextStyles.title.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          onboardingList[index].description,
                          style: TextStyles.body,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Spacer(flex: 3),
                    ],
                  );
                },
                itemCount: onboardingList.length,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: onboardingList.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.primaryColor,
                      dotColor: AppColors.accentColor,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                  if (currentIndex == onboardingList.length - 1)
                    MainButton(
                      width: 120,
                      height: 50,
                      text: 'هيا بنا',
                      onPressed: () {
                        SharedPref.setOnboardingScreen();
                        pushWithReplacement(context, Routes.welcome);
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
