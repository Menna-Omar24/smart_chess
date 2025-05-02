import 'package:en_passant/features/on_boarding/view/widget/default_switch_onboarding.dart';
import 'package:en_passant/features/on_boarding/view/widget/default_switch_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_assets.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_size.dart';
import '../../auth/view/widget/custom_elevated_button.dart';
import 'on_boarding_view.dart';

class StartOnboardingView extends StatelessWidget {
  static const String routeName = 'start_onboarding';

  const StartOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppString.appTitle.tr,
          style: TextStyle(
            fontFamily: 'JockeyOne',
            fontWeight: FontWeight.bold,
            fontSize: AppFontSize.appTitle34,
            color: AppColor.primary,
          ),
        ),
      ),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                AppAssets.imageOnBoarding1,
                height: AppSize.imageOnBoarding,
              ),
              SizedBox(
                height: AppSize.sizeBox28,
              ),
              Text(
                AppString.titleWidgetBoarding1.tr,
                style: TextStyle(
                  fontSize: AppFontSize.titleStyle20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary,
                ),
              ),
              SizedBox(
                height: AppSize.sizeBox20,
              ),
              Text(
                textAlign: TextAlign.center,
                AppString.bodyBoarding1.tr,
                style: TextStyle(
                  fontSize: AppFontSize.bodyStyle16,
                  color: AppColor.black,
                ),
              ),
              SizedBox(
                height: AppSize.sizeBox28,
              ),
              DefaultSwitchOnboarding(
                labelSwitch: AppString.labelLanguage.tr,
                icon1: AppAssets.egy,
                icon2: AppAssets.us,
              ),
              SizedBox(
                height: AppSize.sizeBox28,
              ),
              DefaultSwitchTheme(
                labelSwitch: AppString.labelTheme.tr,
                icon1: AppAssets.lightIcon ,
                icon2: AppAssets.darkIcon,
              ),
              SizedBox(
                height: AppSize.sizeBox28,
              ),
              CustomElevatedButton(
                buttonText: AppString.buttonStart.tr,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => OnboardingScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
