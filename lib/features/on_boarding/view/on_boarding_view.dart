import 'package:en_passant/core/helpers/shared_pref_helper.dart';
import 'package:en_passant/core/localization/app_string.dart';
import 'package:en_passant/core/theme/app_assets.dart';
import 'package:en_passant/core/theme/app_color.dart';
import 'package:en_passant/core/theme/app_size.dart';
import 'package:en_passant/features/auth/view/login_view.dart';
import 'package:en_passant/core/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = 'onboarding';

  OnboardingScreen({super.key});

  static PageDecoration getPageDecoration() {
    return PageDecoration(
      titleTextStyle:
          TextStyle(fontSize: AppFontSize.title22, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: AppFontSize.bodyStyle16),
      imagePadding: REdgeInsets.all(20),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<PageViewModel> pages = [
      PageViewModel(
        titleWidget: Text(
          AppString.titleWidgetBoarding2.tr,
          style: TextStyle(
            fontSize: AppFontSize.titleStyle20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        bodyWidget: Text(
          AppString.bodyBoarding2.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        image: Center(
          child: Image.asset(
            AppAssets.imageOnBoarding2,
            height: AppSize.imageOnBoarding,
          ),
        ),
        decoration: getPageDecoration(),
      ),
      PageViewModel(
        titleWidget: Text(
          AppString.titleWidgetBoarding3.tr,
          style: TextStyle(
            fontSize: AppFontSize.titleStyle20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        bodyWidget: Text(
          AppString.bodyBoarding3.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        image: Center(
          child: Image.asset(
            AppAssets.imageOnBoarding3,
            height: AppSize.imageOnBoarding,
          ),
        ),
        decoration: getPageDecoration(),
      ),
      PageViewModel(
        titleWidget: Text(
          AppString.titleWidgetBoarding4.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppFontSize.titleStyle20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        bodyWidget: Text(
          AppString.bodyBoarding4.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        image: Center(
          child: Image.asset(
            AppAssets.imageOnBoarding4,
            height: AppSize.imageOnBoarding,
          ),
        ),
        decoration: getPageDecoration(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppString.appTitle.tr,
          style: TextStyle(
            fontFamily: 'JockeyOne',
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: AppFontSize.appTitle34,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Expanded(
            child: IntroductionScreen(
              pages: pages,
              showSkipButton: false,
              showBackButton: true,
              next: Container(
                padding: REdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: const Icon(Icons.arrow_forward,
                    color: AppColor.primaryDark),
              ),
              back: Container(
                padding: REdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                child:
                    const Icon(Icons.arrow_back, color: AppColor.primaryDark),
              ),
              done: Container(
                padding: REdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: const Icon(Icons.arrow_forward,
                    color: AppColor.primaryDark),
              ),
              dotsDecorator: DotsDecorator(
                size: Size(10.sp, 10.sp),
                color: Theme.of(context).colorScheme.onSecondary,
                activeSize: Size(22.sp, 10.sp),
                activeColor: Theme.of(context).colorScheme.primary,
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.r)),
                ),
              ),
              onDone: () async {
                // Set the onboarding completed flag in SharedPreferences
                await SharedPrefHelper.setOnboardingSlidesSeen();

                // Navigate to the login screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
