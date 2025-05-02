import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:en_passant/features/auth/view/widget/custom_elevated_button.dart';
import 'package:en_passant/features/auth/view/widget/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_assets.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_size.dart';

class RegisterView extends StatefulWidget {
  static const String routeName = 'register';

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppString.register.tr,
          style: TextStyle(
            fontFamily: 'JockeyOne',
            color: AppColor.primary,
            fontWeight: FontWeight.bold,
            fontSize: AppFontSize.appTitle34,
          ),
        ),
      ),
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
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value.length < 3) {
                        return value.isEmpty
                            ? AppString.empty.tr
                            : AppString.desName.tr;
                      }
                    },
                    controller: name,
                    labelText: AppString.labelName.tr,
                    prefixIcon: Icons.person,
                  ),
                  SizedBox(
                    height: AppSize.sizeBox16,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return value.isEmpty
                            ? AppString.empty.tr
                            : AppString.invalidEmail.tr;
                      }
                    },
                    controller: emailAddress,
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
                    controller: password,
                    labelText: AppString.labelPassword.tr,
                    prefixIcon: Icons.lock,
                    suffixIcon: true,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: AppSize.sizeBox16,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value != password.text) {
                        return value.isEmpty
                            ? AppString.empty.tr
                            : AppString.passwordsDoNotMatch.tr;
                      }
                    },
                    controller: confirmPassword,
                    labelText: AppString.confirmPassword.tr,
                    prefixIcon: Icons.lock,
                    suffixIcon: true,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: AppSize.sizeBox16,
                  ),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailAddress.text,
                            password: password.text,
                          );
                          FirebaseAuth.instance.currentUser!
                              .sendEmailVerification();
                          Navigator.of(context).pushReplacementNamed('login');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == AppString.weakPassword.tr) {
                            print(AppString.weakPassword.tr);
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: AppString.error.tr,
                              desc: AppString.desWeakPassword.tr,
                            ).show();
                          } else if (e.code == AppString.emailAlreadyInUse) {
                            print(AppString.desEmailAlreadyInUse);
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: AppString.error.tr,
                              desc:
                                  AppString.desEmailAlreadyInUse.tr,
                            ).show();
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    buttonText: AppString.createAccount.tr,
                  ),
                  SizedBox(
                    height: AppSize.sizeBox24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.alreadyHaveAccount.tr,
                        style: TextStyle(
                          fontSize: AppFontSize.bodyStyle16,
                            color: AppColor.black
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('login');
                        },
                        child: Text(
                          AppString.login.tr,
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
                    ],
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
