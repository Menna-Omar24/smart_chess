import 'package:easy_localization/easy_localization.dart';
import 'package:en_passant/model/app_model.dart';
import 'package:en_passant/views/main_menu_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppModel(),
      child: Chess(),
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
  @override
  State<Chess> createState() => _ChessState();
}

class _ChessState extends State<Chess> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('==========================User is currently signed out!');
      } else {
        print('==========================User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      designSize: const Size(391, 840),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chess',
        theme: ThemeData(
          fontFamily: 'JockeyOne',
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),


        routes: {
          '/': (context) => MainMenuView(),
          MainMenuView.routeName: (context) => MainMenuView(),
          SplashView.routeName: (context) => const SplashView(),
          StartOnboardingView.routeName: (context) => const StartOnboardingView(),
          OnboardingScreen.routeName: (context) => OnboardingScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          LoginView.routeName: (context) => const LoginView(),
          RegisterView.routeName: (context) => const RegisterView(),
          ForgetPasswordView.routeName: (context) => const ForgetPasswordView(),
        },
        initialRoute: (FirebaseAuth.instance.currentUser != null &&
            FirebaseAuth.instance.currentUser!.emailVerified)
            ? MainMenuView.routeName
            : SplashView.routeName,
      ),
    );
  }
}
