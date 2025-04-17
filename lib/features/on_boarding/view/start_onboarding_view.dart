import 'package:en_passant/features/on_boarding/view/widget/default_switch_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          AppString.appTitle,
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
                AppString.titleWidgetBoarding1,
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
                AppString.bodyBoarding1,
                style: TextStyle(
                  fontSize: AppFontSize.bodyStyle16,
                ),
              ),
              SizedBox(
                height: AppSize.sizeBox28,
              ),
              const DefaultSwitchOnboarding(
                labelSwitch: AppString.labelLanguage,
                iconSwitch: Icons.language,
              ),
              const DefaultSwitchOnboarding(
                labelSwitch: AppString.labelTheme,
                iconSwitch: Icons.brightness_4,
              ),
              SizedBox(
                height: AppSize.sizeBox28,
              ),
              CustomElevatedButton(
                buttonText:AppString.buttonStart,
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
