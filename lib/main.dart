import 'package:en_passant/core/helpers/shared_pref_helper.dart';
import 'package:en_passant/core/services/local_storage_service.dart';
import 'package:en_passant/core/theme/app_theme.dart';
import 'package:en_passant/core/theme/theme_controller.dart';
import 'package:en_passant/model/app_model.dart';
import 'package:en_passant/views/main_menu_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Languages/languages.dart';
import 'features/auth/view/forget_password_view.dart';
import 'features/auth/view/login_view.dart';
import 'features/auth/view/register_view.dart';
import 'features/home/view/home_screen.dart';
import 'features/on_boarding/view/on_boarding_view.dart';
import 'features/on_boarding/view/start_onboarding_view.dart';
import 'features/splash/splash_view.dart';
import 'firebase_options.dart';
import 'logic/shared_functions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final savedLang = await LocalStorageService.getLanguage();
  final isDark = await LocalStorageService.getTheme();
  final isStartOnboardingShown =
      await SharedPrefHelper.hasSeenStartOnboarding();
  final isOnboardingSlidesSeen =
      await SharedPrefHelper.hasSeenOnboardingSlides();

  final ThemeController themeController = Get.put(ThemeController());
  isDark ? themeController.setDarkMode() : themeController.setLightMode();

  Get.updateLocale(Locale(savedLang));

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppModel(),
      child: Chess(
        savedLang: savedLang,
        isStartOnboardingShown: isStartOnboardingShown,
        isOnboardingSlidesSeen: isOnboardingSlidesSeen,
      ),
    ),
  );

  _loadFlameAssets();
}

void _loadFlameAssets() async {
  List<String> pieceImages = [];
  for (var theme in PIECE_THEMES) {
    for (var color in ['black', 'white']) {
      for (var piece in ['king', 'queen', 'rook', 'bishop', 'knight', 'pawn']) {
        pieceImages
            .add('pieces/${formatPieceTheme(theme)}/${piece}_$color.png');
      }
    }
  }
  await Flame.images.loadAll(pieceImages);
}

class Chess extends StatefulWidget {
  final String savedLang;
  final bool isStartOnboardingShown;
  final bool isOnboardingSlidesSeen;

  const Chess({
    super.key,
    required this.savedLang,
    required this.isStartOnboardingShown,
    required this.isOnboardingSlidesSeen,
  });

  @override
  State<Chess> createState() => _ChessState();
}

class _ChessState extends State<Chess> {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return ScreenUtilInit(
      designSize: const Size(391, 840),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => Obx(() => GetMaterialApp(
            translations: Languages(),
            locale: Locale(widget.savedLang),
            fallbackLocale: const Locale('en'),
            debugShowCheckedModeBanner: false,
            title: 'Chess',
            theme: AppTheme.isLight,
            darkTheme: AppTheme.isDark,
            themeMode: themeController.themeMode.value,
            routes: {
              '/': (context) => MainMenuView(),
              MainMenuView.routeName: (context) => MainMenuView(),
              SplashView.routeName: (context) => const SplashView(),
              StartOnboardingView.routeName: (context) =>
                  const StartOnboardingView(),
              OnboardingScreen.routeName: (context) => OnboardingScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
              LoginView.routeName: (context) => const LoginView(),
              RegisterView.routeName: (context) => const RegisterView(),
              ForgetPasswordView.routeName: (context) =>
                  const ForgetPasswordView(),
            },
           initialRoute: FirebaseAuth.instance.currentUser != null &&
        FirebaseAuth.instance.currentUser!.emailVerified
    ? MainMenuView.routeName
    : (!widget.isStartOnboardingShown
        ? StartOnboardingView.routeName
        : (!widget.isOnboardingSlidesSeen
            ? OnboardingScreen.routeName
            : SplashView.routeName)),
          )),
    );
  }
}
