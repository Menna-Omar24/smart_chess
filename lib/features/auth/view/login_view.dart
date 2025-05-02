import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:en_passant/features/auth/view/widget/custom_elevated_button.dart';
import 'package:en_passant/features/auth/view/widget/custom_google_auth.dart';
import 'package:en_passant/features/auth/view/widget/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_assets.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_size.dart';

class LoginView extends StatefulWidget {
  static const String routeName = 'login';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailAddressLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        print('Google sign-in aborted');
        return;  // User canceled the sign-in process
      }

      // Obtain the authentication details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential for Firebase authentication
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase using the Google credentials
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to the home screen
      Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    } catch (e) {
      print('Error during Google Sign-In: $e');
      // Show an error dialog
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: AppString.error.tr,
        desc: AppString.desErrorAgain.tr,
        descTextStyle: TextStyle(
          color:   AppColor.black,
        ),
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: REdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.logo,
                    height: AppSize.imageLogo,
                  ),
                  Text(
                    AppString.appTitle.tr,
                    style: TextStyle(
                      fontFamily: 'JockeyOne',
                      color: AppColor.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: AppFontSize.appTitle34,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.sizeBox24,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return value.isEmpty
                            ? AppString.empty.tr
                            : AppString.invalidEmail.tr;
                      }
                    },
                    controller: emailAddressLogin,
                    labelText: AppString.labelEmail.tr,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(
                    height: AppSize.sizeBox16,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return value.isEmpty
                            ? AppString.empty.tr
                            : AppString.desPasswordLeast.tr;
                      }
                    },
                    controller: passwordLogin,
                    labelText: AppString.labelPassword.tr,
                    prefixIcon: Icons.lock,
                    suffixIcon: true,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: AppSize.sizeBox16,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('forget_password');
                      },
                      child: Text(
                        AppString.forgetPassword.tr,
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: AppFontSize.bodyStyle16,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.primary,
                          decorationThickness: 1.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSize.sizeBox16,
                  ),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          // Attempt to sign in with Firebase
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: emailAddressLogin.text,
                            password: passwordLogin.text,
                          );

                          // Show success dialog
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            title: AppString.success.tr,
                            desc: AppString.decSuccess.tr,

                            descTextStyle: TextStyle(
                              color:   AppColor.black,
                            ),
                            btnOkOnPress: () {
                              // Navigate to the home screen after the user presses "OK"
                              if (credential.user!.emailVerified) {
                                Navigator.of(context)
                                    .pushReplacementNamed('/');
                              } else {
                                FirebaseAuth.instance.currentUser!
                                    .sendEmailVerification();
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: AppString.error.tr,
                                  desc: AppString.decErrorVerified.tr,
                                  descTextStyle: TextStyle(
                                    color:   AppColor.black,
                                  ),
                                ).show();
                              }
                            },
                          ).show();
                        } on FirebaseAuthException catch (e) {
                          print('FirebaseAuthException caught: ${e.code}');
                          // Show error dialog for Firebase sign-in exceptions
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: AppString.error.tr,
                              titleTextStyle: TextStyle(
                                color: AppColor.black,
                              ),
                              desc: e.code == AppString.userNotFound
                                  ? AppString.desUserNotFound
                                  : e.code == AppString.wrongPassword
                                  ? AppString.desWrongPassword.tr
                                  : AppString.desErrorUnexpected.tr,
                              descTextStyle: TextStyle(
                                color:   AppColor.black,
                              ),
                            ).show();
                          });
                        }
                      } else {
                        print('Form is not valid');
                      }
                    },
                    buttonText:AppString.login.tr,
                  ),
                  SizedBox(
                    height: AppSize.sizeBox24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.haveAccount.tr,
                        style: TextStyle(
                          fontSize: AppFontSize.bodyStyle16,
                          color: AppColor.black
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('register');
                        },
                        child: Text(
                          AppString.createAccount.tr,
                          style: TextStyle(
                            color: AppColor.primary,
                            fontSize: AppFontSize.bodyStyle16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColor.primary,
                            decorationThickness: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColor.primary,
                        ),
                      ),
                      SizedBox(
                        width: AppSize.sizeBox16,
                      ),
                      Text(
                        AppString.or.tr,
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: AppFontSize.bodyStyle16,
                        ),
                      ),
                      SizedBox(
                        width: AppSize.sizeBox16,
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColor.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.sizeBox24,
                  ),
                  CustomGoogleAuth(
                    onTap: () {
                      signInWithGoogle();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}