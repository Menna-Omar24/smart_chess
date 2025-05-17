import 'package:flutter/material.dart';
import '../../core/localization/app_string.dart';
import '../../core/theme/app_assets.dart';
import '../../core/theme/app_size.dart';
import '../../features/auth/view/login_view.dart';
import '../../features/on_boarding/view/start_onboarding_view.dart';
import '../../core/helpers/shared_pref_helper.dart';

class SplashView extends StatefulWidget {
  static const String routeName = 'splash';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double opacity = 0;
  double scale = 0.8;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        opacity = 1;
        scale = 1;
      });
    });

    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 5));

    final hasSeenStartOnboarding = await SharedPrefHelper.hasSeenStartOnboarding();

    if (hasSeenStartOnboarding) {
      Navigator.pushReplacementNamed(context, LoginView.routeName);
    } else {
      Navigator.pushReplacementNamed(context, StartOnboardingView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 1000),
          opacity: opacity,
          child: AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.logo,
                  height: AppSize.imageLogo,
                ),
                SizedBox(height: AppSize.sizeBox16),
                Text(
                  AppString.appTitle,
                  style: TextStyle(
                    fontFamily: 'JockeyOne',
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSize.appTitle34,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
