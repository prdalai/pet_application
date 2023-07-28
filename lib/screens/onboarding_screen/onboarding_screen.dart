import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pet_application/common/colors.dart';
import 'package:pet_application/common/style.dart';
import 'package:pet_application/screens/onboarding_screen/get_user_info.dart';
import 'package:pet_application/services/navigation_service.dart';

import '../../common/sizeconfig.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: IntroductionScreen(
            next: Text(
              'Next',
              style: AppStyle().poppinsBoldPrimary20(),
            ),
            pages: [
              PageViewModel(
                title: 'Join in our pet community',
                body: 'Share your pet\'s life with other pet lovers!',
                image: Image.asset('assets/onboarding/onboard1.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Join in our pet community',
                body: 'Share your pet\'s life with other pet lovers!',
                image: Image.asset('assets/onboarding/onboard2.png'),
                decoration: getPageDecoration(),
              ),
            ],
            done: Text(
              'Get Started',
              style: AppStyle().poppinsBoldGeneral(AppColors.primaryColor, 16),
            ),
            onDone: () {
              NavigationService.navigateTo(
                  const GetUserInformationScreen(), context);
            },
          ),
        ),
      ),
    );
  }
}

PageDecoration getPageDecoration() {
  return PageDecoration(
      titleTextStyle: AppStyle().poppinsBoldPrimary20(),
      bodyTextStyle: AppStyle().poppinsBoldBlack20(),
      bodyPadding: const EdgeInsets.all(15),
      bodyAlignment: Alignment.center,
      imagePadding: const EdgeInsets.only(top: 30));
}
